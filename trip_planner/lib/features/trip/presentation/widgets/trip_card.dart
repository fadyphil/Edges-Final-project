// lib/presentation/my_trips/widgets/trip_card.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trip_planner/core/presentaion/screens/trip_details_screen.dart';
import 'package:trip_planner/features/destination/domain/entities/destination_entity.dart';
import 'package:trip_planner/features/trip/domain/entities/trip_entity.dart';

// A helper class to bundle the two objects together.
// Your UseCase/Cubit will be responsible for creating this.
class TripWithDestination {
  final Trip trip;
  final Destination destination;
  TripWithDestination({required this.trip, required this.destination});
}

class TripCard extends StatelessWidget {
  final TripWithDestination tripData;

  const TripCard({super.key, required this.tripData});

  @override
  Widget build(BuildContext context) {
    final trip = tripData.trip;
    final destination = tripData.destination;
    final now = DateTime.now();
    final isUpcoming = trip.startDate.isAfter(now);
    final isCompleted = trip.isCompleted || trip.endDate.isBefore(now);
    final isInProgress = !isUpcoming && !isCompleted;

    // Use the first Unsplash image or fall back to the flag
    final imageUrl = destination.imageUrls.isNotEmpty
        ? destination.imageUrls.first
        : destination.flagUrl;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => TripDetailsScreen(tripId: trip.id)),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: 8,
        shadowColor: Colors.black.withValues(alpha: .3),
        child: Column(
          children: [
            // --- Image and Countdown Banner ---
            Stack(
              children: [
                Image.network(
                  imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      Image.network(destination.flagUrl, fit: BoxFit.cover),
                ),
                // Gradient for text readability
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withValues(alpha: .6),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Text(
                    destination.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(blurRadius: 2, color: Colors.black54)],
                    ),
                  ),
                ),
                // The dynamic countdown banner
                Positioned(
                  top: 12,
                  right: -40,
                  child: _buildCountdownBanner(
                    context,
                    startDate: trip.startDate,
                    isUpcoming: isUpcoming,
                    isInProgress: isInProgress,
                    isCompleted: isCompleted,
                  ),
                ),
              ],
            ),
            // --- Trip Details Section ---
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          trip.tripName,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '${trip.budget.currency} ${NumberFormat.compact().format(trip.budget.amount)}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildDateInfo(
                        context,
                        icon: Icons.calendar_today,
                        label: 'FROM',
                        date: trip.startDate,
                      ),
                      const SizedBox(width: 24),
                      _buildDateInfo(
                        context,
                        icon: Icons.calendar_today_outlined,
                        label: 'TO',
                        date: trip.endDate,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- BUILDER METHODS ---

  Widget _buildCountdownBanner(
    BuildContext context, {
    required DateTime startDate,
    required bool isUpcoming,
    required bool isInProgress,
    required bool isCompleted,
  }) {
    String text;
    Color color;
    IconData icon;

    if (isCompleted) {
      text = 'COMPLETED';
      color = Colors.grey.shade700;
      icon = Icons.check_circle;
    } else if (isInProgress) {
      text = 'IN PROGRESS';
      color = Colors.green.shade700;
      icon = Icons.airplanemode_active;
    } else {
      final daysUntil = startDate.difference(DateTime.now()).inDays;
      if (daysUntil == 0) {
        text = 'STARTS TODAY';
      } else if (daysUntil == 1) {
        text = 'STARTS TOMORROW';
      } else {
        text = '$daysUntil DAYS TO GO';
      }
      color = Theme.of(context).colorScheme.secondary;
      icon = Icons.timer_outlined;
    }

    return Transform.rotate(
      angle: 0.8, // 45 degrees in radians
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 6),
        color: color,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 16),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateInfo(
    BuildContext context, {
    required IconData icon,
    required String label,
    required DateTime date,
  }) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary, size: 20),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.labelSmall),
            Text(
              DateFormat.yMMMd().format(date),
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
