import 'dart:developer';

import 'package:trip_planner/core/domain/repo/exchange_rate_repository.dart';
import 'package:trip_planner/core/domain/repo/favorites_repository.dart';
import 'package:trip_planner/core/domain/repo/theme_repository.dart';
import 'package:trip_planner/core/domain/repo/user_repository.dart';
import 'package:trip_planner/features/trip/domain/repos/trip_repository.dart';

class ClearAllAppDataUseCase {
  final TripRepository _tripRepository;
  final FavoritesRepository _favoritesRepository;
  final UserRepository _userRepository;
  final ThemeRepository _themeRepository;
  final ExchangeRateRepository _exchangeRateRepository;

  ClearAllAppDataUseCase(
    this._tripRepository,
    this._favoritesRepository,
    this._userRepository,
    this._themeRepository,
    this._exchangeRateRepository,
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
        _themeRepository.clearAll(),
        _exchangeRateRepository.clearAll(),
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
