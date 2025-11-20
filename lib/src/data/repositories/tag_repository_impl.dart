import '../../domain/repositories/tag_repository.dart';
import '../datasources/tag_remote_datasource.dart';
import '../models/tag.dart';

class TagRepositoryImpl implements TagRepository {
  final TagRemoteDataSource remoteDataSource;

  TagRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Tag>> getAllTags() async {
    return await remoteDataSource.getAllTags();
  }

  @override
  Future<Tag?> getTagById(String id) async {
    return await remoteDataSource.getTagById(id);
  }

  @override
  Future<void> createTag(Tag tag) async {
    await remoteDataSource.createTag(tag);
  }

  @override
  Future<void> updateTag(Tag tag) async {
    await remoteDataSource.updateTag(tag);
  }

  @override
  Future<void> deleteTag(String id) async {
    await remoteDataSource.deleteTag(id);
  }

  @override
  Future<List<Tag>> getTagsForPost(String postId) async {
    return await remoteDataSource.getTagsForPost(postId);
  }

  @override
  Future<void> addTagToPost(String postId, String tagId) async {
    await remoteDataSource.addTagToPost(postId, tagId);
  }

  @override
  Future<void> removeTagFromPost(String postId, String tagId) async {
    await remoteDataSource.removeTagFromPost(postId, tagId);
  }
}
