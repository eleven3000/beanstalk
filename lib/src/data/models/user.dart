import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String username;
  final String? profileImageUrl;
  final String? bio;
  final List<String> followers;
  final List<String> following;

  User({
    required this.id,
    required this.username,
    this.profileImageUrl,
    this.bio,
    required this.followers,
    required this.following,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
