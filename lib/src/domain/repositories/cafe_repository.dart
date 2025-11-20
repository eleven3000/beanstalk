import '../../data/models/cafe.dart';

abstract class CafeRepository {
  Future<Cafe?> getCafeById(String id);
  Future<List<Cafe>> searchCafes(String query);
  Future<void> createCafe(Cafe cafe);
  Future<void> updateCafe(Cafe cafe);
  Future<void> deleteCafe(String id);
  Future<List<Cafe>> getCafesNearLocation(
    double latitude,
    double longitude,
    double radiusKm,
  );
}
