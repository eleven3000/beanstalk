import 'package:flutter_test/flutter_test.dart';
import 'package:beanstalk/src/data/models/tag.dart';

void main() {
  group('Tag', () {
    test('fromJson creates a valid Tag object', () {
      final Map<String, dynamic> json = {
        'id': 'test_tag_id',
        'text': 'great coffee',
      };

      final tag = Tag.fromJson(json);

      expect(tag.id, 'test_tag_id');
      expect(tag.text, 'great coffee');
    });

    test('toJson converts a Tag object to a valid JSON map', () {
      final tag = Tag(id: 'test_tag_id', text: 'great coffee');

      final json = tag.toJson();

      expect(json['id'], 'test_tag_id');
      expect(json['text'], 'great coffee');
    });
  });

  group('PostTag', () {
    test('fromJson creates a valid PostTag object', () {
      final Map<String, dynamic> json = {
        'postId': 'test_post_id',
        'tagId': 'test_tag_id',
      };

      final postTag = PostTag.fromJson(json);

      expect(postTag.postId, 'test_post_id');
      expect(postTag.tagId, 'test_tag_id');
    });

    test('toJson converts a PostTag object to a valid JSON map', () {
      final postTag = PostTag(postId: 'test_post_id', tagId: 'test_tag_id');

      final json = postTag.toJson();

      expect(json['postId'], 'test_post_id');
      expect(json['tagId'], 'test_tag_id');
    });
  });
}
