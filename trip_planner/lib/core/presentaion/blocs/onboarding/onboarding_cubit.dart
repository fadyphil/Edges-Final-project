// lib/presentation/onboarding/bloc/onboarding_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/presentaion/blocs/api%20states/api_state.dart';
import 'package:trip_planner/core/domain/entities/user_profile_entity.dart';
import 'package:trip_planner/core/domain/usecases/user%20profile/save_user_profile_use_case.dart';
import './onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final SaveUserProfileUseCase _saveUserProfileUseCase;

  OnboardingCubit(this._saveUserProfileUseCase)
    : super(const OnboardingState());

  /// Called by the PageView when the user swipes to a new page.
  void pageChanged(int page) {
    emit(state.copyWith(currentStep: page));
    _validateStep();
  }

  /// Called by the TextField in the "Name" step.
  void nameChanged(String name) {
    emit(state.copyWith(name: name));
    _validateStep();
  }

  /// Called by the Dropdown in the "Currency" step.
  void currencyChanged(String currency) {
    emit(state.copyWith(currency: currency));
    _validateStep();
  }

  /// Called by the FilterChips in the "Interests" step.
  void toggleInterest(String interest) {
    // Create a new list to ensure immutability
    final newInterests = List<String>.from(state.interests);
    if (newInterests.contains(interest)) {
      newInterests.remove(interest);
    } else {
      newInterests.add(interest);
    }
    emit(state.copyWith(interests: newInterests));
    _validateStep();
  }

  /// Centralized validation logic that runs whenever an input changes.
  void _validateStep() {
    bool isValid = false;
    switch (state.currentStep) {
      case 0: // Name step
        isValid = state.name.trim().length > 1;
        break;
      case 1: // Currency step is always valid as it has a default.
        isValid = true;
        break;
      case 2: // Interests step requires at least one selection.
        isValid = state.interests.isNotEmpty;
        break;
    }
    emit(state.copyWith(canContinue: isValid));
  }

  /// Called when the user taps the final "Let's Go!" button.
  Future<void> completeOnboarding() async {
    // Prevent multiple submissions
    final isLoading = state.submissionState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );
    if (isLoading) return;

    emit(state.copyWith(submissionState: const ApiState.loading()));
    try {
      // Construct the UserProfile object from the current state.
      final userProfile = UserProfile(
        // Use a default name if the user skipped the first step.
        name: state.name.trim().isEmpty ? 'Traveler' : state.name.trim(),
        preferredCurrency: state.currency,
        tavelInterests: state.interests,
        onboardingCompleted: true, // This is the crucial flag!
      );

      // Call the use case to persist the data.
      await _saveUserProfileUseCase(userProfile);

      // Emit a success state to signal the UI to navigate.
      emit(state.copyWith(submissionState: const ApiState.success(data: null)));
    } catch (e) {
      emit(
        state.copyWith(submissionState: ApiState.error(message: e.toString())),
      );
    }
  }
}
