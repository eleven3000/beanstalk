import '../../domain/repositories/comment_repository.dart';
import '../datasources/comment_remote_datasource.dart';
import '../models/comment.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentRemoteDataSource remoteDataSource;

  CommentRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Comment>> getCommentsForPost(String postId) async {
    return await remoteDataSource.getCommentsForPost(postId);
  }

  @override
  Future<Comment?> getCommentById(String id) async {
    return await remoteDataSource.getCommentById(id);
  }

  @override
  Future<void> addComment(Comment comment) async {
    await remoteDataSource.addComment(comment);
  }

  @override
  Future<void> updateComment(Comment comment) async {
    await remoteDataSource.updateComment(comment);
  }

  @override
  Future<void> deleteComment(String id) async {
    await remoteDataSource.deleteComment(id);
  }
}
