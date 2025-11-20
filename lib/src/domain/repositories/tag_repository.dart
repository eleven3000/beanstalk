import '../../data/models/tag.dart';

abstract class TagRepository {
  Future<List<Tag>> getAllTags();
  Future<Tag?> getTagById(String id);
  Future<void> createTag(Tag tag);
  Future<void> updateTag(Tag tag);
  Future<void> deleteTag(String id);

  // PostTag operations
  Future<List<Tag>> getTagsForPost(String postId);
  Future<void> addTagToPost(String postId, String tagId);
  Future<void> removeTagFromPost(String postId, String tagId);
}
