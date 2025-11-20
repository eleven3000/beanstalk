import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  final String id;
  final String text;
  final String userId;
  final String postId;
  final DateTime createdAt;

  Comment({
    required this.id,
    required this.text,
    required this.userId,
    required this.postId,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
