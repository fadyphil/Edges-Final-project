// lib/presentation/details/destination_details_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trip_planner/features/destination/domain/entities/destination_entity.dart';
import 'package:trip_planner/core/presentation/blocs/api_states/api_state.dart';
import 'package:trip_planner/features/destination/presentation/blocs/destination_image_urls_cubit.dart';
import 'package:trip_planner/features/favorites/presentation/blocs/favorites_cubit.dart';
import 'package:trip_planner/features/trip/presentation/screens/trip_planning_screen.dart';
import 'package:trip_planner/features/weather/presentation/widgets/weather_card.dart';

import 'package:trip_planner/core/di/service_locator.dart';

class DestinationDetailsScreen extends StatelessWidget {
  final Destination destination;

  const DestinationDetailsScreen({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<DestinationImageUrlsCubit>()..fetchImageUrls(destination.name),
      child: _DestinationDetailsView(destination: destination),
    );
  }
}

class _DestinationDetailsView extends StatelessWidget {
  final Destination destination;
  const _DestinationDetailsView({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: WeatherCard(destination: destination),
            ),
          ),
          SliverToBoxAdapter(child: _buildContentSheet(context)),
        ],
      ),
    );
  }

  // --- BUILDER METHODS ---

  Widget _buildSliverAppBar(BuildContext context) {
    return BlocBuilder<DestinationImageUrlsCubit, ApiState<List<String>>>(
      builder: (context, imageState) {
        final primaryImageUrl = imageState.maybeWhen(
          success: (urls) => urls.isNotEmpty ? urls.first : destination.flagUrl,
          orElse: () => destination.flagUrl,
        );

        return SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height * 0.45,
          pinned: true,
          stretch: true,
          elevation: 0,
          leading: _buildAppBarButton(
            context,
            icon: Icons.arrow_back,
            onPressed: () => Navigator.of(context).pop(),
          ),
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [StretchMode.zoomBackground],
            background: Stack(
              fit: StackFit.expand,
              children: [
                // --- REQUIREMENT: Hero Animation ---
                // The Hero widget creates the seamless transition. The tag must be unique.
                Hero(
                  tag: 'destination_image_${destination.id}',
                  child: Image.network(
                    primaryImageUrl,
                    fit: BoxFit.cover,
                    frameBuilder: (context, child, frame, wasSync) => wasSync
                        ? child
                        : AnimatedOpacity(
                            opacity: frame == null ? 0 : 1,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeOut,
                            child: child,
                          ),
                    errorBuilder: (_, __, ___) =>
                        Image.network(destination.flagUrl, fit: BoxFit.cover),
                  ),
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black38, Colors.transparent],
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                    ),
                  ),
                ),
                // _buildImageGallery(context, imageState),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAppBarButton(
    BuildContext context, {
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.black.withValues(alpha: .4),
        child: IconButton(
          icon: Icon(icon, color: Colors.white),
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget _buildContentSheet(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0.0, -24.0, 0.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination.name,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey.shade600,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${destination.capital}, ${destination.region}',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // --- REQUIREMENT: "Add to Favorites" button with animation ---
              BlocBuilder<FavoritesCubit, List<String>>(
                builder: (context, favoriteIds) {
                  final isFavorite = favoriteIds.contains(destination.id);
                  return IconButton(
                    iconSize: 32,
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, animation) =>
                          ScaleTransition(scale: animation, child: child),
                      child: isFavorite
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                              key: const ValueKey('favorite'),
                            )
                          : Icon(
                              Icons.favorite_border,
                              color: Colors.grey,
                              key: const ValueKey('not_favorite'),
                            ),
                    ),
                    onPressed: () => context
                        .read<FavoritesCubit>()
                        .toggleFavorite(destination.id),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 24),

          // --- REQUIREMENT: Detailed country information ---
          _buildInfoGrid(context),
          const SizedBox(height: 32),

          // --- REQUIREMENT: "Plan Trip" button ---
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => TripPlanningScreen(destination: destination),
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
              ),
              child: const Text(
                "Plan A Trip",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // NEW WIDGET: Displays detailed info in a clean grid
  Widget _buildInfoGrid(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3.5,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      children: [
        _buildInfoItem(
          context,
          icon: Icons.people_alt_outlined,
          label: 'Population',
          value: NumberFormat.compact().format(destination.population),
        ),
        _buildInfoItem(
          context,
          icon: Icons.translate,
          label: 'Language',
          value: destination.languages.first,
        ),
        _buildInfoItem(
          context,
          icon: Icons.attach_money,
          label: 'Currency',
          value:
              '${destination.currency.name} (${destination.currency.symbol})',
        ),
        _buildInfoItem(
          context,
          icon: Icons.access_time,
          label: 'Timezone',
          value: destination.timezone,
        ),
      ],
    );
  }

  Widget _buildInfoItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Wrap(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.secondary, size: 24),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
