import 'package:flutter_test/flutter_test.dart';
import 'package:beanstalk/src/data/models/cafe.dart';

void main() {
  group('Cafe', () {
    test('fromJson creates a valid Cafe object', () {
      final Map<String, dynamic> json = {
        'id': 'test_cafe_id',
        'name': 'Test Cafe',
        'latitude': 10.0,
        'longitude': 20.0,
        'createdBy': 'test_user_id',
      };

      final cafe = Cafe.fromJson(json);

      expect(cafe.id, 'test_cafe_id');
      expect(cafe.name, 'Test Cafe');
      expect(cafe.latitude, 10.0);
      expect(cafe.longitude, 20.0);
      expect(cafe.createdBy, 'test_user_id');
    });

    test('toJson converts a Cafe object to a valid JSON map', () {
      final cafe = Cafe(
        id: 'test_cafe_id',
        name: 'Test Cafe',
        latitude: 10.0,
        longitude: 20.0,
        createdBy: 'test_user_id',
      );

      final json = cafe.toJson();

      expect(json['id'], 'test_cafe_id');
      expect(json['name'], 'Test Cafe');
      expect(json['latitude'], 10.0);
      expect(json['longitude'], 20.0);
      expect(json['createdBy'], 'test_user_id');
    });
  });
}
