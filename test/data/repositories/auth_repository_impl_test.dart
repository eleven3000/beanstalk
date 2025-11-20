import 'package:flutter_test/flutter_test.dart';
import 'package:beanstalk/src/data/datasources/auth_remote_datasource.dart';
import 'package:beanstalk/src/data/repositories/auth_repository_impl.dart';
import 'package:beanstalk/src/domain/repositories/auth_repository.dart';

// A simple fake for AuthRemoteDataSource
class FakeAuthRemoteDataSource implements AuthRemoteDataSource {
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
  group('AuthRepositoryImpl', () {
    late AuthRepository authRepository;
    late FakeAuthRemoteDataSource fakeRemoteDataSource;

    setUp(() {
      fakeRemoteDataSource = FakeAuthRemoteDataSource();
      authRepository = AuthRepositoryImpl(
        remoteDataSource: fakeRemoteDataSource,
      );
    });

    test('login calls remoteDataSource.login and returns its result', () async {
      fakeRemoteDataSource.setLoginResponse(true);
      expect(
        await authRepository.login('test@example.com', 'password'),
        isTrue,
      );

      fakeRemoteDataSource.setLoginResponse(false);
      expect(
        await authRepository.login('test@example.com', 'password'),
        isFalse,
      );
    });

    test(
      'register calls remoteDataSource.register and returns its result',
      () async {
        fakeRemoteDataSource.setRegisterResponse(true);
        expect(
          await authRepository.register(
            'user',
            'email@example.com',
            'password',
          ),
          isTrue,
        );

        fakeRemoteDataSource.setRegisterResponse(false);
        expect(
          await authRepository.register(
            'user',
            'email@example.com',
            'password',
          ),
          isFalse,
        );
      },
    );

    test(
      'isAuthenticated calls remoteDataSource.isAuthenticated and returns its result',
      () async {
        fakeRemoteDataSource.setAuthenticated(true);
        expect(await authRepository.isAuthenticated(), isTrue);

        fakeRemoteDataSource.setAuthenticated(false);
        expect(await authRepository.isAuthenticated(), isFalse);
      },
    );

    test('logout calls remoteDataSource.logout', () async {
      expect(
        authRepository.logout(),
        completes,
      ); // Just ensure it doesn't throw
    });
  });
}
