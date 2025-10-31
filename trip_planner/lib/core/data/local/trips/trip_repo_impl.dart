// lib/core/data/repos/trip_repository_impl.dart
import 'dart:developer';

import 'package:trip_planner/core/data/local/expenses/expense_db_entity.dart';
import 'package:trip_planner/core/data/local/trips/trip_local_data_source.dart';
import 'package:trip_planner/core/data/mapping/trip_mapper.dart';
import 'package:trip_planner/core/domain/entities/expense_entity.dart';
import 'package:trip_planner/core/domain/entities/trip_entity.dart';
import 'package:trip_planner/core/domain/repo/trip_repository.dart';

class TripRepoImpl implements TripRepository {
  final TripLocalDataSource _tripLocalDataSource;

  TripRepoImpl(this._tripLocalDataSource);

  @override
  Future<List<Trip>> getTrips() async {
    // Renamed for consistency
    try {
      // --- THE FIX ---
      final dbTrips = _tripLocalDataSource.getAllTrips();
      final trips = dbTrips
          .map((dbTrip) => TripMapper.toEntity(dbTrip))
          .toList();
      return trips;
    } catch (e) {
      log(
        '❌ ERROR in TripRepoImpl.getAllTrips: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
      return [];
    }
  }

  @override
  Future<Trip?> getTripById(String tripId) async {
    try {
      final id = int.parse(tripId);
      // --- THE FIX ---
      final dbTrip = _tripLocalDataSource.getTripById(id);

      if (dbTrip == null) {
        return null;
      }
      return TripMapper.toEntity(dbTrip);
    } catch (e) {
      log(
        '❌ ERROR in TripRepoImpl.getTripById: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
      return null;
    }
  }

  @override
  Future<Trip> saveTrip(Trip trip) async {
    final dbEntity = TripMapper.toDbEntity(trip);
    final id = await _tripLocalDataSource.saveTrip(dbEntity);
    // return a copy of trip with the correct id
    return trip.copyWith(id: id.toString());
  }

  @override
  Future<void> updateTrip(Trip trip) async {
    try {
      final dbTrip = TripMapper.toDbEntity(trip);
      // --- THE FIX ---
      _tripLocalDataSource.updateTrip(dbTrip);
    } catch (e) {
      log(
        '❌ ERROR in TripRepoImpl.updateTrip: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
    }
  }

  @override
  Future<void> deleteTrip(String tripId) async {
    try {
      final id = int.parse(tripId);
      // --- THE FIX ---
      _tripLocalDataSource.deleteTrip(id);
    } catch (e) {
      log(
        '❌ ERROR in TripRepoImpl.deleteTrip: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
    }
  }

  @override
  Future<void> deleteExpense(String expenseId) async {
    try {
      final id = int.parse(expenseId);
      _tripLocalDataSource.deleteExpense(id);
    } catch (e) {
      log(
        '❌ ERROR in TripRepoImpl.deleteExpense: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
    }
  }

  @override
  Future<void> addExpense(String tripId, Expense expense) async {
    try {
      final id = int.tryParse(tripId);
      if (id == null) throw Exception('Invalid trip ID: $tripId');

      // Fetch the TripDbEntity
      final trip = _tripLocalDataSource.getTripById(id);
      if (trip == null) {
        throw Exception('Trip not found for id $tripId');
      }

      // Map the Expense entity to ExpenseDbEntity
      final expenseDb = ExpenseDbEntity(
        category: expense.category,
        description: expense.description,
        amount: expense.amount,
        currencyCode: trip.budgetCurrencyCode,
        date: expense.date,
      );

      // Link expense to the trip
      expenseDb.trip.target = trip;

      // Save the expense to ObjectBox
      _tripLocalDataSource.saveExpense(expenseDb);

      // Attach it to the trip’s ToMany list for consistency
      trip.expenses.add(expenseDb);
      _tripLocalDataSource.updateTrip(trip);
    } catch (e) {
      log(
        '❌ ERROR in TripRepoImpl.addExpense: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
      rethrow;
    }
  }

  @override
  Future<void> clearAllTrips() async {
    try {
      await _tripLocalDataSource.clearAllTrips();
    } catch (e) {
      log(
        '❌ ERROR in TripRepoImpl.clearAllTrips: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
    }
  }
}
