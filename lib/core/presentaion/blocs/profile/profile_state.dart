// lib/presentation/profile/bloc/profile_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_planner/core/domain/entities/app_statistics._entity.dart';

import 'package:trip_planner/core/domain/entities/user_profile_entity.dart';
import 'package:trip_planner/core/presentation/blocs/api_states/api_state.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    /// Manages the loading/success/error state for the user's profile info.
    @Default(ApiState.initial()) ApiState<UserProfile> userProfileState,

    /// Manages the loading/success/error state for the calculated app statistics.
    @Default(ApiState.initial()) ApiState<AppStatistics> statisticsState,

    /// Manages the state of any update or clear operations.
    @Default(ApiState.initial()) ApiState<void> actionState,
  }) = _ProfileState;
}
