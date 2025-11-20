import '../models/post.dart';

class PostRemoteDataSource {
  Future<List<Post>> getFeedPosts() async {
    await Future.delayed(const Duration(milliseconds: 700));
    return [
      Post(
        id: 'post1',
        title: 'Morning Brew',
        description: 'Enjoying a fantastic latte at Cafe Aroma!',
        imageUrls: ['https://picsum.photos/id/237/200/300'],
        userId: 'user1',
        cafeId: 'cafe1',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        likes: ['user2', 'user3'],
      ),
      Post(
        id: 'post2',
        title: 'New Spot!',
        description: 'Discovered this hidden gem. Great ambiance.',
        imageUrls: ['https://picsum.photos/id/238/200/300'],
        userId: 'user4',
        cafeId: 'cafe2',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        likes: ['user1'],
      ),
    ];
  }

  Future<Post?> getPostById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (id == 'post1') {
      return Post(
        id: 'post1',
        title: 'Morning Brew',
        description: 'Enjoying a fantastic latte at Cafe Aroma!',
        imageUrls: ['https://picsum.photos/id/237/200/300'],
        userId: 'user1',
        cafeId: 'cafe1',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        likes: ['user2', 'user3'],
      );
    }
    return null;
  }

  Future<void> createPost(Post post) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Mock API: Post ${post.title} created.');
  }

  Future<void> updatePost(Post post) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Mock API: Post ${post.title} updated.');
  }

  Future<void> deletePost(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Mock API: Post $id deleted.');
  }

  Future<void> likePost(String postId, String userId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    print('Mock API: User $userId liked post $postId.');
  }

  Future<void> unlikePost(String postId, String userId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    print('Mock API: User $userId unliked post $postId.');
  }
}
