// lib/presentation/onboarding/widgets/onboarding_step_name.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/presentaion/blocs/onboarding/onboarding_cubit.dart';

class OnboardingStepName extends StatefulWidget {
  const OnboardingStepName({super.key});

  @override
  State<OnboardingStepName> createState() => _OnboardingStepNameState();
}

class _OnboardingStepNameState extends State<OnboardingStepName> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    // Initialize the controller and set its initial text from the cubit's state.
    // This handles the case where a user swipes back to this page.
    _nameController = TextEditingController(
      text: context.read<OnboardingCubit>().state.name,
    );
  }

  @override
  void dispose() {
    // Always dispose of controllers to prevent memory leaks.
    _nameController.dispose();
    super.dispose();
  }

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
              Icons.waving_hand_rounded,
              size: 48,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 32),

          // The main headline
          Text(
            "Welcome! What should we call you?",
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // The text field for input
          TextField(
            controller: _nameController,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
            decoration: InputDecoration(
              hintText: 'Enter your name',
              border: InputBorder.none, // For a cleaner look
              filled: false,
            ),
            onChanged: (value) {
              // This is the connection to the cubit.
              // It sends the latest text to the state manager on every keystroke.
              context.read<OnboardingCubit>().nameChanged(value);
            },
          ),
        ],
      ),
    );
  }
}
