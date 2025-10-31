import 'dart:developer';

import 'package:trip_planner/features/trip/data/local/expense_db_entity.dart';
import 'package:trip_planner/features/trip/data/local/trip_db_entity.dart';
import 'package:trip_planner/objectbox.g.dart';

class TripLocalDataSource {
  // ObjectBox Box for TripDbEntity
  final Box<TripDbEntity> _tripBox;
  final Box<ExpenseDbEntity> _expenseBox;

  TripLocalDataSource(Store store)
    : _tripBox = store.box<TripDbEntity>(),
      _expenseBox = store.box<ExpenseDbEntity>();

  /// Saves a [TripDbEntity] to the local database.
  /// Returns the ID of the saved trip.
  Future<int> saveTrip(TripDbEntity trip) async {
    return _tripBox.put(trip);
  }

  /// Retrieves a [TripDbEntity] by its ID.
  TripDbEntity? getTripById(int id) {
    return _tripBox.get(id);
  }

  /// Retrieves all [TripDbEntity] objects from the local database.
  List<TripDbEntity> getAllTrips() {
    return _tripBox.getAll();
  }

  /// Deletes a [TripDbEntity] by its ID.
  bool deleteTrip(int id) {
    final trip = _tripBox.get(id);
    if (trip == null) {
      return false;
    }
    // This is important: remove all associated expenses first.
    _expenseBox.removeMany(trip.expenses.map((e) => e.id).toList());
    return _tripBox.remove(id);
  }

  /// Updates an existing [TripDbEntity].
  /// Returns the ID of the updated trip.
  int updateTrip(TripDbEntity trip) {
    _expenseBox.putMany(trip.expenses);
    return _tripBox.put(trip);
  }

  void deleteExpense(int id) {
    final expense = _expenseBox.get(id);
    if (expense != null) {
      // unlink from trip (safe)
      final linkedTrip = expense.trip.target;
      if (linkedTrip != null) {
        linkedTrip.expenses.removeWhere((e) => e.id == id);
        _tripBox.put(linkedTrip);
      }
      _expenseBox.remove(id);
    }
  }

  /// Adds a single expense to a trip by trip id.
  /// Ensures the ToOne/ToMany relation is set correctly.
  Future<void> addExpenseToTrip(int tripId, ExpenseDbEntity expense) async {
    // Fetch the trip
    final trip = _tripBox.get(tripId);
    final allTrips = _tripBox.getAll();

    if (trip == null) {
      log(
        'Trip not found. Existing IDs: ${allTrips.map((t) => t.id).toList()}',
      );
      throw Exception('Trip not found for id $tripId');
    }

    // 1) Put the expense into the expense box to get an id assigned.
    final expenseId = _expenseBox.put(expense);
    // Update the expense id (if needed)
    expense.id = expenseId;

    // 2) Link the expense to the trip via ToOne or ToMany
    // Option A: set expense.trip.target = trip and update it
    expense.trip.target = trip;
    _expenseBox.put(expense); // persist the link

    // 3) Also add to trip.expenses ToMany and persist trip
    trip.expenses.add(expense);
    _tripBox.put(trip);
  }

  void saveExpense(ExpenseDbEntity expense) {
    _expenseBox.put(expense);
  }

  Future<void> clearAllTrips() async {
    _tripBox.removeAll();
    _expenseBox.removeAll();
  }
}
