// lib/core/domain/usecases/stats_use_cases/get_app_statistics_use_case.dart
import 'dart:developer';

import 'package:trip_planner/core/domain/entities/app_statistics._entity.dart';
import 'package:trip_planner/core/domain/repo/favorites_repository.dart';
import 'package:trip_planner/features/trip/domain/repos/trip_repository.dart';

class GetAppStatisticsUseCase {
  final TripRepository _tripRepository;
  final FavoritesRepository _favoritesRepository;

  GetAppStatisticsUseCase(this._tripRepository, this._favoritesRepository);

  /// Fetches data from multiple sources and calculates app-wide statistics.
  Future<AppStatistics> call() async {
    try {
      // 1. Fetch all necessary data in parallel for maximum efficiency.
      final results = await Future.wait([
        _tripRepository.getTrips(),
        _favoritesRepository.getFavoriteDestinationIds(),
      ]);

      // 2. Safely cast the results.
      final allTrips = results[0] as List<dynamic>; // List<Trip>
      final favoriteIds = results[1] as List<dynamic>; // List<String>

      // 3. Perform the calculations.
      final totalTripsPlanned = allTrips.length;
      final favoritesCount = favoriteIds.length;

      // To find unique countries, we put the destination IDs into a Set.
      final countriesExplored = allTrips
          .map((trip) => trip.destinationId)
          .toSet()
          .length;

      // 4. Return the final, calculated model.
      return AppStatistics(
        totalTripsPlanned: totalTripsPlanned,
        countriesExplored: countriesExplored,
        favoritesCount: favoritesCount,
      );
    } catch (e) {
      log(
        '❌ ERROR in GetAppStatisticsUseCase: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
      // On failure, return a default object with zero values.
      return AppStatistics(
        totalTripsPlanned: 0,
        countriesExplored: 0,
        favoritesCount: 0,
      );
    }
  }
}
