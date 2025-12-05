import 'package:trip_planner/core/domain/entities/user_profile_entity.dart';
import 'package:trip_planner/core/domain/repo/user_repository.dart';

class UpdateUserProfileUseCase {
  final UserRepository _userRepository;

  UpdateUserProfileUseCase(this._userRepository);

  Future<void> call(UserProfile userProfile) async {
    await _userRepository.updateUserProfile(userProfile);
  }
}
