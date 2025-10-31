import 'dart:developer';

import 'package:trip_planner/features/destination/domain/entities/destination_entity.dart';
import 'package:trip_planner/features/destination/domain/repos/destination_repository.dart';

class GetDestinationByIdUseCase {
  final DestinationRepository _destinationRepository;

  GetDestinationByIdUseCase(this._destinationRepository);

  Future<Destination?> call(String destinationId) async {
    try {
      return await _destinationRepository.getDestinationById(destinationId);
    } catch (e) {
      log(
        '❌ ERROR in GetDestinationByIdUseCase.call: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
      return null;
    }
  }
}
