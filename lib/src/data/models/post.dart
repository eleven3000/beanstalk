import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  final String id;
  final String title;
  final String description;
  final List<String> imageUrls;
  final String userId;
  final String cafeId;
  final DateTime createdAt;
  final List<String> likes;

  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrls,
    required this.userId,
    required this.cafeId,
    required this.createdAt,
    required this.likes,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
