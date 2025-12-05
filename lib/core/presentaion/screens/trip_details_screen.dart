// lib/presentation/trip_details/trip_details_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trip_planner/core/presentation/blocs/api_states/api_state.dart';
import 'package:trip_planner/features/destination/domain/entities/destination_entity.dart';
import 'package:trip_planner/features/trip/domain/entities/trip_entity.dart';
import 'package:trip_planner/features/trip/presentation/blocs/my_trips_cubit.dart';
import 'package:trip_planner/features/trip/presentation/blocs/my_trips_state.dart';
import 'package:trip_planner/features/trip/presentation/widgets/add_expense_dialog.dart';
import 'package:trip_planner/features/trip/presentation/widgets/pie_chart.dart';
import 'package:trip_planner/features/trip/presentation/widgets/trip_card.dart';
import 'package:trip_planner/features/weather/presentation/widgets/weather_card.dart';

class TripDetailsScreen extends StatelessWidget {
  final String tripId;

  const TripDetailsScreen({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    // This screen is a 'read-only' view of the global MyTripsCubit state.
    // All actions (add/delete expense, delete trip) are sent to the global cubit.
    return Scaffold(
      // We use BlocSelector for a significant performance optimization.
      // This widget will ONLY rebuild if the specific trip we are viewing has changed.
      body: BlocSelector<MyTripsCubit, MyTripsState, TripWithDestination?>(
        selector: (state) {
          // This function finds our specific trip in the master list.
          try {
            return state.tripsState.whenOrNull(
              success: (allTrips) => allTrips.firstWhere(
                (twd) =>
                    twd.trip.id ==
                    tripId, // Return null if the trip was just deleted
              ),
            );
          } catch (e) {
            return null;
          }
        },
        builder: (context, tripData) {
          // If the tripData is null, it means it was deleted. We should pop the screen.
          if (tripData == null) {
            // Use a post-frame callback to safely pop after the build is complete.
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              }
            });
            // Return an empty container while the navigation happens.
            return const Center(child: Text("This trip has been deleted."));
          }

          // If we have data, build the full UI.
          final trip = tripData.trip;
          final destination = tripData.destination;
          final imageUrl = destination.imageUrls.isNotEmpty
              ? destination.imageUrls.first
              : destination.flagUrl;

          return CustomScrollView(
            slivers: [
              _buildSliverAppBar(context, trip, destination, imageUrl),
              SliverList(
                delegate: SliverChildListDelegate([
                  _buildSectionHeader(context, "Weather Forecast"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: WeatherCard(destination: destination),
                  ),
                  _buildSectionHeader(context, "Budget Tracker"),
                  BudgetPieChart(trip: trip),
                  _buildSectionHeader(context, "Expenses"),
                  _ExpenseList(trip: trip),
                  const SizedBox(height: 100),
                ]),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await showModalBottomSheet<bool>(
            context: context,
            isScrollControlled: true,
            builder: (_) => BlocProvider.value(
              value: BlocProvider.of<MyTripsCubit>(context),
              child: AddExpenseDialog(tripId: tripId),
            ),
          );
        },
        label: const Text('Add Expense'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  // --- BUILDER METHODS ---

  Widget _buildSliverAppBar(
    BuildContext context,
    Trip trip,
    Destination destination,
    String imageUrl,
  ) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      expandedHeight: 250,
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          trip.tripName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  Image.network(destination.flagUrl, fit: BoxFit.cover),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: .3),
              ),
            ),
          ],
        ),
      ),
      actions: [
        // --- Delete Trip Button ---
        IconButton(
          icon: const Icon(
            Icons.delete_forever_outlined,
            color: Colors.redAccent,
          ),
          tooltip: 'Delete Trip',
          onPressed: () {
            showDialog(
              context: context,
              builder: (dialogContext) => AlertDialog(
                title: const Text('Delete Trip?'),
                content: const Text(
                  'Are you sure you want to permanently delete this trip?',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(dialogContext).pop(),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Call the GLOBAL MyTripsCubit. The BlocSelector will handle the rest.
                      context.read<MyTripsCubit>().deleteTrip(trip.id);
                      Navigator.of(dialogContext).pop();
                    },
                    child: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  // ... (_buildSectionHeader is the same)
}

// --- UI WIDGETS ---

class _ExpenseList extends StatelessWidget {
  final Trip trip;
  const _ExpenseList({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: trip.expenses.isEmpty
            ? const Center(
                heightFactor: 3,
                child: Text('No expenses added yet.'),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: trip.expenses.length,
                itemBuilder: (context, index) {
                  final expense = trip.expenses[index];
                  return ListTile(
                    title: Text(expense.category),
                    subtitle: Text(expense.description),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          NumberFormat.simpleCurrency(
                            name: trip.budget.currency,
                          ).format(expense.amount),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            // Call the GLOBAL MyTripsCubit to delete the expense.
                            context.read<MyTripsCubit>().deleteExpenseFromTrip(
                              expense.id,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}

Widget _buildSectionHeader(BuildContext context, String title) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
    child: Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
    ),
  );
}
