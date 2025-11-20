import '../../data/models/comment.dart';

abstract class CommentRepository {
  Future<List<Comment>> getCommentsForPost(String postId);
  Future<Comment?> getCommentById(String id);
  Future<void> addComment(Comment comment);
  Future<void> updateComment(Comment comment);
  Future<void> deleteComment(String id);
}
