import 'dart:developer';

import 'package:trip_planner/features/trip/domain/repos/trip_repository.dart';

class DeleteExpenseUseCase {
  final TripRepository _tripRepository;

  DeleteExpenseUseCase(this._tripRepository);

  Future<void> call(String expenseId) async {
    try {
      await _tripRepository.deleteExpense(expenseId);
    } catch (e) {
      log(
        '❌ ERROR in DeleteExpenseUseCase.call: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
    }
  }
}
