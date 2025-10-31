// lib/presentation/favorites/bloc/favorites_screen_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_planner/core/presentaion/blocs/api%20states/api_state.dart';
import 'package:trip_planner/core/domain/entities/destination_entity.dart';

part 'favorites_state.freezed.dart';

@freezed
abstract class FavoritesScreenState with _$FavoritesScreenState {
  const factory FavoritesScreenState({
    // The state for loading the full Destination objects
    @Default(ApiState.initial()) ApiState<List<Destination>> favoritesState,
  }) = _FavoritesScreenState;
}
