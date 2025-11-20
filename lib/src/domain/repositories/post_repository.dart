import '../../data/models/post.dart';

abstract class PostRepository {
  Future<List<Post>> getFeedPosts();
  Future<Post?> getPostById(String id);
  Future<void> createPost(Post post);
  Future<void> updatePost(Post post);
  Future<void> deletePost(String id);
  Future<void> likePost(String postId, String userId);
  Future<void> unlikePost(String postId, String userId);
}
