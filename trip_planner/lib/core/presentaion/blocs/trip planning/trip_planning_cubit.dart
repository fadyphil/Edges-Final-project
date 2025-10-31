// lib/presentation/trip_planning/bloc/trip_planning_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart'; // Add 'intl' to pubspec for currency formatting
import 'package:trip_planner/core/presentaion/blocs/api%20states/api_state.dart';
import 'package:trip_planner/core/domain/entities/budget_entity.dart';
import 'package:trip_planner/core/domain/entities/trip_entity.dart';
import 'package:trip_planner/core/domain/usecases/currency%20conversion%20use%20cases/convert_currency_use_case.dart';
import 'package:trip_planner/core/domain/usecases/trip%20use%20cases/save_trip_use_case.dart';
// You will also need a use case to save the trip
import './trip_planning_state.dart';

class TripPlanningCubit extends Cubit<TripPlanningState> {
  final ConvertCurrencyUseCase _convertCurrencyUseCase;
  final SaveTripUseCase _saveTripUseCase; // For saving the final trip

  TripPlanningCubit(this._convertCurrencyUseCase, this._saveTripUseCase)
    : super(TripPlanningState());

  // --- Methods for Form Inputs ---
  void tripNameChanged(String value) {
    emit(state.copyWith(tripName: value));
    _validateForm();
  }
  // ... create similar methods for startDateChanged, endDateChanged, etc.

  void budgetChanged(String value) {
    emit(state.copyWith(budget: value, convertedAmountDisplay: ''));
    _validateForm();
  }

  // --- Core Business Logic Method ---
  Future<void> convertBudget({
    required String fromCurrency,
    required String toCurrency,
    required String toCurrencySymbol,
  }) async {
    // Try to parse the budget string to a number
    final amount = double.tryParse(state.budget);
    if (amount == null || amount <= 0) {
      // Don't do anything if the budget isn't a valid number
      return;
    }

    emit(state.copyWith(conversionState: const ApiState.loading()));

    try {
      final result = await _convertCurrencyUseCase(
        fromCurrency: fromCurrency,
        toCurrency: toCurrency,
        amount: amount,
      );

      // Use NumberFormat for clean currency formatting
      final formatter = NumberFormat.currency(
        symbol: toCurrencySymbol,
        decimalDigits: 2,
      );
      final displayString = "≈ ${formatter.format(result)}";

      emit(
        state.copyWith(
          conversionState: ApiState.success(data: result),
          convertedAmountDisplay: displayString,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          conversionState: ApiState.error(message: e.toString()),
          convertedAmountDisplay: "Conversion failed",
        ),
      );
    }
  }

  // --- Form Validation and Submission ---
  void _validateForm() {
    // Basic validation logic
    final isValid =
        state.tripName.trim().isNotEmpty &&
        state.startDate != null &&
        state.endDate != null &&
        state.budget.trim().isNotEmpty &&
        double.tryParse(state.budget) != null;
    emit(state.copyWith(isFormValid: isValid));
  }

  Future<void> saveTrip({
    required String destinationId,
    required String userCurrency,
  }) async {
    if (!state.isFormValid) return;

    emit(state.copyWith(submissionState: const ApiState.loading()));

    try {
      final tripToSave = Trip(
        id: '',
        tripName: state.tripName,
        destinationId: destinationId,
        startDate: state.startDate!,
        endDate: state.endDate!,
        budget: Budget(
          amount: double.parse(state.budget),
          currency: userCurrency,
        ),
        notes: state.notes,
        isCompleted: false,
        expenses: [],
      );
      await _saveTripUseCase(tripToSave);
      emit(state.copyWith(submissionState: const ApiState.success(data: null)));
    } catch (e) {
      emit(
        state.copyWith(submissionState: ApiState.error(message: e.toString())),
      );
    }
  }

  endDateChanged(DateTime pickedDate) {
    emit(state.copyWith(endDate: pickedDate));
    _validateForm();
  }

  startDateChanged(DateTime pickedDate) {
    emit(state.copyWith(startDate: pickedDate));
    _validateForm();
  }
}
