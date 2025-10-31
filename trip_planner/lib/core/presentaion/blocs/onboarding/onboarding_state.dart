// lib/presentation/onboarding/bloc/onboarding_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_planner/core/presentation/blocs/api_states/api_state.dart';

part 'onboarding_state.freezed.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    // Tracks the current page of the PageView (0, 1, 2)
    @Default(0) int currentStep,

    // --- Data gathered from the user ---
    @Default('') String name,
    @Default('USD') String currency, // Default to USD
    @Default([]) List<String> interests,

    // --- UI Control Flags ---
    // Controls the enabled/disabled state of the 'Continue' button
    @Default(false) bool canContinue,

    // Manages the state of the final save operation
    @Default(ApiState.initial()) ApiState<void> submissionState,
  }) = _OnboardingState;
}
