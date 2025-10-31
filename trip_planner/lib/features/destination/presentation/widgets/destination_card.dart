import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:trip_planner/features/destination/domain/entities/destination_entity.dart';
import 'package:trip_planner/features/destination/presentation/screens/destination_details_screen.dart'; // Add 'intl' to your pubspec.yaml for number formatting

class DestinationCard extends StatelessWidget {
  final Destination destination;

  const DestinationCard({super.key, required this.destination});

  // Helper function to format large numbers for readability
  String _formatPopulation(int population) {
    if (population > 1000000000) {
      return '${(population / 1000000000).toStringAsFixed(1)}B';
    } else if (population > 1000000) {
      return '${(population / 1000000).toStringAsFixed(1)}M';
    } else if (population > 1000) {
      return '${(population / 1000).toStringAsFixed(1)}K';
    }
    return NumberFormat.compact().format(population);
  }

  @override
  Widget build(BuildContext context) {
    // We'll use the screen width to make the card responsive
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                DestinationDetailsScreen(destination: destination),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        elevation: 12.0,
        shadowColor: Colors.black.withValues(alpha: .5),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // --- Layer 1: The Background Image ---
            // This will eventually be an Unsplash image, but the flag works for now.
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              // Pro-Tip: When you have Unsplash, use destination.imageUrls.first here!
              image: destination.flagUrl,
              fit: BoxFit.cover,
              height:
                  screenWidth * 0.7, // A nice height relative to screen width
              width: double.infinity,
              imageErrorBuilder: (context, error, stackTrace) {
                return Container(
                  height: screenWidth * 0.9,
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: Icon(Icons.terrain, color: Colors.grey, size: 60),
                  ),
                );
              },
            ),

            // --- Layer 2: The "Frosted Glass" Panel ---
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: .25),
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: .2),
                        width: 1.5,
                      ),
                    ),
                    child: _buildGlassContent(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for the content to keep the build method clean
  Widget _buildGlassContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Make the column wrap its content
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // --- Header Row: Name and Flag ---
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                destination.name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    const Shadow(blurRadius: 2.0, color: Colors.black54),
                  ],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 12),
            // --- Layer 3: The Flag Avatar ---
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white.withValues(alpha: .3),
              backgroundImage: NetworkImage(destination.flagUrl),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Divider(color: Colors.white.withValues(alpha: .3)),
        const SizedBox(height: 8),
        // --- Stats Section ---
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildStatColumn(
              context,
              icon: Icons.people_alt_outlined,
              label: 'Population',
              value: _formatPopulation(destination.population),
            ),
            _buildStatColumn(
              context,
              icon: Icons.public_outlined,
              label: 'Region',
              value: destination.region,
            ),
            _buildStatColumn(
              context,
              icon: Icons.location_city_outlined,
              label: 'Capital',
              value: destination.capital,
              isLast: true,
            ),
          ],
        ),
      ],
    );
  }

  // Helper for the individual stat columns
  Widget _buildStatColumn(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    bool isLast = false,
  }) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: Colors.white.withValues(alpha: .8), size: 20),
          const SizedBox(height: 4),
          Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.white.withValues(alpha: .7),
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
