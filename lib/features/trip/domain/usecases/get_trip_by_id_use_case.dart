import 'dart:developer';

import 'package:trip_planner/features/trip/domain/entities/trip_entity.dart';
import 'package:trip_planner/features/trip/domain/repos/trip_repository.dart';

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
