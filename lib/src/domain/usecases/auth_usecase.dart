import '../repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase({required AuthRepository authRepository})
    : _authRepository = authRepository;

  Future<bool> login(String email, String password) async {
    return await _authRepository.login(email, password);
  }

  Future<bool> register(String username, String email, String password) async {
    return await _authRepository.register(username, email, password);
  }

  Future<void> logout() async {
    await _authRepository.logout();
  }

  Future<bool> isAuthenticated() async {
    return await _authRepository.isAuthenticated();
  }
}
