import 'package:amacom_app/src/domain/entities/entities.dart';

/// Feelings repository interface
abstract class IFeelingsRepository {
  /// Perform Feelings search and fetch
  Future<Pageable<List<GenericData>>?> getFeelings({
    int page = 0,
    required String query,
  });
}
