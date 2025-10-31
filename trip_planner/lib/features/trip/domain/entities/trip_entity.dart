import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_planner/features/trip/domain/entities/budget_entity.dart';
import 'package:trip_planner/features/trip/domain/entities/expense_entity.dart';

part 'trip_entity.freezed.dart';

@freezed
abstract class Trip with _$Trip {
  const factory Trip({
    required String id, // A unique identifier for this specific trip
    required String tripName,
    required String destinationId, // The ID of the Destination this trip is for
    required DateTime startDate,
    required DateTime endDate,
    required Budget budget, // Using a Value Object
    required String notes,
    required bool isCompleted,
    required List<Expense> expenses,
  }) = _Trip;
}



