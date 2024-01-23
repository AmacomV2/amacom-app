import 'package:amacom_app/src/domain/entities/entities.dart';

/// Resources repository interface
abstract class IResourcesRepository {
  /// Perform Resources search and fetch
  Future<Pageable<List<GenericData>>?> getResourcesData({
    int page = 0,
    required String query,
    String? subjectId,
  });

  /// Perform Resources search and fetch
  Future<Pageable<List<SupportMaterialFile>>?> getFiles({
    int page = 0,
    required String query,
    String? supportMaterialId,
  });
}
