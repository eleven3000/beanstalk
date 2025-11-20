import '../models/cafe.dart';

class CafeRemoteDataSource {
  Future<Cafe?> getCafeById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (id == 'cafe1') {
      return Cafe(
        id: 'cafe1',
        name: 'Cafe Aroma',
        latitude: 34.0522,
        longitude: -118.2437,
        createdBy: 'user1',
      );
    } else if (id == 'cafe2') {
      return Cafe(
        id: 'cafe2',
        name: 'Hidden Gem Coffee',
        latitude: 34.0722,
        longitude: -118.4437,
        createdBy: 'user4',
      );
    }
    return null;
  }

  Future<List<Cafe>> searchCafes(String query) async {
    await Future.delayed(const Duration(milliseconds: 700));
    final allCafes = [
      Cafe(
        id: 'cafe1',
        name: 'Cafe Aroma',
        latitude: 34.0522,
        longitude: -118.2437,
        createdBy: 'user1',
      ),
      Cafe(
        id: 'cafe2',
        name: 'Hidden Gem Coffee',
        latitude: 34.0722,
        longitude: -118.4437,
        createdBy: 'user4',
      ),
      Cafe(
        id: 'cafe3',
        name: 'The Daily Grind',
        latitude: 34.0622,
        longitude: -118.3437,
        createdBy: 'user1',
      ),
    ];
    return allCafes
        .where((cafe) => cafe.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<void> createCafe(Cafe cafe) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Mock API: Cafe ${cafe.name} created.');
  }

  Future<void> updateCafe(Cafe cafe) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Mock API: Cafe ${cafe.name} updated.');
  }

  Future<void> deleteCafe(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    print('Mock API: Cafe $id deleted.');
  }

  Future<List<Cafe>> getCafesNearLocation(
    double latitude,
    double longitude,
    double radiusKm,
  ) async {
    await Future.delayed(const Duration(milliseconds: 700));
    // For simplicity, just return some mock cafes regardless of location for now
    return [
      Cafe(
        id: 'cafe1',
        name: 'Cafe Aroma',
        latitude: 34.0522,
        longitude: -118.2437,
        createdBy: 'user1',
      ),
      Cafe(
        id: 'cafe2',
        name: 'Hidden Gem Coffee',
        latitude: 34.0722,
        longitude: -118.4437,
        createdBy: 'user4',
      ),
    ];
  }
}
