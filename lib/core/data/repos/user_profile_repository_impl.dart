import 'dart:developer';

import 'package:trip_planner/core/data/local/user%20%20profile/user_local_data_source.dart';
import 'package:trip_planner/core/domain/entities/user_profile_entity.dart';
import 'package:trip_planner/core/domain/repo/user_repository.dart';

class UserProfileRepositoryImpl implements UserRepository {
  final UserLocalDataSource _localDataSource;
  UserProfileRepositoryImpl(this._localDataSource);

  @override
  Future<UserProfile?> getUserProfile() async {
    try {
      final userProfile = await _localDataSource.getUserProfile();
      return userProfile;
    } catch (e) {
      log(
        '❌ ERROR retrieving user profile: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
      return null;
    }
  }

  @override
  Future<void> clearUserProfile() async {
    try {
      await _localDataSource.clearUserProfile();
    } catch (e) {
      log(
        '❌ ERROR clearing user profile: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
    }
  }

  @override
  Future<void> saveUserProfile(UserProfile userProfile) async {
    try {
      await _localDataSource.saveUserProfile(userProfile);
    } catch (e) {
      log(
        '❌ ERROR svaing user profile: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
    }
  }

  @override
  Future<void> updateUserProfile(UserProfile userProfile) async {
    try {
      await _localDataSource.updateUserProfile(userProfile);
    } catch (e) {
      log(
        '❌ ERROR updating user profile: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
    }
  }
}
