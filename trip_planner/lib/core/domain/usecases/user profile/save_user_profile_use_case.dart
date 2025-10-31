import 'package:trip_planner/core/domain/entities/user_profile_entity.dart';
import 'package:trip_planner/core/domain/repo/user_repository.dart';

class SaveUserProfileUseCase {
  final UserRepository _userRepository;

  SaveUserProfileUseCase(this._userRepository);

  Future<void> call(UserProfile userProfile) async {
    await _userRepository.saveUserProfile(userProfile);
  }
}
