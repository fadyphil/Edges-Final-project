import 'dart:developer';

import 'package:trip_planner/core/domain/entities/trip_entity.dart';
import 'package:trip_planner/core/domain/repo/trip_repository.dart';

class UpdateTripUseCase {
  final TripRepository _tripRepository;

  UpdateTripUseCase(this._tripRepository);

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
    if (trip.expenses.any((expense) => expense.amount <= 0)) {
      throw Exception('Expense amounts must be greater than 0');
    }

    try {
      await _tripRepository.updateTrip(trip);
    } catch (e) {
      log(
        '❌ ERROR in UpdateTripUseCase.call: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
    }
  }
}
