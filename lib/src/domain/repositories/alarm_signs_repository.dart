import 'package:amacom_app/src/domain/entities/entities.dart';

/// AlarmSigns repository interface
abstract class IAlarmSignsRepository {
  /// Perform AlarmSignEntity search and fetch
  Future<Pageable<List<AlarmSignEntity>>?> getAlarmSignsData({
    int page = 0,
    required String query,
    required String type,
  });
}
