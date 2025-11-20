import 'package:flutter_test/flutter_test.dart';
import 'package:beanstalk/src/data/datasources/auth_remote_datasource.dart';

void main() {
  group('AuthRemoteDataSource', () {
    late AuthRemoteDataSource dataSource;

    setUp(() {
      dataSource = AuthRemoteDataSource();
    });

    test('login returns true for valid credentials', () async {
      final result = await dataSource.login('test@example.com', 'password');
      expect(result, isTrue);
    });

    test('login returns false for invalid credentials', () async {
      final result = await dataSource.login('wrong@example.com', 'wrong');
      expect(result, isFalse);
    });

    test('register returns true for new user', () async {
      final result = await dataSource.register(
        'newuser',
        'new@example.com',
        'password',
      );
      expect(result, isTrue);
    });

    test('register returns false if user already exists', () async {
      // Simulate user already existing by using the "test@example.com" email
      final result = await dataSource.register(
        'existing',
        'test@example.com',
        'password',
      );
      expect(result, isFalse);
    });

    test('isAuthenticated returns true', () async {
      final result = await dataSource.isAuthenticated();
      expect(result, isTrue);
    });

    test('logout completes successfully', () async {
      expect(dataSource.logout(), completes);
    });
  });
}
