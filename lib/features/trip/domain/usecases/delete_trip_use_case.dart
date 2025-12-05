import 'dart:developer';

import 'package:trip_planner/features/trip/domain/repos/trip_repository.dart';

class DeleteTripUseCase {
  final TripRepository _tripRepository;

  DeleteTripUseCase(this._tripRepository);

  Future<void> call(String tripId) async {
    if (tripId.isEmpty) {
      throw Exception('Trip ID cannot be empty');
    }

    try {
      await _tripRepository.deleteTrip(tripId);
    } catch (e) {
      log(
        '❌ ERROR in DeleteTripUseCase.call: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
    }
  }
}
