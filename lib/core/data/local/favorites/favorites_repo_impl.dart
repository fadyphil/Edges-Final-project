import 'dart:developer';

import 'package:trip_planner/core/data/local/favorites/favorites_local_data_source.dart';
import 'package:trip_planner/core/domain/repo/favorites_repository.dart';

class FavoritesRepoImpl implements FavoritesRepository {
  final FavoritesLocalDataSource _favoritesLocalDataSource;

  FavoritesRepoImpl(this._favoritesLocalDataSource);

  @override
  Future<void> addFavoriteDestination(String destinationId) async {
    try {
      await _favoritesLocalDataSource.addFavorite(destinationId);
    } catch (e) {
      log(
        'error adding favorite: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
    }
  }

  @override
  Future<List<String>> getFavoriteDestinationIds() async {
    try {
      return await _favoritesLocalDataSource.getAllFavoriteIds();
    } catch (e) {
      log(
        'error getting favorites: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
      return [];
    }
  }

  @override
  Future<void> removeFavoriteDestination(String destinationId) async {
    try {
      return await _favoritesLocalDataSource.removeFavorite(destinationId);
    } catch (e) {
      log(
        'error removing favorite: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
    }
  }

  @override
  Future<void> clearAllFavorites() async {
    try {
      await _favoritesLocalDataSource.clearAllFavorites();
    } catch (e) {
      log(
        '❌ ERROR in FavoritesRepoImpl.clearAllFavorites: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
    }
  }
}
