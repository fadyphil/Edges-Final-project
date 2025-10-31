// lib/presentation/trip_planning/trip_planning_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/presentaion/blocs/api%20states/api_state.dart';
import 'package:trip_planner/core/domain/entities/destination_entity.dart';
import 'package:trip_planner/core/presentaion/blocs/trip%20planning/trip_planning_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/trip%20planning/trip_planning_state.dart';
import 'package:intl/intl.dart';
import 'package:trip_planner/core/presentaion/widgets/success_overlay.dart';
import 'package:trip_planner/core/service_locator.dart';

class TripPlanningScreen extends StatelessWidget {
  final Destination destination;

  const TripPlanningScreen({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    // We provide the Cubit specifically for this screen.
    return BlocProvider(
      create: (context) => sl<TripPlanningCubit>(),
      child: _TripPlanningView(destination: destination),
    );
  }
}

// The main view widget that will build the UI
class _TripPlanningView extends StatelessWidget {
  final Destination destination;
  const _TripPlanningView({required this.destination});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TripPlanningCubit>();

    return BlocListener<TripPlanningCubit, TripPlanningState>(
      listener: (context, state) {
        state.submissionState.whenOrNull(
          success: (_) {
            showSuccessOverlay(context, message: 'Trip Saved!');
            Future.delayed(const Duration(microseconds: 2200), () {
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            });
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to save trip: $message'),
                backgroundColor: Colors.red,
              ),
            );
          },
        );
      },

      child: Scaffold(
        appBar: AppBar(
          title: Text('Plan a Trip to ${destination.name}'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Trip Name Field ---
              _buildTextField(
                label: 'Trip Name',
                hint: 'e.g., Summer Adventure in ${destination.name}',
                onChanged: cubit.tripNameChanged,
              ),
              const SizedBox(height: 24),

              // --- Date Fields ---
              Row(
                children: [
                  Expanded(child: _buildDateField(context, isStartDate: true)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildDateField(context, isStartDate: false)),
                ],
              ),
              const SizedBox(height: 24),

              // --- Budget Field ---
              _buildTextField(
                label:
                    'Budget (in your currency - USD)', // Assuming user's currency is USD
                hint: 'e.g., 1500',
                keyboardType: TextInputType.number,
                onChanged: cubit.budgetChanged,
              ),
              const SizedBox(height: 12),

              // --- Currency Conversion Widget ---
              _buildCurrencyConversion(context),
              const SizedBox(height: 24),

              // --- Notes/Itinerary Field ---
              _buildTextField(
                label: 'Notes / Itinerary',
                hint: 'e.g., Visit the pyramids, try local food...',
                maxLines: 5,
                onChanged: (value) {}, // Add notesChanged to cubit if needed
              ),
              const SizedBox(height: 32),

              // --- Save Trip Button ---
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  // --- BUILDER METHODS ---

  Widget _buildTextField({
    required String label,
    required String hint,
    required ValueChanged<String> onChanged,
    int? maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          onChanged: onChanged,
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: false,
            fillColor: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildDateField(BuildContext context, {required bool isStartDate}) {
    return BlocBuilder<TripPlanningCubit, TripPlanningState>(
      // buildWhen prevents rebuilding for unrelated state changes
      buildWhen: (prev, curr) => (isStartDate
          ? prev.startDate != curr.startDate
          : prev.endDate != curr.endDate),
      builder: (context, state) {
        final date = isStartDate ? state.startDate : state.endDate;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isStartDate ? 'Start Date' : 'End Date',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
                );
                if (pickedDate != null && context.mounted) {
                  isStartDate
                      ? context.read<TripPlanningCubit>().startDateChanged(
                          pickedDate,
                        )
                      : context.read<TripPlanningCubit>().endDateChanged(
                          pickedDate,
                        );
                }
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),

                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date == null
                          ? 'Select Date'
                          : DateFormat.yMMMd().format(date),
                    ),
                    const Icon(Icons.calendar_today, size: 18),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCurrencyConversion(BuildContext context) {
    return BlocBuilder<TripPlanningCubit, TripPlanningState>(
      buildWhen: (prev, curr) =>
          prev.conversionState != curr.conversionState ||
          prev.convertedAmountDisplay != curr.convertedAmountDisplay,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: Text(
                state.convertedAmountDisplay,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: state.conversionState.maybeWhen(
                    error: (_) => Colors.red,
                    orElse: () => Colors.green.shade700,
                  ),
                ),
              ),
            ),
            state.conversionState.maybeWhen(
              loading: () => const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(),
              ),
              orElse: () => OutlinedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus(); // Hide keyboard
                  context.read<TripPlanningCubit>().convertBudget(
                    fromCurrency: 'USD', // User's currency
                    toCurrency: destination.currencyCode,
                    toCurrencySymbol: destination.currency.symbol,
                  );
                },
                child: const Text('Convert'),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSaveButton() {
    return BlocBuilder<TripPlanningCubit, TripPlanningState>(
      builder: (context, state) {
        final bool isSaving = state.submissionState.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            // The button is disabled if the form is invalid or currently saving
            onPressed: state.isFormValid && !isSaving
                ? () {
                    context.read<TripPlanningCubit>().saveTrip(
                      destinationId: destination.id,
                      userCurrency: 'USD',
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: isSaving
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                : const Text(
                    'Save Trip',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
