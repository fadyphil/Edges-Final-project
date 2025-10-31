// lib/core/data/local/destination_local_data_source.dart
import 'package:trip_planner/core/data/local/destinations/destination_db_entity.dart';
import 'package:trip_planner/objectbox.g.dart';

class DestinationLocalDataSource {
  final Box<DestinationDbEntity> _box;

  DestinationLocalDataSource(Store store)
    : _box = store.box<DestinationDbEntity>();

  // Get all destinations from the cache
  Future<List<DestinationDbEntity>> getAllDestinations() async {
    return _box.getAll();
  }

  // Get specific destinations by their unique IDs (cca3 codes)
  Future<List<DestinationDbEntity>> getDestinationsByIds(
    List<String> ids,
  ) async {
    final query = _box.query(DestinationDbEntity_.uniqueId.oneOf(ids)).build();
    final results = query.find();
    query.close();
    return results;
  }

  Future<DestinationDbEntity?> getDestinationById(String id) async {
    final query = _box.query(DestinationDbEntity_.uniqueId.equals(id)).build();
    final results = query.findFirst();
    query.close();
    return results;
  }

  // Save a list of destinations to the cache
  Future<void> cacheDestinations(List<DestinationDbEntity> destinations) async {
    // 'putMany' is a highly efficient way to insert/update multiple objects at once.
    _box.putMany(destinations);
  }
}
