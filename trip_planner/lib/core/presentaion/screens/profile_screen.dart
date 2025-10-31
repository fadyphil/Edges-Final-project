// lib/presentation/profile/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/domain/entities/app_statistics._entity.dart';
import 'package:trip_planner/core/domain/entities/user_profile_entity.dart';
import 'package:trip_planner/core/presentaion/blocs/profile/profile_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/profile/profile_state.dart';
import 'package:trip_planner/core/presentaion/blocs/theme%20cubit/theme_cubit.dart';
import 'package:trip_planner/core/presentaion/widgets/edit_profile_dialog.dart';
import 'package:trip_planner/core/di/service_locator.dart';
import 'package:trip_planner/core/presentation/blocs/api_states/api_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileCubit>(),
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView();

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().loadProfileData();
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          // Use a variable to easily check the loading state
          final isLoading = state.userProfileState.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );

          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Once loaded, build the main scrollable UI
          return CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: Text('Profile & Settings'),
                pinned: true,
              ),

              // We build the content in a SliverList
              SliverList(
                delegate: SliverChildListDelegate([
                  // --- User Profile Section ---
                  _buildUserInfoSection(context, state.userProfileState),
                  const Divider(indent: 16, endIndent: 16),

                  // --- App Statistics Section ---
                  _buildStatsSection(context, state.statisticsState),
                  const Divider(indent: 16, endIndent: 16),

                  // --- Settings Section ---
                  _buildSettingsSection(context),
                  const Divider(indent: 16, endIndent: 16),

                  // --- About Section ---
                  const ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text('About Trip Planner'),
                    subtitle: Text('Version 1.0.0'),
                  ),
                ]),
              ),
            ],
          );
        },
      ),
    );
  }

  // --- BUILDER METHODS FOR EACH SECTION ---

  Widget _buildUserInfoSection(
    BuildContext context,
    ApiState<UserProfile> userProfileState,
  ) {
    return userProfileState.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const ListTile(title: Text('Loading user...')),
      error: (message) => ListTile(title: Text('Error: $message')),
      success: (user) {
        return ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(
            user.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Preferred Currency: ${user.preferredCurrency}'),
          trailing: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => BlocProvider.value(
                  value: BlocProvider.of<ProfileCubit>(context),
                  child: EditProfileDialog(initialProfile: user),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildStatsSection(
    BuildContext context,
    ApiState<AppStatistics> statisticsState,
  ) {
    return statisticsState.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: CircularProgressIndicator(),
        ),
      ),
      error: (message) => Center(child: Text(message)),
      success: (stats) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _StatItem(count: stats.totalTripsPlanned, label: 'Trips Planned'),
              _StatItem(
                count: stats.countriesExplored,
                label: 'Countries Explored',
              ),
              _StatItem(count: stats.favoritesCount, label: 'Favorites'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, state) {
            final isDark =
                state == ThemeMode.dark ||
                (state == ThemeMode.system &&
                    MediaQuery.of(context).platformBrightness ==
                        Brightness.dark);
            return ListTile(
              leading: const Icon(Icons.palette_sharp),
              title: const Text('Theme Mode'),
              trailing: GestureDetector(
                onTap: () => context.read<ThemeCubit>().toggleTheme(),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: FadeTransition(
                        opacity: animation,
                        child: RotationTransition(
                          turns: Tween(
                            begin: 0.75,
                            end: 1.0,
                          ).animate(animation),
                          child: child,
                        ),
                      ),
                    );
                  },
                  child: isDark
                      ? Icon(
                          Icons.wb_sunny_rounded,
                          key: const ValueKey('sun'),
                          color: Colors.yellow.shade700,
                        )
                      : Icon(
                          Icons.nightlight_round,
                          key: const ValueKey('moon'),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                ),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.delete_sweep, color: Colors.red),
          title: const Text(
            'Clear All App Data',
            style: TextStyle(color: Colors.red),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (dialogContext) => AlertDialog(
                title: const Text('Clear All Data?'),
                content: const Text(
                  'This will permanently delete all your trips, favorites, and user profile. This action cannot be undone.',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(dialogContext).pop(),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<ProfileCubit>().clearAllData();
                      Navigator.of(dialogContext).pop();
                    },
                    child: const Text(
                      'Clear Data',
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
}

// Helper widget for the statistics display
class _StatItem extends StatelessWidget {
  final int count;
  final String label;
  const _StatItem({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
