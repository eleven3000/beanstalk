import 'package:flutter_test/flutter_test.dart';
import 'package:beanstalk/src/data/models/post.dart';

void main() {
  group('Post', () {
    test('fromJson creates a valid Post object', () {
      final now = DateTime.now();
      final Map<String, dynamic> json = {
        'id': 'test_post_id',
        'title': 'Test Post',
        'description': 'This is a test post.',
        'imageUrls': [
          'http://example.com/img1.jpg',
          'http://example.com/img2.jpg',
        ],
        'userId': 'test_user_id',
        'cafeId': 'test_cafe_id',
        'createdAt': now.toIso8601String(),
        'likes': ['user1', 'user2'],
      };

      final post = Post.fromJson(json);

      expect(post.id, 'test_post_id');
      expect(post.title, 'Test Post');
      expect(post.description, 'This is a test post.');
      expect(post.imageUrls, [
        'http://example.com/img1.jpg',
        'http://example.com/img2.jpg',
      ]);
      expect(post.userId, 'test_user_id');
      expect(post.cafeId, 'test_cafe_id');
      expect(post.createdAt.toIso8601String(), now.toIso8601String());
      expect(post.likes, ['user1', 'user2']);
    });

    test('toJson converts a Post object to a valid JSON map', () {
      final now = DateTime.now();
      final post = Post(
        id: 'test_post_id',
        title: 'Test Post',
        description: 'This is a test post.',
        imageUrls: [
          'http://example.com/img1.jpg',
          'http://example.com/img2.jpg',
        ],
        userId: 'test_user_id',
        cafeId: 'test_cafe_id',
        createdAt: now,
        likes: ['user1', 'user2'],
      );

      final json = post.toJson();

      expect(json['id'], 'test_post_id');
      expect(json['title'], 'Test Post');
      expect(json['description'], 'This is a test post.');
      expect(json['imageUrls'], [
        'http://example.com/img1.jpg',
        'http://example.com/img2.jpg',
      ]);
      expect(json['userId'], 'test_user_id');
      expect(json['cafeId'], 'test_cafe_id');
      expect(json['createdAt'], now.toIso8601String());
      expect(json['likes'], ['user1', 'user2']);
    });
  });
}
