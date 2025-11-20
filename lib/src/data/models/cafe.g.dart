// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cafe _$CafeFromJson(Map<String, dynamic> json) => Cafe(
  id: json['id'] as String,
  name: json['name'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  createdBy: json['createdBy'] as String,
);

Map<String, dynamic> _$CafeToJson(Cafe instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'createdBy': instance.createdBy,
};
