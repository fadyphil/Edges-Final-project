// lib/presentation/favorites/bloc/favorites_screen_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/presentaion/blocs/api%20states/api_state.dart';
// --- CORRECTED IMPORTS ---
import 'package:trip_planner/core/domain/usecases/destination%20use%20cases/get_destinations_by_ids_use_case.dart';
import 'package:trip_planner/core/domain/usecases/favorite%20use%20cases/get_favorites_ids_use_case.dart';
import 'package:trip_planner/core/presentaion/blocs/favorite/favorites_state.dart';

class FavoritesScreenCubit extends Cubit<FavoritesScreenState> {
  // --- CORRECT DEPENDENCIES ---
  final GetFavoriteIdsUseCase _getFavoriteIdsUseCase;
  final GetDestinationsByIdsUseCase _getDestinationsByIdsUseCase;

  FavoritesScreenCubit(
    this._getFavoriteIdsUseCase,
    this._getDestinationsByIdsUseCase,
  ) : super(FavoritesScreenState());

  Future<void> loadFavorites() async {
    emit(state.copyWith(favoritesState: const ApiState.loading()));
    try {
      // 1. Get the list of favorite IDs from ObjectBox.
      final favoriteIds = await _getFavoriteIdsUseCase();

      if (favoriteIds.isEmpty) {
        emit(state.copyWith(favoritesState: const ApiState.success(data: [])));
        return;
      }

      // 2. CORRECT: Use the "get many" use case to fetch the full objects.
      final destinations = await _getDestinationsByIdsUseCase(favoriteIds);

      // 3. Emit the final list.
      emit(
        state.copyWith(favoritesState: ApiState.success(data: destinations)),
      );
    } catch (e) {
      emit(
        state.copyWith(favoritesState: ApiState.error(message: e.toString())),
      );
    }
  }
}
