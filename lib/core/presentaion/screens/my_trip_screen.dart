// lib/presentation/my_trips/my_trips_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/presentation/blocs/api_states/api_state.dart';
import 'package:trip_planner/features/trip/presentation/blocs/my_trips_cubit.dart';
import 'package:trip_planner/features/trip/presentation/blocs/my_trips_state.dart';
import 'package:trip_planner/features/trip/presentation/widgets/trip_card.dart';

class MyTripsScreen extends StatelessWidget {
  const MyTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Since the Cubit is provided globally, this screen just needs to listen.
    return Scaffold(
      body: BlocBuilder<MyTripsCubit, MyTripsState>(
        builder: (context, state) {
          context.read<MyTripsCubit>().loadTrips();
          // Use .when to handle the main data loading states
          return state.tripsState.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text('Error: $message')),
            success: (allTrips) {
              // The main UI is a CustomScrollView for efficiency
              return CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    title: Text('My Trips'),
                    pinned: true,
                    floating: true,
                  ),
                  // The sticky header for our filter chips
                  const SliverPersistentHeader(
                    pinned: true,
                    delegate: _FilterHeaderDelegate(),
                  ),
                  // Conditionally show either the empty state or the list
                  if (state.filteredTrips.isEmpty)
                    _EmptyState(filter: state.activeFilter)
                  else
                    _TripList(trips: state.filteredTrips),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

// --- UI WIDGETS ---

// The list of trips, using SliverList for performance
class _TripList extends StatelessWidget {
  final List<TripWithDestination> trips;
  const _TripList({required this.trips});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: trips.length,
      itemBuilder: (context, index) {
        final tripData = trips[index];
        // Use Dismissible for a smooth swipe-to-delete UX
        return Dismissible(
          key: Key(tripData.trip.id),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red.shade700,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 24.0),
            child: const Icon(Icons.delete_forever, color: Colors.white),
          ),
          // Show a confirmation dialog before deleting
          confirmDismiss: (direction) async {
            return await showDialog(
              context: context,
              builder: (dialogContext) => AlertDialog(
                title: const Text('Delete Trip?'),
                content: const Text(
                  'Are you sure you want to permanently delete this trip?',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(dialogContext).pop(false),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(dialogContext).pop(true),
                    child: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            );
          },
          // If confirmed, call the delete method on the cubit
          onDismissed: (direction) {
            context.read<MyTripsCubit>().deleteTrip(tripData.trip.id);
          },
          child: TripCard(tripData: tripData),
        );
      },
    );
  }
}

// The delegate for our sticky filter header
class _FilterHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _FilterHeaderDelegate();
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      height: 60,
      color: Theme.of(context).colorScheme.surface,
      child: Center(
        child: BlocBuilder<MyTripsCubit, MyTripsState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilterChip(
                    label: const Text('Upcoming'),
                    selected: state.activeFilter == TripFilter.upcoming,
                    onSelected: (_) => context
                        .read<MyTripsCubit>()
                        .filterChanged(TripFilter.upcoming),
                  ),
                  const SizedBox(width: 16),
                  FilterChip(
                    label: const Text('Past'),
                    selected: state.activeFilter == TripFilter.past,
                    onSelected: (_) => context
                        .read<MyTripsCubit>()
                        .filterChanged(TripFilter.past),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  double get maxExtent => 60.0;
  @override
  double get minExtent => 60.0;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

// The widget to display when there are no trips for the selected filter
class _EmptyState extends StatelessWidget {
  final TripFilter filter;
  const _EmptyState({required this.filter});

  @override
  Widget build(BuildContext context) {
    final message = filter == TripFilter.upcoming
        ? 'No upcoming trips.\nTime to plan an adventure!'
        : 'No past trips found.';
    final icon = filter == TripFilter.upcoming
        ? Icons.explore_outlined
        : Icons.history;

    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
