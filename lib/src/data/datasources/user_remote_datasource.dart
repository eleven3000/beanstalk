import '../models/user.dart';

class UserRemoteDataSource {
  Future<User?> getUserById(String id) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    if (id == 'user1') {
      return User(
        id: 'user1',
        username: 'alice',
        profileImageUrl: 'https://picsum.photos/id/1005/200',
        bio: 'Coffee lover and explorer.',
        followers: ['user2', 'user3'],
        following: ['user4'],
      );
    }
    return null;
  }

  Future<User?> getUserByUsername(String username) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (username == 'alice') {
      return User(
        id: 'user1',
        username: 'alice',
        profileImageUrl: 'https://picsum.photos/id/1005/200',
        bio: 'Coffee lover and explorer.',
        followers: ['user2', 'user3'],
        following: ['user4'],
      );
    }
    return null;
  }

  Future<void> createUser(User user) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Mock API: User ${user.username} created.');
  }

  Future<void> updateUser(User user) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Mock API: User ${user.username} updated.');
  }

  Future<void> deleteUser(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Mock API: User $id deleted.');
  }

  Future<void> followUser(String userId, String targetUserId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Mock API: User $userId followed $targetUserId.');
  }

  Future<void> unfollowUser(String userId, String targetUserId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Mock API: User $userId unfollowed $targetUserId.');
  }
}
