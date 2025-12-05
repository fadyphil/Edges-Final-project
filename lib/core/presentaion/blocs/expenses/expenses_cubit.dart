// // lib/presentation/trip_details/bloc/expenses/expenses_cubit.dart

// import 'dart:developer';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:trip_planner/core/domain/entities/expense_entity.dart';
// import 'package:trip_planner/core/domain/usecases/expenses/add_expense_use_case.dart';
// import 'package:trip_planner/core/domain/usecases/expenses/delete_expense_use_case.dart';
// import 'package:trip_planner/core/presentaion/blocs/api%20states/api_state.dart';
// import 'package:trip_planner/core/presentaion/blocs/expenses/expenses_state.dart';
// import 'package:trip_planner/core/presentaion/blocs/trip%20details/trip_details_cubit.dart';

// class ExpensesCubit extends Cubit<ExpensesState> {
//   // It still manages the addExpenseState
//   final AddExpenseUseCase addExpenseUseCase;
//   final DeleteExpenseUseCase deleteExpenseUseCase;
//   final TripDetailsCubit tripDetailsCubit;
//   final String tripId;

//   ExpensesCubit({
//     required this.tripId,
//     required this.addExpenseUseCase,
//     required this.deleteExpenseUseCase,
//     required this.tripDetailsCubit,
//   }) : super(const ExpensesState()); // It no longer needs initialExpenses

//   Future<void> addExpense(Expense expense) async {
//     emit(state.copyWith(addExpenseState: const ApiState.loading()));
//     try {
//       await addExpenseUseCase(tripId, expense);
//       emit(state.copyWith(addExpenseState: const ApiState.success(data: null)));

//       // This is the most important part: tell the main cubit to refresh.
//       await tripDetailsCubit.refreshTrip();
//     } catch (e) {
//       emit(
//         state.copyWith(addExpenseState: ApiState.error(message: e.toString())),
//       );
//     }
//   }

//   Future<void> deleteExpense(String expenseId) async {
//     try {
//       await deleteExpenseUseCase(expenseId);

//       // Tell the main cubit to refresh.
//       await tripDetailsCubit.refreshTrip();
//     } catch (e) {
//       log(
//         'Error deleting expense: $e',
//         error: e,
//         stackTrace: StackTrace.current,
//       );
//     }
//   }
// }
