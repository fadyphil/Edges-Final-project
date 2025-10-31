// lib/core/data/mappers/trip_mapper.dart
import 'package:trip_planner/core/data/local/expenses/expense_db_entity.dart';
import 'package:trip_planner/core/data/local/trips/trip_db_entity.dart';
import 'package:trip_planner/core/domain/entities/budget_entity.dart';
import 'package:trip_planner/core/domain/entities/expense_entity.dart';
import 'package:trip_planner/core/domain/entities/trip_entity.dart';

class TripMapper {
  // --- From Data Layer to Domain Layer ---
  static Trip toEntity(TripDbEntity dbEntity) {
    // Map the list of ExpenseDbEntity to a list of Expense entities
    final expenses = dbEntity.expenses.map((expenseDb) {
      return Expense(
        id: expenseDb.id.toString(), // Convert ObjectBox int id to String
        category: expenseDb.category,
        description: expenseDb.description,
        amount: expenseDb.amount,
        date: expenseDb.date,
      );
    }).toList();

    return Trip(
      id: dbEntity.id.toString(), // Convert ObjectBox int id to String
      tripName: dbEntity.name,
      destinationId: dbEntity.destinationId,
      startDate: dbEntity.startDate,
      endDate: dbEntity.endDate,
      budget: Budget(
        amount: dbEntity.budget,
        currency: dbEntity.budgetCurrencyCode,
      ),
      notes: dbEntity.notes ?? '',
      isCompleted: dbEntity.isCompleted,
      expenses: expenses, // Use the mapped list
    );
  }

  // --- From Domain Layer to Data Layer ---
  static TripDbEntity toDbEntity(Trip entity) {
    final dbEntity = TripDbEntity(
      // If the ID is a real one, parse it. If not, ObjectBox will assign a new one (id=0).
      id: int.tryParse(entity.id) ?? 0,
      name: entity.tripName,
      destinationId: entity.destinationId,
      startDate: entity.startDate,
      endDate: entity.endDate,
      budget: entity.budget.amount,
      budgetCurrencyCode: entity.budget.currency,
      notes: entity.notes,
      isCompleted: entity.isCompleted,
    );

    // Map the list of Expense entities back to a list of ExpenseDbEntity
    final expenseDbEntities = entity.expenses.map((expense) {
      return ExpenseDbEntity(
        id: int.tryParse(expense.id) ?? 0,
        category: expense.category,
        description: expense.description,
        amount: expense.amount,
        date: expense.date,
        currencyCode: '',
      );
    }).toList();

    // IMPORTANT: Attach the mapped expenses to the ToMany relationship
    dbEntity.expenses.addAll(expenseDbEntities);

    return dbEntity;
  }

  static Trip fromDbEntity(TripDbEntity dbEntity) {
    final expenses = dbEntity.expenses.map((expenseDb) {
      return Expense(
        id: expenseDb.id.toString(), // Convert ObjectBox int id to String
        category: expenseDb.category,
        description: expenseDb.description,
        amount: expenseDb.amount,
        date: expenseDb.date,
      );
    }).toList();
    return Trip(
      id: dbEntity.id.toString(),
      tripName: dbEntity.name,
      budget: Budget(
        amount: dbEntity.budget,
        currency: dbEntity.budgetCurrencyCode,
      ),
      destinationId: dbEntity.destinationId,
      startDate: dbEntity.startDate,
      endDate: dbEntity.endDate,
      notes: dbEntity.notes ?? '',

      isCompleted: dbEntity.isCompleted,
      expenses: expenses,
    );
  }
}
