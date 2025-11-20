// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) =>
    Tag(id: json['id'] as String, text: json['text'] as String);

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
  'id': instance.id,
  'text': instance.text,
};

PostTag _$PostTagFromJson(Map<String, dynamic> json) =>
    PostTag(postId: json['postId'] as String, tagId: json['tagId'] as String);

Map<String, dynamic> _$PostTagToJson(PostTag instance) => <String, dynamic>{
  'postId': instance.postId,
  'tagId': instance.tagId,
};
