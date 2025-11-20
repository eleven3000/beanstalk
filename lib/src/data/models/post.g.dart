// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  imageUrls: (json['imageUrls'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  userId: json['userId'] as String,
  cafeId: json['cafeId'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  likes: (json['likes'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'imageUrls': instance.imageUrls,
  'userId': instance.userId,
  'cafeId': instance.cafeId,
  'createdAt': instance.createdAt.toIso8601String(),
  'likes': instance.likes,
};
