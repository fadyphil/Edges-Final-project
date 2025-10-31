import 'dart:developer';

import 'package:trip_planner/core/domain/entities/trip_entity.dart';
import 'package:trip_planner/core/domain/repo/trip_repository.dart';

class GetTripByIdUseCase {
  final TripRepository _tripRepository;

  GetTripByIdUseCase(this._tripRepository);

  Future<Trip?> call(String tripId) async {
    try {
      return await _tripRepository.getTripById(tripId);
    } catch (e) {
      log(
        '❌ ERROR in GetTripByIdUseCase.call: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
      return null;
    }
  }
}
