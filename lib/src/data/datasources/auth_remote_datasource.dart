class AuthRemoteDataSource {
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    if (email == 'test@example.com' && password == 'password') {
      print('Mock API: User $email logged in.');
      return true;
    }
    print('Mock API: Login failed for $email.');
    return false;
  }

  Future<bool> register(String username, String email, String password) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    if (email != 'test@example.com') {
      // Simulate successful registration for new users
      print('Mock API: User $username ($email) registered.');
      return true;
    }
    print('Mock API: Registration failed for $email (already exists).');
    return false;
  }

  Future<void> logout() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    ); // Simulate network delay
    print('Mock API: User logged out.');
  }

  Future<bool> isAuthenticated() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
    ); // Simulate network delay
    // For now, always return true for simplicity in mock
    return true;
  }
}
