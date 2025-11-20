import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_datasource.dart';
import '../models/user.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User?> getUserById(String id) async {
    return await remoteDataSource.getUserById(id);
  }

  @override
  Future<User?> getUserByUsername(String username) async {
    return await remoteDataSource.getUserByUsername(username);
  }

  @override
  Future<void> createUser(User user) async {
    await remoteDataSource.createUser(user);
  }

  @override
  Future<void> updateUser(User user) async {
    await remoteDataSource.updateUser(user);
  }

  @override
  Future<void> deleteUser(String id) async {
    await remoteDataSource.deleteUser(id);
  }

  @override
  Future<void> followUser(String userId, String targetUserId) async {
    await remoteDataSource.followUser(userId, targetUserId);
  }

  @override
  Future<void> unfollowUser(String userId, String targetUserId) async {
    await remoteDataSource.unfollowUser(userId, targetUserId);
  }
}
