abstract class AuthRepository {
  Future<bool> login(String email, String password);
  Future<bool> register(String username, String email, String password);
  Future<void> logout();
  Future<bool> isAuthenticated();
}
