// lib/core/data/local/user_local_data_source.dart

import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip_planner/core/domain/entities/user_profile_entity.dart';

// The abstract contract for our local data source
abstract class UserLocalDataSource {
  Future<UserProfile?> getUserProfile();
  Future<void> saveUserProfile(UserProfile userProfile);
  Future<void> clearUserProfile();
  Future<void> updateUserProfile(UserProfile userProfile);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences _sharedPreferences;
  // Define a constant key for storing the user profile data.
  static const String _userProfileKey = 'user_profile';

  UserLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<void> saveUserProfile(UserProfile userProfile) async {
    try {
      // Freezed automatically gives us the toJson() method.
      final jsonMap = userProfile.toJson();
      // json.encode converts the map to a JSON string for storage.
      final jsonString = json.encode(jsonMap);
      await _sharedPreferences.setString(_userProfileKey, jsonString);
    } catch (e) {
      // In a real app, you might log this error.
      log(
        'error in saveUserProfile: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
      // Re-throw the error so the repository layer can be aware of the failure.
      throw Exception('Could not save user profile.');
    }
  }

  @override
  Future<UserProfile?> getUserProfile() async {
    try {
      final jsonString = _sharedPreferences.getString(_userProfileKey);

      // If no string is found, there's no saved profile.
      if (jsonString == null) {
        return null;
      }

      // json.decode converts the string back to a map.
      final jsonMap = json.decode(jsonString);
      // Freezed's generated fromJson factory creates the object for us.
      return UserProfile.fromJson(jsonMap);
    } catch (e) {
      log(
        '❌ ERROR retrieving user profile: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
      // If there's any error during parsing, assume the data is invalid.
      return null;
    }
  }

  @override
  Future<void> clearUserProfile() async {
    try {
      await _sharedPreferences.remove(_userProfileKey);
    } catch (e) {
      log(
        'error in  clearUserProfile: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
    }
  }

  @override
  Future<void> updateUserProfile(UserProfile userProfile) async {
    try {
      await saveUserProfile(userProfile);
    } catch (e) {
      log(
        '❌ ERROR updating user profile: $e',
        error: e,
        stackTrace: StackTrace.current,
      );
    }
  }
}
