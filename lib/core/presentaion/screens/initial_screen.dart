// lib/presentation/initial_screen/initial_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/presentaion/blocs/app%20status/app_status_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/app%20status/app_status_state.dart';
import 'package:trip_planner/core/presentaion/screens/onboarding_screen.dart';
import 'package:trip_planner/core/presentaion/shell/app_shell.dart';
import 'package:trip_planner/core/di/service_locator.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Create the cubit and immediately kick off the check.
      create: (context) => sl<AppStatusCubit>()..checkOnboardingStatus(),
      // Use a BlocListener for the "one-time" action of navigation.
      child: BlocListener<AppStatusCubit, AppStatusState>(
        listener: (context, state) {
          // Use .when to react to the specific states from the cubit.
          state.when(
            initial: () {
              // Do nothing while in the initial state.
            },
            onboardingRequired: () {
              // Navigate to Onboarding and replace this screen in the stack.
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const OnboardingScreen()),
              );
            },
            authenticated: () {
              // Navigate to the main Explore screen and replace this one.
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const AppShell()),
              );
            },
          );
        },
        // The actual UI for this screen.
        child: const Scaffold(body: Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
