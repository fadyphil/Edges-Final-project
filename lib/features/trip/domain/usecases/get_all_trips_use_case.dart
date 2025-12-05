import 'package:trip_planner/features/trip/domain/entities/trip_entity.dart';
import 'package:trip_planner/features/trip/domain/repos/trip_repository.dart';

class GetAllTripsUseCase {
  final TripRepository _tripRepository;

  GetAllTripsUseCase(this._tripRepository);

  Future<List<Trip>> call() async {
    return await _tripRepository.getTrips();
  }
}
