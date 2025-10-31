// lib/core/domain/usecases/app_data_use_cases/clear_all_app_data_use_case.dart

import 'dart:developer';

import 'package:trip_planner/core/domain/repo/favorites_repository.dart';
import 'package:trip_planner/core/domain/repo/trip_repository.dart';
import 'package:trip_planner/core/domain/repo/user_repository.dart';

class ClearAllAppDataUseCase {
  final TripRepository _tripRepository;
  final FavoritesRepository _favoritesRepository;
  final UserRepository _userRepository;

  ClearAllAppDataUseCase(
    this._tripRepository,
    this._favoritesRepository,
    this._userRepository,
  );

  /// Clears all user-generated data from the application,
  /// including trips, favorites, and the user profile.
  Future<void> call() async {
    try {
      // Execute all clearing operations in parallel for speed.
      await Future.wait([
        _tripRepository.clearAllTrips(),
        _favoritesRepository.clearAllFavorites(),
        _userRepository.clearUserProfile(),
      ]);
    } catch (e) {
      log(
        '❌ ERROR in ClearAllAppDataUseCase: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
    }
  }
}
