import 'package:trip_planner/core/domain/entities/user_profile_entity.dart';

abstract class UserRepository {
  Future<void> saveUserProfile(UserProfile userProfile);
  Future<UserProfile?> getUserProfile();
  Future<void> clearUserProfile();
  Future<void> updateUserProfile(UserProfile userProfile);
}
