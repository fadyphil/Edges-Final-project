import 'package:trip_planner/core/domain/entities/destination_entity.dart';
import 'package:trip_planner/core/domain/repo/destination_repository.dart';

class GetDestinationsUseCase {
  final DestinationRepository destinationRepository;

  GetDestinationsUseCase(this.destinationRepository);

  Future<List<Destination>> call({bool forceRefresh = false}) async {
    try {
      final baseDestinations = await destinationRepository.getDestinations(
        forceRefresh: forceRefresh,
      );
      if (baseDestinations.isEmpty) {
        return [];
      }
      return baseDestinations;
    } catch (e) {
      return [];
    }
  }
}
