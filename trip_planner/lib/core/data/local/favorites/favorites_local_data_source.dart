import 'package:trip_planner/core/data/local/favorites/favorite_db_entity.dart';
import 'package:trip_planner/objectbox.g.dart';

abstract class FavoritesLocalDataSource {
  Future<List<String>> getAllFavoriteIds();
  Future<void> addFavorite(String destinationId);
  Future<void> removeFavorite(String destinationId);
  Future<bool> isFavorite(String destinationId);
  Future<void> clearAllFavorites();
}

class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  final Box<FavoriteDbEntity> _favoriteBox;

  FavoritesLocalDataSourceImpl(Store store)
    : _favoriteBox = store.box<FavoriteDbEntity>();

  @override
  Future<void> addFavorite(String destinationId) async {
    final isAlreadyFavorite = await isFavorite(destinationId);
    if (!isAlreadyFavorite) {
      final favorite = FavoriteDbEntity(destinationId: destinationId);
      _favoriteBox.put(favorite);
    }
  }

  @override
  Future<void> removeFavorite(String destinationId) async {
    final query = _favoriteBox
        .query(FavoriteDbEntity_.destinationId.equals(destinationId))
        .build();
    final favorite = query.findFirst();
    if (favorite != null) {
      _favoriteBox.remove(favorite.id);
    }
  }

  @override
  Future<bool> isFavorite(String destinationId) async {
    final query = _favoriteBox
        .query(FavoriteDbEntity_.destinationId.equals(destinationId))
        .build();
    final exists = query.findFirst() != null;
    query.close();
    return exists;
  }

  @override
  Future<List<String>> getAllFavoriteIds() async {
    final allFavorites = _favoriteBox.getAll();
    return allFavorites.map((favorite) => favorite.destinationId).toList();
  }

  @override
  Future<void> clearAllFavorites() async {
    _favoriteBox.removeAll();
  }
}
