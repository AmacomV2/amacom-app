import 'package:amacom_app/src/domain/entities/entities.dart';

/// Achievements repository interface
abstract class IAchievementsRepository {
  /// Perform person achievements Achievements search and fetch
  Future<Pageable<List<PersonAchievement>>?> getPersonAchievementsData({
    int page = 0,
    required String query,
    String? subjectId,
  });

  /// Perform all Achievements search and fetch
  Future<Pageable<List<PersonAchievement>>?> getAchievementsData({
    int page = 0,
    required String query,
    String? subjectId,
    required String personId,
  });
}
