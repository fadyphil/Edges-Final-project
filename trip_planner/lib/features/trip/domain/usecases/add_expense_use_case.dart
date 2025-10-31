import 'package:trip_planner/features/trip/domain/entities/expense_entity.dart';
import 'package:trip_planner/features/trip/domain/repos/trip_repository.dart';

class AddExpenseUseCase {
  final TripRepository _tripRepository;
  AddExpenseUseCase(this._tripRepository);

  Future<void> call(String tripId, Expense expense) async {
    if (tripId.isEmpty) throw Exception('Trip ID cannot be empty');
    if (expense.amount <= 0) throw Exception('Invalid expense amount');
    await _tripRepository.addExpense(tripId, expense);
  }
}
