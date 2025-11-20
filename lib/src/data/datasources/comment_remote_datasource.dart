import '../models/comment.dart';

class CommentRemoteDataSource {
  Future<List<Comment>> getCommentsForPost(String postId) async {
    await Future.delayed(const Duration(milliseconds: 600));
    if (postId == 'post1') {
      return [
        Comment(
          id: 'comment1',
          text: 'Looks delicious!',
          userId: 'user2',
          postId: 'post1',
          createdAt: DateTime.now().subtract(const Duration(hours: 1)),
        ),
        Comment(
          id: 'comment2',
          text: 'I need to visit this place soon.',
          userId: 'user3',
          postId: 'post1',
          createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
        ),
      ];
    }
    return [];
  }

  Future<Comment?> getCommentById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (id == 'comment1') {
      return Comment(
        id: 'comment1',
        text: 'Looks delicious!',
        userId: 'user2',
        postId: 'post1',
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      );
    }
    return null;
  }

  Future<void> addComment(Comment comment) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print(
      'Mock API: Comment "${comment.text}" added to post ${comment.postId}.',
    );
  }

  Future<void> updateComment(Comment comment) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Mock API: Comment ${comment.id} updated.');
  }

  Future<void> deleteComment(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Mock API: Comment $id deleted.');
  }
}
