import '../../data/models/user.dart';

abstract class UserRepository {
  Future<User?> getUserById(String id);
  Future<User?> getUserByUsername(String username);
  Future<void> createUser(User user);
  Future<void> updateUser(User user);
  Future<void> deleteUser(String id);
  Future<void> followUser(String userId, String targetUserId);
  Future<void> unfollowUser(String userId, String targetUserId);
}
