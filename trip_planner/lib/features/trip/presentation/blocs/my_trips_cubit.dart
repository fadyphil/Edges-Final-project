// lib/presentation/my_trips/bloc/my_trips_cubit.dart
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/presentation/blocs/api_states/api_state.dart';
import 'package:trip_planner/features/destination/domain/usecases/get_destinations_by_ids_use_case.dart';
import 'package:trip_planner/features/trip/domain/entities/expense_entity.dart';
import 'package:trip_planner/features/trip/domain/entities/trip_entity.dart';
import 'package:trip_planner/features/trip/domain/usecases/add_expense_use_case.dart';
import 'package:trip_planner/features/trip/domain/usecases/delete_expense_use_case.dart';
import 'package:trip_planner/features/trip/domain/usecases/delete_trip_use_case.dart';
import 'package:trip_planner/features/trip/domain/usecases/get_all_trips_use_case.dart';
import 'package:trip_planner/features/trip/domain/usecases/update_trip_use_case.dart';
import 'package:trip_planner/features/trip/presentation/widgets/trip_card.dart';

import './my_trips_state.dart';

class MyTripsCubit extends Cubit<MyTripsState> {
  // --- All Dependencies ---
  final GetAllTripsUseCase _getAllTripsUseCase;
  final GetDestinationsByIdsUseCase _getDestinationsByIdsUseCase;
  final DeleteTripUseCase _deleteTripUseCase;
  final AddExpenseUseCase _addExpenseUseCase;
  final DeleteExpenseUseCase _deleteExpenseUseCase;
  final UpdateTripUseCase _updateTripUseCase;

  MyTripsCubit(
    this._getAllTripsUseCase,
    this._getDestinationsByIdsUseCase,
    this._deleteTripUseCase,
    this._addExpenseUseCase,
    this._deleteExpenseUseCase,
    this._updateTripUseCase,
  ) : super(MyTripsState());

  // --- Core Data Loading ---
  Future<void> loadTrips() async {
    // Only show the main loading spinner on the initial fetch
    final bool hasdata =
        state.tripsState.whenOrNull(success: (data) => data.isNotEmpty) ??
        false;

    if (!hasdata) {
      emit(state.copyWith(tripsState: const ApiState.loading()));
    }
    try {
      final trips = await _getAllTripsUseCase();
      if (trips.isEmpty) {
        emit(
          state.copyWith(
            filteredTrips: [],
            tripsState: const ApiState.success(data: []),
          ),
        );
        return;
      }

      final destinationIds = trips.map((t) => t.destinationId).toSet().toList();
      final destinations = await _getDestinationsByIdsUseCase(destinationIds);
      final destinationMap = {for (var d in destinations) d.id: d};

      final tripsWithDestinations = trips
          .map(
            (trip) => TripWithDestination(
              trip: trip,
              destination: destinationMap[trip.destinationId]!,
            ),
          )
          .toList();

      emit(
        state.copyWith(
          tripsState: ApiState.success(data: tripsWithDestinations),
        ),
      );
      _applyFilter();
    } catch (e) {
      emit(state.copyWith(tripsState: ApiState.error(message: e.toString())));
    }
  }

  // --- Filtering Logic ---
  void filterChanged(TripFilter newFilter) {
    emit(state.copyWith(activeFilter: newFilter));
    _applyFilter();
  }

  void _applyFilter() {
    state.tripsState.whenOrNull(
      success: (allTrips) {
        final now = DateTime.now();
        List<TripWithDestination> filtered;
        if (state.activeFilter == TripFilter.upcoming) {
          filtered = allTrips
              .where(
                (twd) => !twd.trip.isCompleted && twd.trip.endDate.isAfter(now),
              )
              .toList();
          filtered.sort((a, b) => a.trip.startDate.compareTo(b.trip.startDate));
        } else {
          filtered = allTrips
              .where(
                (twd) => twd.trip.isCompleted || twd.trip.endDate.isBefore(now),
              )
              .toList();
          filtered.sort((a, b) => b.trip.endDate.compareTo(a.trip.endDate));
        }
        emit(state.copyWith(filteredTrips: filtered));
      },
    );
  }

  // --- ACTION METHODS ---
  Future<void> deleteTrip(String tripId) async {
    await _performAction(() => _deleteTripUseCase(tripId));
  }

  Future<void> addExpenseToTrip(String tripId, Expense expense) async {
    await _performAction(() => _addExpenseUseCase(tripId, expense));
  }

  Future<void> deleteExpenseFromTrip(String expenseId) async {
    await _performAction(() => _deleteExpenseUseCase(expenseId));
  }

  // A generic helper method to handle all actions, reducing boilerplate
  Future<void> _performAction(Future<void> Function() action) async {
    emit(state.copyWith(actionState: const ApiState.loading()));
    try {
      await action();
      emit(state.copyWith(actionState: const ApiState.success(data: null)));
      // CRUCIAL: After any successful action, reload all data from the source of truth.
      await loadTrips();
    } catch (e) {
      log(
        '❌ ERROR in MyTripsCubit action: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
      emit(state.copyWith(actionState: ApiState.error(message: e.toString())));
    }
  }

  Future<void> updateTrip(Trip trip) async {
    await _performAction(() => _updateTripUseCase(trip));
  }

  void clear() {
    emit(MyTripsState());
  }
}
