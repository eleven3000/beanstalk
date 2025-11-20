import '../models/tag.dart';

class TagRemoteDataSource {
  final List<Tag> _allTags = [
    Tag(id: 'tag1', text: 'great coffee'),
    Tag(id: 'tag2', text: 'cozy atmosphere'),
    Tag(id: 'tag3', text: 'dog friendly'),
    Tag(id: 'tag4', text: 'vegan options'),
  ];

  final List<PostTag> _postTags = [
    PostTag(postId: 'post1', tagId: 'tag1'),
    PostTag(postId: 'post1', tagId: 'tag2'),
    PostTag(postId: 'post2', tagId: 'tag1'),
    PostTag(postId: 'post2', tagId: 'tag3'),
  ];

  Future<List<Tag>> getAllTags() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _allTags;
  }

  Future<Tag?> getTagById(String id) async {
    await Future.delayed(const Duration(milliseconds: 400));
    for (var tag in _allTags) {
      if (tag.id == id) {
        return tag;
      }
    }
    return null;
  }

  Future<void> createTag(Tag tag) async {
    await Future.delayed(const Duration(milliseconds: 400));
    _allTags.add(tag);
    print('Mock API: Tag ${tag.text} created.');
  }

  Future<void> updateTag(Tag tag) async {
    await Future.delayed(const Duration(milliseconds: 400));
    final index = _allTags.indexWhere((t) => t.id == tag.id);
    if (index != -1) {
      _allTags[index] = tag;
      print('Mock API: Tag ${tag.id} updated.');
    }
  }

  Future<void> deleteTag(String id) async {
    await Future.delayed(const Duration(milliseconds: 400));
    _allTags.removeWhere((tag) => tag.id == id);
    print('Mock API: Tag $id deleted.');
  }

  Future<List<Tag>> getTagsForPost(String postId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final tagIds = _postTags
        .where((pt) => pt.postId == postId)
        .map((pt) => pt.tagId);
    return _allTags.where((tag) => tagIds.contains(tag.id)).toList();
  }

  Future<void> addTagToPost(String postId, String tagId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (!_postTags.any((pt) => pt.postId == postId && pt.tagId == tagId)) {
      _postTags.add(PostTag(postId: postId, tagId: tagId));
      print('Mock API: Tag $tagId added to post $postId.');
    }
  }

  Future<void> removeTagFromPost(String postId, String tagId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _postTags.removeWhere((pt) => pt.postId == postId && pt.tagId == tagId);
    print('Mock API: Tag $tagId removed from post $postId.');
  }
}
