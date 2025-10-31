import 'package:trip_planner/core/domain/entities/expense_entity.dart';
import 'package:trip_planner/core/domain/entities/trip_entity.dart';

abstract class TripRepository {
  Future<void> saveTrip(Trip trip);
  Future<List<Trip>> getTrips();
  Future<void> deleteTrip(String tripId);
  Future<void> updateTrip(Trip trip);
  Future<Trip?> getTripById(String tripId);
  Future<void> deleteExpense(String expenseId);
  Future<void> addExpense(String tripId, Expense expense);
  Future<void> clearAllTrips();
}
