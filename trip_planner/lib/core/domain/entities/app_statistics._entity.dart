// lib/core/domain/entities/app_statistics_entity.dart

class AppStatistics {
  final int totalTripsPlanned;
  final int countriesExplored;
  final int favoritesCount;

  AppStatistics({
    required this.totalTripsPlanned,
    required this.countriesExplored,
    required this.favoritesCount,
  });
}
