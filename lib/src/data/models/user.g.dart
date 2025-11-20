// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String,
  username: json['username'] as String,
  profileImageUrl: json['profileImageUrl'] as String?,
  bio: json['bio'] as String?,
  followers: (json['followers'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  following: (json['following'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'profileImageUrl': instance.profileImageUrl,
  'bio': instance.bio,
  'followers': instance.followers,
  'following': instance.following,
};
