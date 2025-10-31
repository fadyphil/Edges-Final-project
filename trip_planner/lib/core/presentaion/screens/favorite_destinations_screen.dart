// lib/presentation/favorites/favorites_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/presentaion/blocs/api%20states/api_state.dart';
import 'package:trip_planner/core/domain/entities/destination_entity.dart';
import 'package:trip_planner/core/presentaion/blocs/favorite/favorite_screen_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/favorite/favorites_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/favorite/favorites_state.dart';
import 'package:trip_planner/core/presentaion/screens/destination_details_screen.dart';
import 'package:trip_planner/core/service_locator.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This BlocProvider creates the cubit and kicks off the initial data load.
    return BlocProvider(
      create: (context) => sl<FavoritesScreenCubit>()..loadFavorites(),
      child: const _FavoritesView(),
    );
  }
}

class _FavoritesView extends StatelessWidget {
  const _FavoritesView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Favorite Destinations'),
            pinned: true,
            floating: true,
          ),
          // We wrap the main content in a BlocListener to handle automatic refreshes
          // from the global FavoritesCubit.
          BlocListener<FavoritesCubit, List<String>>(
            listener: (context, state) {
              // Whenever the global list of favorite IDs changes, reload this screen's data.
              context.read<FavoritesScreenCubit>().loadFavorites();
            },
            child: BlocBuilder<FavoritesScreenCubit, FavoritesScreenState>(
              builder: (context, state) {
                return state.favoritesState.when(
                  initial: () => const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  loading: () => const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (message) =>
                      SliverFillRemaining(child: Center(child: Text(message))),
                  success: (destinations) {
                    if (destinations.isEmpty) {
                      return const _EmptyFavoritesState();
                    }

                    // Use a SliverGrid for an efficient, beautiful layout
                    return SliverPadding(
                      padding: const EdgeInsets.all(16.0),
                      sliver: SliverGrid.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio:
                                  0.75, // Adjust this ratio to fit your card design
                            ),
                        itemCount: destinations.length,
                        itemBuilder: (context, index) {
                          return _FavoriteDestinationCard(
                            destination: destinations[index],
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// A dedicated card for the Favorites screen to handle navigation
class _FavoriteDestinationCard extends StatelessWidget {
  final Destination destination;
  const _FavoriteDestinationCard({required this.destination});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Example of navigating to a details screen if you had one:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DestinationDetailsScreen(destination: destination),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              destination.imageUrls.isNotEmpty
                  ? destination.imageUrls.first
                  : destination.flagUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  Image.network(destination.flagUrl, fit: BoxFit.cover),
            ),
            Container(
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
              bottom: 12,
              left: 12,
              right: 12,
              child: Text(
                destination.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  shadows: [Shadow(blurRadius: 2, color: Colors.black54)],
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// The dedicated widget for the empty state
class _EmptyFavoritesState extends StatelessWidget {
  const _EmptyFavoritesState();

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.favorite_border, size: 80, color: Colors.grey),
              const SizedBox(height: 16),
              Text(
                'No Favorites Yet',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              const Text(
                'Tap the heart icon on any destination to save it here for later.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
