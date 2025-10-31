import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_planner/core/domain/entities/expense_entity.dart';
import 'package:trip_planner/core/presentaion/blocs/api%20states/api_state.dart';

part 'expenses_state.freezed.dart';

@freezed
abstract class ExpensesState with _$ExpensesState {
  const factory ExpensesState({
    @Default([]) List<Expense> expenses,
    @Default(ApiState.initial()) ApiState<void> addExpenseState,
  }) = _ExpensesState;
}
