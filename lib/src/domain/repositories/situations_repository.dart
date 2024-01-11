import 'package:amacom_app/src/domain/dtos/new_situation_dto.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';

/// Situations repository interface
abstract class ISituationsRepository {
  /// Get current user situations from database
  Future<Pageable<List<SituationEntity>>?> getUserSituations({
    int page = 0,
    required String query,
    String? status,
    String? alert,
  });

  /// Get current user situations from database
  Future<SituationEntity> create({
    required NewSituationDTO situation,
  });
}
