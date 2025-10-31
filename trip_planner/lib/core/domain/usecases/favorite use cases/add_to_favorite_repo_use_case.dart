import 'package:trip_planner/core/domain/repo/favorites_repository.dart';

class AddToFavoritesUseCase {
  final FavoritesRepository _favoritesRepository;

  AddToFavoritesUseCase(this._favoritesRepository);

  Future<void> call(String destinationId) async {
    await _favoritesRepository.addFavoriteDestination(destinationId);
  }
}
