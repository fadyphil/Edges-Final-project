// lib/presentation/explore/explore_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:trip_planner/core/presentaion/blocs/profile/profile_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/profile/profile_state.dart';
import 'package:trip_planner/core/presentation/blocs/api_states/api_state.dart';
import 'package:trip_planner/features/destination/domain/entities/destination_entity.dart';
import 'package:trip_planner/features/destination/presentation/blocs/explore_cubit.dart';
import 'package:trip_planner/features/destination/presentation/blocs/explore_state.dart';
import 'package:trip_planner/features/destination/presentation/widgets/destination_card.dart';
import 'package:trip_planner/features/destination/presentation/widgets/swipped_big_cards.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // We provide the screen-specific ExploreCubit here.
    return const _ExploreView();
  }
}

class _ExploreView extends StatelessWidget {
  const _ExploreView();

  @override
  Widget build(BuildContext context) {
    // We use a BlocBuilder for the UserProfileCubit to get the user's name.
    return BlocBuilder<ProfileCubit, ProfileState?>(
      builder: (context, profileState) {
        final userProfile = profileState?.userProfileState.whenOrNull(
          success: (user) => user,
        );
        final userName = userProfile?.name ?? 'Guest';
        final userIntrests = userProfile?.tavelInterests ?? [];

        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<ExploreCubit>().getDestinations(forceRefresh: true);
            },
            child: BlocBuilder<ExploreCubit, ExploreState>(
              builder: (context, state) {
                return state.destinations.when(
                  success: (data) {
                    if (data.isEmpty) {
                      return const Center(
                        child: Text('No destinations found.'),
                      );
                    }

                    final featuredDestinations = data.take(5).toList();
                    final filteredDestinations = state.filteredDestinations;

                    return CustomScrollView(
                      slivers: [
                        _WelcomeHeader(userName: userName),
                        _FeaturedCarousel(destinations: featuredDestinations),
                        const _SectionHeader(title: 'Categories'),
                        _CategoryFilters(interests: userIntrests),
                        _SearchBarHeader(),
                        const _SectionHeader(title: 'Popular Destinations'),
                        _DestinationsList(destinations: filteredDestinations),
                      ],
                    );
                  },
                  error: (message) => Center(child: Text(message)),
                  initial: () =>
                      const Center(child: CircularProgressIndicator()),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

// --- UI WIDGETS (Refactored for clarity) ---

class _WelcomeHeader extends StatelessWidget {
  final String userName;
  const _WelcomeHeader({required this.userName});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi $userName,",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              "Where do you wanna go?",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeaturedCarousel extends StatelessWidget {
  final List<Destination> destinations;
  const _FeaturedCarousel({required this.destinations});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 330,
        child: CardSwiper(
          cardsCount: destinations.length,
          cardBuilder: (context, index, _, __) =>
              SwippedBigCards(destination: destinations[index]),
          isLoop: true,
          numberOfCardsDisplayed: 3,
          backCardOffset: const Offset(0, 25),
        ),
      ),
    );
  }
}

class _CategoryFilters extends StatelessWidget {
  final List<String> interests;
  const _CategoryFilters({required this.interests});

  @override
  Widget build(BuildContext context) {
    // Add "Popular" as a default filter
    final filters = ['Popular', ...interests];
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: filters.length,
          itemBuilder: (context, index) {
            final filter = filters[index];
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: BlocBuilder<ExploreCubit, ExploreState>(
                buildWhen: (p, c) => p.activeFilter != c.activeFilter,
                builder: (context, state) {
                  return FilterChip(
                    label: Text(filter),
                    selected: state.activeFilter == filter,
                    onSelected: (isSelected) {
                      if (isSelected) {
                        context.read<ExploreCubit>().filterChanged(filter);
                      }
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SearchBarHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SearchBarSliverDelegate(
        child: Container(
          color: Theme.of(context).colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            child: TextField(
              onChanged: (query) {
                context.read<ExploreCubit>().searchQueryChanged(query);
              },
              decoration: InputDecoration(
                hintText: "Search destinations...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DestinationsList extends StatelessWidget {
  final List<Destination> destinations;
  const _DestinationsList({required this.destinations});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: destinations.length,
      itemBuilder: (context, index) {
        return DestinationCard(destination: destinations[index])
            // --- REQUIREMENT: Card entrance animations ---
            .animate()
            .fadeIn(duration: 600.ms, delay: (100 * (index % 10)).ms)
            .slideY(begin: 0.5, end: 0.0);
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// --- Delegate for the sticky search bar ---
class _SearchBarSliverDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  _SearchBarSliverDelegate({required this.child});
  @override
  double get minExtent => 70.0;
  @override
  double get maxExtent => 70.0;
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) => child;
  @override
  bool shouldRebuild(_SearchBarSliverDelegate oldDelegate) =>
      child != oldDelegate.child;
}
