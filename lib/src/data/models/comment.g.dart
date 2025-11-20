// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
  id: json['id'] as String,
  text: json['text'] as String,
  userId: json['userId'] as String,
  postId: json['postId'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
  'id': instance.id,
  'text': instance.text,
  'userId': instance.userId,
  'postId': instance.postId,
  'createdAt': instance.createdAt.toIso8601String(),
};
