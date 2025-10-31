import 'package:trip_planner/core/domain/repo/favorites_repository.dart';

class GetFavoriteIdsUseCase {
  final FavoritesRepository _repository;
  GetFavoriteIdsUseCase(this._repository);
  Future<List<String>> call() => _repository.getFavoriteDestinationIds();
}
