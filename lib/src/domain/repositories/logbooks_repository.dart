import 'package:amacom_app/src/domain/dtos/logbook_dto.dart';
import 'package:amacom_app/src/domain/entities/logbook.dart';
import 'package:amacom_app/src/domain/entities/pageable/pageable.dart';

/// Logbooks repository interface
abstract class ILogbooksRepository {
  /// Logbooks creation
  Future<Logbook> create(LogbookDTO logbookDTO);

  /// Perform logbook delete
  Future<bool> delete(String logbookId);

  /// Perform Logbooks edit
  Future<bool> edit({required String id, required LogbookDTO logbookDTO});

  /// Perform Logbooks search and fetch
  Future<Pageable<List<Logbook>>?> getLogbooksData({
    int page = 0,
    required String query,
  });
}
