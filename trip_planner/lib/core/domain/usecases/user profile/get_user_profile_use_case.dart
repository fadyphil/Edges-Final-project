import 'package:trip_planner/core/domain/entities/user_profile_entity.dart';
import 'package:trip_planner/core/domain/repo/user_repository.dart';

class GetUserProfileUseCase {
  final UserRepository _userRepository;

  GetUserProfileUseCase(this._userRepository);

  Future<UserProfile?> call() async {
    return await _userRepository.getUserProfile();
  }
}
