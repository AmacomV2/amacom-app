import 'package:amacom_app/src/domain/entities/entities.dart';

/// Subjects repository interface
abstract class ISubjectsRepository {
  /// Perform Subjects search and fetch
  Future<Pageable<List<SubjectEntity>>?> getSubjectsData({
    int page = 0,
    required String query,
    String? parentId,
  });
}
