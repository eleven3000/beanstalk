import 'package:json_annotation/json_annotation.dart';

part 'cafe.g.dart';

@JsonSerializable()
class Cafe {
  final String id;
  final String name;
  final double latitude;
  final double longitude;
  final String createdBy;

  Cafe({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.createdBy,
  });

  factory Cafe.fromJson(Map<String, dynamic> json) => _$CafeFromJson(json);

  Map<String, dynamic> toJson() => _$CafeToJson(this);
}
