import 'package:flutter_application_1/core/models/user.dart';
import 'package:flutter_application_1/features/auth/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository);
});

class AuthController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  Future<void> createUser(String email, String password) async {
    return authRepository.createUser(email, password);
  }

  Future<UserModel> signIn(String email, String password) async {
    return await authRepository.signIn(email, password);
  }
}
