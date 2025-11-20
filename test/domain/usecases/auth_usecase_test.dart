import 'package:flutter_test/flutter_test.dart';
import 'package:beanstalk/src/domain/usecases/auth_usecase.dart';
import 'package:beanstalk/src/domain/repositories/auth_repository.dart';

// A simple fake for AuthRepository
class FakeAuthRepository implements AuthRepository {
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
  group('AuthUseCase', () {
    late AuthUseCase authUseCase;
    late FakeAuthRepository fakeAuthRepository;

    setUp(() {
      fakeAuthRepository = FakeAuthRepository();
      authUseCase = AuthUseCase(authRepository: fakeAuthRepository);
    });

    test('login calls authRepository.login and returns its result', () async {
      fakeAuthRepository.setLoginResponse(true);
      expect(await authUseCase.login('test@example.com', 'password'), isTrue);

      fakeAuthRepository.setLoginResponse(false);
      expect(await authUseCase.login('test@example.com', 'password'), isFalse);
    });

    test(
      'register calls authRepository.register and returns its result',
      () async {
        fakeAuthRepository.setRegisterResponse(true);
        expect(
          await authUseCase.register('user', 'email@example.com', 'password'),
          isTrue,
        );

        fakeAuthRepository.setRegisterResponse(false);
        expect(
          await authUseCase.register('user', 'email@example.com', 'password'),
          isFalse,
        );
      },
    );

    test(
      'isAuthenticated calls authRepository.isAuthenticated and returns its result',
      () async {
        fakeAuthRepository.setAuthenticated(true);
        expect(await authUseCase.isAuthenticated(), isTrue);

        fakeAuthRepository.setAuthenticated(false);
        expect(await authUseCase.isAuthenticated(), isFalse);
      },
    );

    test('logout calls authRepository.logout', () async {
      expect(authUseCase.logout(), completes); // Just ensure it doesn't throw
    });
  });
}
