import 'package:trip_planner/core/domain/repo/favorites_repository.dart';

class RemoveFromFavoritesUseCase {
  final FavoritesRepository _repository;
  RemoveFromFavoritesUseCase(this._repository);
  Future<void> call(String destinationId) =>
      _repository.removeFavoriteDestination(destinationId);
}
