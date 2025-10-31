// lib/presentation/explore/bloc/explore_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_planner/features/destination/domain/entities/destination_entity.dart';
import 'package:trip_planner/core/presentation/blocs/api_states/api_state.dart';

part 'explore_state.freezed.dart';

@freezed
abstract class ExploreState with _$ExploreState {
  const factory ExploreState({
    /// Manages the loading state for the main API call.
    @Default(ApiState.initial()) ApiState<List<Destination>> destinations,

    /// Holds the original, unfiltered list of all destinations from the API.
    @Default([]) List<Destination> allDestinations,

    /// The currently active category filter (e.g., "Beach", "Popular").
    @Default('Popular') String activeFilter,

    /// The current text in the search bar.
    @Default('') String searchQuery,

    /// The final, filtered list of destinations to be displayed in the UI grid.
    @Default([]) List<Destination> filteredDestinations,
  }) = _ExploreState;
}
