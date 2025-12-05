// lib/presentation/onboarding/widgets/onboarding_step_interests.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/presentaion/blocs/onboarding/onboarding_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/onboarding/onboarding_state.dart';

class OnboardingStepInterests extends StatelessWidget {
  const OnboardingStepInterests({super.key});

  // A predefined list of interests for the user to choose from.
  static const List<String> _allInterests = [
    'Beach',
    'Mountain',
    'Culture',
    'Food',
    'Adventure',
    'Lake',
    'Wildlife',
    'Shopping',
    'History',
    'Nightlife',
    'Museums',
    'Hiking',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // The decorative icon from the design
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(
                context,
              ).colorScheme.secondary.withValues(alpha: .1),
            ),
            child: Icon(
              Icons.interests_outlined,
              size: 48,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 32),

          // The main headline
          Text(
            "Your Interests",
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // The descriptive sub-headline
          Text(
            "Select a few to personalize your experience",
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 32),

          // The Wrap of FilterChips, rebuilt by the BlocBuilder
          BlocBuilder<OnboardingCubit, OnboardingState>(
            buildWhen: (previous, current) =>
                previous.interests != current.interests,
            builder: (context, state) {
              return Wrap(
                spacing: 12.0, // Horizontal space between chips
                runSpacing: 12.0, // Vertical space between lines of chips
                alignment: WrapAlignment.center,
                children: _allInterests.map((interest) {
                  final isSelected = state.interests.contains(interest);
                  return FilterChip(
                    label: Text(interest),
                    // Check the state to determine if this chip is selected
                    selected: isSelected,
                    onSelected: (bool selected) {
                      // This is the connection to the cubit.
                      context.read<OnboardingCubit>().toggleInterest(interest);
                    },
                    // Use theme colors for a consistent look
                    selectedColor: Theme.of(context).colorScheme.secondary,
                    labelStyle: TextStyle(
                      color: isSelected
                          ? Theme.of(context).colorScheme.onSecondary
                          : null,
                    ),
                    checkmarkColor: isSelected
                        ? Theme.of(context).colorScheme.onSecondary
                        : null,
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
