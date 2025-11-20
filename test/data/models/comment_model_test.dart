import 'package:flutter_test/flutter_test.dart';
import 'package:beanstalk/src/data/models/comment.dart';

void main() {
  group('Comment', () {
    test('fromJson creates a valid Comment object', () {
      final now = DateTime.now();
      final Map<String, dynamic> json = {
        'id': 'test_comment_id',
        'text': 'This is a test comment.',
        'userId': 'test_user_id',
        'postId': 'test_post_id',
        'createdAt': now.toIso8601String(),
      };

      final comment = Comment.fromJson(json);

      expect(comment.id, 'test_comment_id');
      expect(comment.text, 'This is a test comment.');
      expect(comment.userId, 'test_user_id');
      expect(comment.postId, 'test_post_id');
      expect(comment.createdAt.toIso8601String(), now.toIso8601String());
    });

    test('toJson converts a Comment object to a valid JSON map', () {
      final now = DateTime.now();
      final comment = Comment(
        id: 'test_comment_id',
        text: 'This is a test comment.',
        userId: 'test_user_id',
        postId: 'test_post_id',
        createdAt: now,
      );

      final json = comment.toJson();

      expect(json['id'], 'test_comment_id');
      expect(json['text'], 'This is a test comment.');
      expect(json['userId'], 'test_user_id');
      expect(json['postId'], 'test_post_id');
      expect(json['createdAt'], now.toIso8601String());
    });
  });
}
