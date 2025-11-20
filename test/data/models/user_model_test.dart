import 'package:flutter_test/flutter_test.dart';
import 'package:beanstalk/src/data/models/user.dart';

void main() {
  group('User', () {
    test('fromJson creates a valid User object', () {
      final Map<String, dynamic> json = {
        'id': 'test_user_id',
        'username': 'test_username',
        'profileImageUrl': 'http://example.com/profile.jpg',
        'bio': 'Test bio',
        'followers': ['follower1', 'follower2'],
        'following': ['following1'],
      };

      final user = User.fromJson(json);

      expect(user.id, 'test_user_id');
      expect(user.username, 'test_username');
      expect(user.profileImageUrl, 'http://example.com/profile.jpg');
      expect(user.bio, 'Test bio');
      expect(user.followers, ['follower1', 'follower2']);
      expect(user.following, ['following1']);
    });

    test('toJson converts a User object to a valid JSON map', () {
      final user = User(
        id: 'test_user_id',
        username: 'test_username',
        profileImageUrl: 'http://example.com/profile.jpg',
        bio: 'Test bio',
        followers: ['follower1', 'follower2'],
        following: ['following1'],
      );

      final json = user.toJson();

      expect(json['id'], 'test_user_id');
      expect(json['username'], 'test_username');
      expect(json['profileImageUrl'], 'http://example.com/profile.jpg');
      expect(json['bio'], 'Test bio');
      expect(json['followers'], ['follower1', 'follower2']);
      expect(json['following'], ['following1']);
    });

    test('fromJson handles null values for optional fields', () {
      final Map<String, dynamic> json = {
        'id': 'test_user_id',
        'username': 'test_username',
        'followers': [],
        'following': [],
      };

      final user = User.fromJson(json);

      expect(user.id, 'test_user_id');
      expect(user.username, 'test_username');
      expect(user.profileImageUrl, isNull);
      expect(user.bio, isNull);
      expect(user.followers, isEmpty);
      expect(user.following, isEmpty);
    });
  });
}
