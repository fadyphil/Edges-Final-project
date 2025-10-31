abstract class FavoritesRepository {
  Future<List<String>> getFavoriteDestinationIds();
  Future<void> addFavoriteDestination(String destinationId);
  Future<void> removeFavoriteDestination(String destinationId);
  Future<void> clearAllFavorites();
}
