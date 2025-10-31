// lib/presentation/auth_gate/auth_gate.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/presentaion/blocs/app%20status/app_status_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/app%20status/app_status_state.dart';
import 'package:trip_planner/core/presentaion/screens/onboarding_screen.dart';
import 'package:trip_planner/core/presentaion/shell/app_shell.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    // We use BlocBuilder because we want to BUILD a different UI based on the state.
    return BlocBuilder<AppStatusCubit, AppStatusState>(
      builder: (context, state) {
        // Use .when() for a clean, exhaustive check of all possible states.
        return state.when(
          initial: () {
            // While the cubit is checking, show a loading screen.
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          },
          onboardingRequired: () {
            // If onboarding is required, build the OnboardingScreen.
            return const OnboardingScreen();
          },
          authenticated: () {
            // If the user is authenticated, build the main AppShell.
            return const AppShell();
          },
        );
      },
    );
  }
}
