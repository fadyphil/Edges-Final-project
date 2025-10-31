import 'package:trip_planner/core/domain/repo/user_repository.dart';

class ClearUserProfileUseCase {
  final UserRepository _userRepository;

  ClearUserProfileUseCase(this._userRepository);

  Future<void> call() async {
    await _userRepository.clearUserProfile();
  }
}
