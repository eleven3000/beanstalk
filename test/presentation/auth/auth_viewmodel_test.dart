import 'package:flutter_test/flutter_test.dart';
import 'package:beanstalk/src/presentation/auth/viewmodel/auth_viewmodel.dart';
import 'package:beanstalk/src/domain/usecases/auth_usecase.dart';
// Needed for FakeAuthRepository

// A simple fake for AuthUseCase
class FakeAuthUseCase implements AuthUseCase {
  bool _loginSuccess = true;
  bool _registerSuccess = true;
  bool _authenticated = true;

  void setLoginResponse(bool success) => _loginSuccess = success;
  void setRegisterResponse(bool success) => _registerSuccess = success;
  void setAuthenticated(bool authenticated) => _authenticated = authenticated;

  @override
  Future<bool> login(String email, String password) async {
    return _loginSuccess;
  }

  @override
  Future<void> logout() async {}

  @override
  Future<bool> register(String username, String email, String password) async {
    return _registerSuccess;
  }

  @override
  Future<bool> isAuthenticated() async {
    return _authenticated;
  }
}

void main() {
  group('AuthViewModel', () {
    late AuthViewModel authViewModel;
    late FakeAuthUseCase fakeAuthUseCase;

    setUp(() {
      fakeAuthUseCase = FakeAuthUseCase();
      authViewModel = AuthViewModel(authUseCase: fakeAuthUseCase);
    });

    test(
      'initial status is unauthenticated if use case returns false',
      () async {
        fakeAuthUseCase.setAuthenticated(false);
        authViewModel = AuthViewModel(authUseCase: fakeAuthUseCase);
        await Future.delayed(Duration.zero); // Allow future to complete
        expect(authViewModel.status, AuthStatus.unauthenticated);
      },
    );

    test('initial status is authenticated if use case returns true', () async {
      fakeAuthUseCase.setAuthenticated(true);
      authViewModel = AuthViewModel(authUseCase: fakeAuthUseCase);
      await Future.delayed(Duration.zero); // Allow future to complete
      expect(authViewModel.status, AuthStatus.authenticated);
    });

    test('login updates status and returns success', () async {
      fakeAuthUseCase.setLoginResponse(true);
      fakeAuthUseCase.setAuthenticated(
        true,
      ); // After login, should be authenticated
      final result = await authViewModel.login('test@example.com', 'password');

      expect(result, isTrue);
      expect(authViewModel.status, AuthStatus.authenticated);
      expect(authViewModel.errorMessage, isNull);
    });

    test('login updates status and returns failure', () async {
      fakeAuthUseCase.setLoginResponse(false);
      fakeAuthUseCase.setAuthenticated(false); // Still unauthenticated
      final result = await authViewModel.login('wrong@example.com', 'password');

      expect(result, isFalse);
      expect(authViewModel.status, AuthStatus.unauthenticated);
      expect(authViewModel.errorMessage, isNotNull);
    });

    test('register updates status and returns success', () async {
      fakeAuthUseCase.setRegisterResponse(true);
      fakeAuthUseCase.setAuthenticated(
        true,
      ); // After register, should be authenticated
      final result = await authViewModel.register(
        'newuser',
        'new@example.com',
        'password',
      );

      expect(result, isTrue);
      expect(authViewModel.status, AuthStatus.authenticated);
      expect(authViewModel.errorMessage, isNull);
    });

    test('register updates status and returns failure', () async {
      fakeAuthUseCase.setRegisterResponse(false);
      fakeAuthUseCase.setAuthenticated(false); // Still unauthenticated
      final result = await authViewModel.register(
        'existing',
        'existing@example.com',
        'password',
      );

      expect(result, isFalse);
      expect(authViewModel.status, AuthStatus.unauthenticated);
      expect(authViewModel.errorMessage, isNotNull);
    });

    test('logout updates status to unauthenticated', () async {
      // First, set authenticated
      fakeAuthUseCase.setAuthenticated(true);
      authViewModel = AuthViewModel(authUseCase: fakeAuthUseCase);
      await Future.delayed(Duration.zero);
      expect(authViewModel.status, AuthStatus.authenticated);

      // Then logout
      fakeAuthUseCase.setAuthenticated(
        false,
      ); // After logout, should be unauthenticated
      await authViewModel.logout();

      expect(authViewModel.status, AuthStatus.unauthenticated);
    });
  });
}
