// lib/core/presentation/blocs/favorites_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/domain/usecases/favorite%20use%20cases/add_to_favorite_repo_use_case.dart';
import 'package:trip_planner/core/domain/usecases/favorite%20use%20cases/get_favorites_ids_use_case.dart';
import 'package:trip_planner/core/domain/usecases/favorite%20use%20cases/remove_favorite_use_case.dart';

class FavoritesCubit extends Cubit<List<String>> {
  final AddToFavoritesUseCase _addToFavoritesUseCase;
  final RemoveFromFavoritesUseCase _removeFromFavoritesUseCase;
  final GetFavoriteIdsUseCase _getFavoriteIdsUseCase;

  FavoritesCubit(
    this._addToFavoritesUseCase,
    this._removeFromFavoritesUseCase,
    this._getFavoriteIdsUseCase,
  ) : super([]); // Initial state is an empty list

  /// Loads the initial list of favorite IDs from the local database.
  Future<void> loadFavorites() async {
    final favoriteIds = await _getFavoriteIdsUseCase();
    emit(favoriteIds);
  }

  /// Adds a destination to favorites and refreshes the state.
  Future<void> addFavorite(String destinationId) async {
    await _addToFavoritesUseCase(destinationId);
    await loadFavorites(); // Reload to ensure UI consistency
  }

  /// Removes a destination from favorites and refreshes the state.
  Future<void> removeFavorite(String destinationId) async {
    await _removeFromFavoritesUseCase(destinationId);
    await loadFavorites(); // Reload to ensure UI consistency
  }

  /// Toggles a destination's favorite status.
  Future<void> toggleFavorite(String destinationId) async {
    if (isFavorite(destinationId)) {
      await removeFavorite(destinationId);
    } else {
      await addFavorite(destinationId);
    }
  }

  /// A convenience method for the UI to quickly check the current state.
  bool isFavorite(String destinationId) {
    return state.contains(destinationId);
  }

  void clear() {
    emit([]);
  }
}
