import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/utils/extensions/extensions.dart';

/// Situation DTO
class NewSituationDTO {
  /// Class constructor
  NewSituationDTO({
    required this.firstThought,
    required this.description,
    required this.behavior,
    required this.affectationDegree,
    required this.subject,
    required this.feelings,
    required this.babyAlarmSigns,
    required this.motherAlarmSigns,
  });

  /// Situation firstThought
  final String firstThought;

  /// Situation description
  final String description;

  /// Situation behavior
  final String behavior;

  /// Situation affectationDegree
  final int affectationDegree;

  ///
  final SubjectEntity subject;

  ///
  final List<String> feelings;

  ///
  final List<String> babyAlarmSigns;

  ///
  final List<String> motherAlarmSigns;

  /// Parse a   NewSituationDTO] object into a Map
  Map<String, dynamic> toJson() => {
        'firstThought': firstThought.capitalize(),
        'description': description,
        'behavior': behavior,
        'affectationDegree': affectationDegree,
        'subjectId': subject.id,
        'feelings': feelings,
        'babyAlarmSigns': babyAlarmSigns,
        'motherAlarmSigns': motherAlarmSigns,
      };
}
