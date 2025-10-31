import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_planner/core/presentation/blocs/api_states/api_state.dart';
import 'package:trip_planner/features/trip/domain/entities/expense_entity.dart';

part 'expenses_state.freezed.dart';

@freezed
abstract class ExpensesState with _$ExpensesState {
  const factory ExpensesState({
    @Default([]) List<Expense> expenses,
    @Default(ApiState.initial()) ApiState<void> addExpenseState,
  }) = _ExpensesState;
}
