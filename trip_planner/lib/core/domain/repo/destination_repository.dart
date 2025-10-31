import 'package:trip_planner/core/domain/entities/destination_entity.dart';

abstract class DestinationRepository {
  Future<List<Destination>> getDestinations({bool forceRefresh = false});
  Future<Destination?> getDestinationById(String id);
  Future<List<Destination>> getDestinationsByIds(List<String> ids);
}
