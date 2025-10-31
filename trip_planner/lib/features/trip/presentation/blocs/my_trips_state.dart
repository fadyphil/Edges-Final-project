// lib/presentation/my_trips/bloc/my_trips_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_planner/core/presentation/blocs/api_states/api_state.dart';
import 'package:trip_planner/features/trip/presentation/widgets/trip_card.dart';

part 'my_trips_state.freezed.dart';

// Enum to represent the user's selected filter on the My Trips screen
enum TripFilter { upcoming, past }

@freezed
abstract class MyTripsState with _$MyTripsState {
  const factory MyTripsState({
    /// Manages the loading/success/error state for fetching the master list of all trips.
    @Default(ApiState.initial()) ApiState<List<TripWithDestination>> tripsState,

    /// The currently active filter chosen by the user.
    @Default(TripFilter.upcoming) TripFilter activeFilter,

    /// A pre-filtered and sorted list of trips for the UI to display directly.
    /// This is a "selector" derived from the main `tripsState`.
    @Default([]) List<TripWithDestination> filteredTrips,

    /// A dedicated state machine to track actions like adding/deleting an expense
    /// or updating a trip. This prevents the whole UI from showing a loading spinner.
    @Default(ApiState.initial()) ApiState<void> actionState,
  }) = _MyTripsState;
}
