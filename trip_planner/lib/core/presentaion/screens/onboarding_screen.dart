// lib/presentation/onboarding/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Add this package
import 'package:trip_planner/core/presentaion/blocs/onboarding/onboarding_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/onboarding/onboarding_state.dart';
import 'package:trip_planner/core/presentaion/screens/initial_screen.dart';
import 'package:trip_planner/core/presentaion/widgets/onboarding%20%20screens/onboarding_step_1.dart';
import 'package:trip_planner/core/presentaion/widgets/onboarding%20%20screens/onboarding_step_2.dart';
import 'package:trip_planner/core/presentaion/widgets/onboarding%20%20screens/onboarding_step_3.dart';
import 'package:trip_planner/core/di/service_locator.dart';
import 'package:trip_planner/core/presentation/blocs/api_states/api_state.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OnboardingCubit>(),
      // BlocListener is crucial for handling navigation and other "one-time" events.
      child: BlocListener<OnboardingCubit, OnboardingState>(
        // We only want the listener to react to the submission state.
        listenWhen: (previous, current) =>
            previous.submissionState != current.submissionState,
        listener: (context, state) {
          state.submissionState.whenOrNull(
            success: (_) {
              // On successful save, navigate to the ExploreScreen and remove
              // the onboarding screen from the back stack.
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const InitialScreen()),
              );
            },
            error: (message) {
              // Show an error message if saving fails.
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to save preferences: $message')),
              );
            },
          );
        },
        child: const _OnboardingView(),
      ),
    );
  }
}

class _OnboardingView extends StatefulWidget {
  const _OnboardingView();

  @override
  State<_OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<_OnboardingView> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _skipOnboarding() {
    // When skipping, we still call completeOnboarding.
    // The cubit will use default values.
    context.read<OnboardingCubit>().completeOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // --- Header: Progress Dots and Skip Button ---
            _buildHeader(context),

            // --- The PageView for the Steps ---
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (page) =>
                    context.read<OnboardingCubit>().pageChanged(page),
                children: const [
                  OnboardingStepName(),
                  OnboardingStepCurrency(),
                  OnboardingStepInterests(),
                ],
              ),
            ),

            // --- Footer: Continue Button ---
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // The smooth page indicator for the progress dots
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: WormEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Theme.of(context).colorScheme.secondary,
              dotColor: Colors.grey.shade300,
            ),
          ),
          // The skip button
          TextButton(onPressed: _skipOnboarding, child: const Text('Skip')),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      // Rebuild the button only when these specific properties change
      buildWhen: (prev, curr) =>
          prev.canContinue != curr.canContinue ||
          prev.currentStep != curr.currentStep ||
          prev.submissionState != curr.submissionState,
      builder: (context, state) {
        final isSubmitting = state.submissionState.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: state.canContinue && !isSubmitting
                  ? () {
                      if (state.currentStep == 2) {
                        // Final step: trigger the save operation in the cubit.
                        // The BlocListener will handle the navigation.
                        context.read<OnboardingCubit>().completeOnboarding();
                      } else {
                        _goToNextPage();
                      }
                    }
                  : null, // Button is disabled if form is invalid or submitting
              child: isSubmitting
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(state.currentStep == 2 ? "Let's Go!" : 'Continue'),
            ),
          ),
        );
      },
    );
  }
}
