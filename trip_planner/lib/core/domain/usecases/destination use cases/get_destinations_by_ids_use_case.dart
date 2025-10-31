// lib/core/domain/usecases/destination use cases/get_destinations_by_ids_use_case.dart
import 'package:trip_planner/core/domain/entities/destination_entity.dart';
import 'package:trip_planner/core/domain/repo/destination_repository.dart';

class GetDestinationsByIdsUseCase {
  final DestinationRepository _repository;
  GetDestinationsByIdsUseCase(this._repository);

  Future<List<Destination>> call(List<String> ids) {
    if (ids.isEmpty) {
      return Future.value([]);
    }
    return _repository.getDestinationsByIds(ids);
  }
}
