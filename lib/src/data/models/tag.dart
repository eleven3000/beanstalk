import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

@JsonSerializable()
class Tag {
  final String id;
  final String text;

  Tag({required this.id, required this.text});

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@JsonSerializable()
class PostTag {
  final String postId;
  final String tagId;

  PostTag({required this.postId, required this.tagId});

  factory PostTag.fromJson(Map<String, dynamic> json) =>
      _$PostTagFromJson(json);

  Map<String, dynamic> toJson() => _$PostTagToJson(this);
}
