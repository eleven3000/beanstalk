import '../../domain/repositories/cafe_repository.dart';
import '../datasources/cafe_remote_datasource.dart';
import '../models/cafe.dart';

class CafeRepositoryImpl implements CafeRepository {
  final CafeRemoteDataSource remoteDataSource;

  CafeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Cafe?> getCafeById(String id) async {
    return await remoteDataSource.getCafeById(id);
  }

  @override
  Future<List<Cafe>> searchCafes(String query) async {
    return await remoteDataSource.searchCafes(query);
  }

  @override
  Future<void> createCafe(Cafe cafe) async {
    await remoteDataSource.createCafe(cafe);
  }

  @override
  Future<void> updateCafe(Cafe cafe) async {
    await remoteDataSource.updateCafe(cafe);
  }

  @override
  Future<void> deleteCafe(String id) async {
    await remoteDataSource.deleteCafe(id);
  }

  @override
  Future<List<Cafe>> getCafesNearLocation(
    double latitude,
    double longitude,
    double radiusKm,
  ) async {
    return await remoteDataSource.getCafesNearLocation(
      latitude,
      longitude,
      radiusKm,
    );
  }
}
