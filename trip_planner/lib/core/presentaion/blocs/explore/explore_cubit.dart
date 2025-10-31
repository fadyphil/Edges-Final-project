// lib/presentation/explore/bloc/explore_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_planner/core/domain/entities/destination_entity.dart';
import 'package:trip_planner/core/domain/usecases/destination%20use%20cases/get_destinations_use_case.dart';
import 'package:trip_planner/core/presentaion/blocs/api%20states/api_state.dart';

import './explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  final GetDestinationsUseCase _getDestinationsUseCase;

  ExploreCubit(this._getDestinationsUseCase) : super(ExploreState());

  /// Fetches the master list of destinations from the repository.
  Future<void> getDestinations({bool forceRefresh = false}) async {
    // Only show full-screen loading on the initial fetch.
    if (state.allDestinations.isEmpty) {
      emit(state.copyWith(destinations: const ApiState.loading()));
    }

    try {
      // The 'forceRefresh' parameter can be used to tell the repository to bypass its cache.
      final result = await _getDestinationsUseCase(forceRefresh: forceRefresh);

      // Shuffle the list to fulfill the "random countries" requirement for the featured section.
      final shuffledResult = List<Destination>.from(result)..shuffle();

      emit(
        state.copyWith(
          destinations: ApiState.success(data: shuffledResult),
          allDestinations: shuffledResult, // Store the master list
        ),
      );

      // After fetching, immediately apply any existing filters.
      _applyFilters();
    } catch (e) {
      emit(state.copyWith(destinations: ApiState.error(message: e.toString())));
    }
  }

  /// Called when the user types in the search bar.
  void searchQueryChanged(String query) {
    emit(state.copyWith(searchQuery: query));
    _applyFilters();
  }

  /// Called when the user selects a new category filter chip.
  void filterChanged(String filter) {
    emit(state.copyWith(activeFilter: filter));
    _applyFilters();
  }

  /// Private helper method that runs all filtering logic.
  /// This is the single source of truth for the displayed list.
  void _applyFilters() {
    // Start with the master list of all destinations.
    List<Destination> filteredList = List.from(state.allDestinations);

    // 1. Apply the category filter.
    if (state.activeFilter != 'Popular') {
      // The API doesn't provide categories, so we'll simulate it.
      // In a real app, your Destination entity would have a 'category' list.
      // For now, let's just filter by region as a proxy.
      filteredList = filteredList.where((dest) {
        // This is a placeholder for real category filtering
        return dest.region.toLowerCase().contains(
          state.activeFilter.toLowerCase(),
        );
      }).toList();
    }

    // 2. Apply the search query filter.
    if (state.searchQuery.trim().isNotEmpty) {
      final query = state.searchQuery.trim().toLowerCase();
      filteredList = filteredList.where((dest) {
        return dest.name.toLowerCase().contains(query) ||
            dest.name.toLowerCase().contains(
              query,
            ); // Assuming Destination has a country field
      }).toList();
    }

    // 3. Emit the final, filtered list for the UI to display.
    emit(state.copyWith(filteredDestinations: filteredList));
  }
}
