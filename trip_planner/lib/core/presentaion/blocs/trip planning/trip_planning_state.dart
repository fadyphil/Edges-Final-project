// lib/presentation/trip_planning/bloc/trip_planning_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_planner/core/presentaion/blocs/api%20states/api_state.dart';

part 'trip_planning_state.freezed.dart';

@freezed
abstract class TripPlanningState with _$TripPlanningState {
  const factory TripPlanningState({
    // --- Form Fields ---
    @Default('') String tripName,
    DateTime? startDate,
    DateTime? endDate,
    @Default('') String budget,
    @Default('') String notes,

    // --- Currency Conversion State ---
    // This holds the status of the API call for conversion
    @Default(ApiState.initial()) ApiState<double> conversionState,

    // This holds the final display string (e.g., "≈ 47,500.00 EGP")
    @Default('') String convertedAmountDisplay,

    // --- Form Validation & Submission State ---
    @Default(false) bool isFormValid,
    @Default(ApiState.initial()) ApiState<void> submissionState,
  }) = _TripPlanningState;
}
