import 'dart:developer';

import 'package:trip_planner/core/domain/entities/trip_entity.dart';
import 'package:trip_planner/core/domain/repo/trip_repository.dart';

class SaveTripUseCase {
  final TripRepository _tripRepository;

  SaveTripUseCase(this._tripRepository);

  Future<void> call(Trip trip) async {
    if (trip.tripName.trim().isEmpty) {
      throw Exception('Trip name cannot be empty');
    }
    if (trip.startDate.isAfter(trip.endDate)) {
      throw Exception('Start date cannot be after end date');
    }
    if (trip.budget.amount <= 0) {
      throw Exception('Budget must be greater than 0');
    }
    try {
      await _tripRepository.saveTrip(trip);
    } catch (e) {
      log(
        '❌ ERROR in SaveTripUseCase.call: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
    }
  }
}
