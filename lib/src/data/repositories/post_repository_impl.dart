import '../../domain/repositories/post_repository.dart';
import '../datasources/post_remote_datasource.dart';
import '../models/post.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Post>> getFeedPosts() async {
    return await remoteDataSource.getFeedPosts();
  }

  @override
  Future<Post?> getPostById(String id) async {
    return await remoteDataSource.getPostById(id);
  }

  @override
  Future<void> createPost(Post post) async {
    await remoteDataSource.createPost(post);
  }

  @override
  Future<void> updatePost(Post post) async {
    await remoteDataSource.updatePost(post);
  }

  @override
  Future<void> deletePost(String id) async {
    await remoteDataSource.deletePost(id);
  }

  @override
  Future<void> likePost(String postId, String userId) async {
    await remoteDataSource.likePost(postId, userId);
  }

  @override
  Future<void> unlikePost(String postId, String userId) async {
    await remoteDataSource.unlikePost(postId, userId);
  }
}
