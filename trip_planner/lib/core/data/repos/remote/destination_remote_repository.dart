// lib/core/data/repos/destination_repository_impl.dart

// Rename the file and class to be more generic, as it handles both remote and local.
import 'dart:developer';

import 'package:trip_planner/core/data/local/destinations/destination_local_data_source.dart';
import 'package:trip_planner/core/data/mapping/destination_mapper.dart';
import 'package:trip_planner/core/data/services/destination_remote_data_source.dart';
import 'package:trip_planner/core/domain/entities/destination_entity.dart';
import 'package:trip_planner/core/domain/repo/destination_repository.dart';

class DestinationRepositoryImpl implements DestinationRepository {
  final DestinationRemoteDataSource _remoteDataSource;
  final DestinationLocalDataSource _localDataSource;

  // REMOVED the confusing in-memory flag.
  // bool _hasFectchedFromApiThisSession = false;

  DestinationRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<List<Destination>> getDestinations({bool forceRefresh = false}) async {
    try {
      // --- THIS IS THE CORRECTED LOGIC ---

      // 1. If we are NOT forcing a refresh, try the local cache first.
      if (!forceRefresh) {
        final localData = await _localDataSource.getAllDestinations();
        if (localData.isNotEmpty) {
          log('✅ DESTINATION CACHE HIT');
          return localData
              .map((dbEntity) => DestinationMapper.fromDbEntity(dbEntity))
              .toList();
        }
      }

      // 2. If we ARE forcing a refresh, OR if the cache was empty, go to the API.
      log('ℹ️ DESTINATION CACHE MISS or FORCE REFRESH. Fetching from API...');
      final remoteDtos = await _remoteDataSource.fetchDestinations();

      // 3. Map DTOs to DB Entities and update the cache.
      final dbEntities = remoteDtos
          .map((dto) => DestinationMapper.toDbEntity(dto))
          .toList();
      await _localDataSource.cacheDestinations(dbEntities);

      // 4. Map DTOs to Domain Entities and return to the UI.
      return remoteDtos.map((dto) => DestinationMapper.fromDto(dto)).toList();
    } catch (e) {
      log('❌ ERROR fetching remote destinations: $e. Falling back to cache.');
      // 5. FALLBACK: If the API fails for any reason, try the cache one last time.
      // This ensures the user sees data even if their internet cuts out during a refresh.
      final localData = await _localDataSource.getAllDestinations();
      if (localData.isNotEmpty) {
        return localData
            .map((dbEntity) => DestinationMapper.fromDbEntity(dbEntity))
            .toList();
      } else {
        // If API fails AND the cache is empty, there is nothing to show.
        return [];
      }
    }
  }

  // --- The other methods are already very well written ---

  @override
  Future<Destination?> getDestinationById(String id) async {
    try {
      final localData = await _localDataSource.getDestinationById(id);
      if (localData != null) {
        return DestinationMapper.fromDbEntity(localData);
      }
      // Fallback to network if not found in cache
      final remoteDto = await _remoteDataSource.fetchDestinationByCode(id);
      return DestinationMapper.fromDto(remoteDto);
    } catch (e) {
      log(
        '❌ ERROR in DestinationRepositoryImpl.getById: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
      return null;
    }
  }

  @override
  Future<List<Destination>> getDestinationsByIds(List<String> ids) async {
    try {
      final localData = await _localDataSource.getDestinationsByIds(ids);
      return localData
          .map((dbEntity) => DestinationMapper.fromDbEntity(dbEntity))
          .toList();
    } catch (e) {
      log(
        '❌ ERROR in DestinationRepositoryImpl.getByIds: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
      return [];
    }
  }
}
