// lib/presentation/initial_screen/bloc/app_status_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_status_state.freezed.dart';

@freezed
abstract class AppStatusState with _$AppStatusState {
  const factory AppStatusState.initial() = _Initial;
  const factory AppStatusState.onboardingRequired() = _OnboardingRequired;
  const factory AppStatusState.authenticated() = _Authenticated;
}
