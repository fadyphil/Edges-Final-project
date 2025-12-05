// lib/presentation/initial_screen/bloc/app_status_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/domain/usecases/user%20profile/get_user_profile_use_case.dart';
import './app_status_state.dart';

class AppStatusCubit extends Cubit<AppStatusState> {
  final GetUserProfileUseCase _getUserProfileUseCase;

  AppStatusCubit(this._getUserProfileUseCase)
    : super(const AppStatusState.initial());

  Future<void> checkOnboardingStatus() async {
    // A small delay can prevent a jarring flash if the check is too fast.
    await Future.delayed(const Duration(seconds: 1));
    try {
      final userProfile = await _getUserProfileUseCase();
      if (userProfile != null && userProfile.onboardingCompleted) {
        emit(const AppStatusState.authenticated());
      } else {
        emit(const AppStatusState.onboardingRequired());
      }
    } catch (e) {
      // If there's an error, default to requiring onboarding.
      emit(const AppStatusState.onboardingRequired());
    }
  }

  void forceOnboarding() {
    emit(const AppStatusState.onboardingRequired());
  }

  void dataCleared() {
    emit(const AppStatusState.initial());
    checkOnboardingStatus();
  }
}
