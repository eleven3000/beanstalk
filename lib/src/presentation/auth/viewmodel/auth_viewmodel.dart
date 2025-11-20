import 'package:flutter/material.dart';
import 'package:beanstalk/src/domain/usecases/auth_usecase.dart'; // Import AuthUseCase

enum AuthStatus {
  uninitialized,
  authenticated,
  unauthenticated,
  authenticating,
  registering,
}

class AuthViewModel extends ChangeNotifier {
  final AuthUseCase _authUseCase; // Use AuthUseCase

  AuthStatus _status = AuthStatus.uninitialized;
  String? _errorMessage;

  AuthStatus get status => _status;
  String? get errorMessage => _errorMessage;

  AuthViewModel({required AuthUseCase authUseCase}) // Update constructor
    : _authUseCase = authUseCase {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    _status = AuthStatus.authenticating;
    notifyListeners();
    final isAuthenticated = await _authUseCase
        .isAuthenticated(); // Use AuthUseCase
    _status = isAuthenticated
        ? AuthStatus.authenticated
        : AuthStatus.unauthenticated;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    _status = AuthStatus.authenticating;
    _errorMessage = null;
    notifyListeners();
    try {
      final success = await _authUseCase.login(
        email,
        password,
      ); // Use AuthUseCase
      if (success) {
        _status = AuthStatus.authenticated;
        notifyListeners();
        return true;
      } else {
        _errorMessage = 'Invalid email or password.';
        _status = AuthStatus.unauthenticated;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = 'Login failed: ${e.toString()}';
      _status = AuthStatus.unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future<bool> register(String username, String email, String password) async {
    _status = AuthStatus.registering;
    _errorMessage = null;
    notifyListeners();
    try {
      final success = await _authUseCase.register(
        username,
        email,
        password,
      ); // Use AuthUseCase
      if (success) {
        _status = AuthStatus.authenticated; // Assume auto-login after register
        notifyListeners();
        return true;
      } else {
        _errorMessage = 'Registration failed. User might already exist.';
        _status = AuthStatus.unauthenticated;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = 'Registration failed: ${e.toString()}';
      _status = AuthStatus.unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    _status = AuthStatus.authenticating;
    notifyListeners();
    await _authUseCase.logout(); // Use AuthUseCase
    _status = AuthStatus.unauthenticated;
    notifyListeners();
  }
}
