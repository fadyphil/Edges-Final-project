// lib/presentation/profile/bloc/profile_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/domain/entities/app_statistics._entity.dart';
import 'package:trip_planner/core/domain/entities/user_profile_entity.dart';
import 'package:trip_planner/core/domain/usecases/user%20profile%20use%20cases/clear_all_app_data_use_case.dart';
import 'package:trip_planner/core/domain/usecases/user%20profile%20use%20cases/get_app_statistics_use_case.dart';
import 'package:trip_planner/core/domain/usecases/user%20profile/get_user_profile_use_case.dart';
import 'package:trip_planner/core/domain/usecases/user%20profile/update_user_profile_use_case.dart';
import 'package:trip_planner/core/presentaion/blocs/api%20states/api_state.dart';
import 'package:trip_planner/core/presentaion/blocs/app%20status/app_status_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/favorite/favorites_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/my%20trips/my_trips_cubit.dart';

import './profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetUserProfileUseCase _getUserProfileUseCase;
  final GetAppStatisticsUseCase _getAppStatisticsUseCase;
  final UpdateUserProfileUseCase _updateUserProfileUseCase;
  final ClearAllAppDataUseCase _clearAllAppDataUseCase; // For clearing cache
  final AppStatusCubit _appStatusCubit; // For forcing onboarding
  final MyTripsCubit _myTripsCubit;
  final FavoritesCubit _favoritesCubit;

  ProfileCubit(
    this._getUserProfileUseCase,
    this._getAppStatisticsUseCase,
    this._updateUserProfileUseCase,
    this._clearAllAppDataUseCase,
    this._appStatusCubit,
    this._myTripsCubit,
    this._favoritesCubit,
  ) : super(ProfileState());

  /// Loads all necessary data for the profile screen in parallel.
  Future<void> loadProfileData() async {
    // Set both states to loading
    emit(
      state.copyWith(
        userProfileState: const ApiState.loading(),
        statisticsState: const ApiState.loading(),
      ),
    );

    try {
      // Execute both data-fetching use cases concurrently for speed.
      final results = await Future.wait([
        _getUserProfileUseCase(),
        _getAppStatisticsUseCase(),
      ]);

      // Safely get the results
      final userProfile = results[0] as UserProfile?;
      final statistics = results[1] as AppStatistics;

      if (userProfile == null) {
        throw Exception('user profile  not found finish on boarding');
      }

      // Emit the final success states with the fetched data.
      emit(
        state.copyWith(
          userProfileState: ApiState.success(data: userProfile),
          statisticsState: ApiState.success(data: statistics),
        ),
      );
    } catch (e) {
      // If anything fails, put both states into an error mode.
      emit(
        state.copyWith(
          userProfileState: ApiState.error(
            message: "Failed to load profile: ${e.toString()}",
          ),
          statisticsState: ApiState.error(
            message: "Failed to load statistics: ${e.toString()}",
          ),
        ),
      );
    }
  }

  /// Clears all user-generated data from the app.
  Future<void> clearAllData() async {
    emit(state.copyWith(actionState: const ApiState.loading()));
    try {
      await _clearAllAppDataUseCase();
      _myTripsCubit.clear();
      _favoritesCubit.clear();

      emit(state.copyWith(actionState: const ApiState.success(data: null)));

      // After clearing, reload the screen to show the empty state.
      _appStatusCubit.dataCleared();
    } catch (e) {
      emit(state.copyWith(actionState: ApiState.error(message: e.toString())));
    }
  }

  Future<void> updateUserName(String newName) async {
    // Use whenOrNull to safely get the current user profile
    await state.userProfileState.whenOrNull(
      success: (currentUserProfile) async {
        // Don't do anything if the name hasn't changed
        if (currentUserProfile.name == newName.trim()) return;

        emit(state.copyWith(actionState: const ApiState.loading()));
        try {
          // Create an updated profile object using the 'copyWith' method from freezed
          final updatedProfile = currentUserProfile.copyWith(
            name: newName.trim(),
          );

          // Call the use case to persist the changes
          await _updateUserProfileUseCase(updatedProfile);

          emit(state.copyWith(actionState: const ApiState.success(data: null)));

          // After updating, reload all data to ensure consistency
          await loadProfileData();
        } catch (e) {
          emit(
            state.copyWith(actionState: ApiState.error(message: e.toString())),
          );
        }
      },
    );
  }

  Future<void> updateUserCurrency(String newCurrency) async {
    await state.userProfileState.whenOrNull(
      success: (currentUserProfile) async {
        if (currentUserProfile.preferredCurrency == newCurrency) return;

        emit(state.copyWith(actionState: const ApiState.loading()));
        try {
          final updatedProfile = currentUserProfile.copyWith(
            preferredCurrency: newCurrency,
          );
          await _updateUserProfileUseCase(updatedProfile);
          emit(state.copyWith(actionState: const ApiState.success(data: null)));
          await loadProfileData();
        } catch (e) {
          emit(
            state.copyWith(actionState: ApiState.error(message: e.toString())),
          );
        }
      },
    );
  }
}
