import '../data/repository/user_repository.dart';

class CanCustomerRegisterUseCase {
  final UserRepository userRepository;

  CanCustomerRegisterUseCase({required this.userRepository});

  Future<bool> invoke(String fiscalCode) async {
    try {
      final registries = await userRepository.userService.getUserRegistries(fiscalCode);

      return registries.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
