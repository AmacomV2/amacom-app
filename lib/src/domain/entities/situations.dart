import 'package:amacom_app/src/domain/entities/diagnosis.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

/// Class to manage situations data
class SituationEntity {
  ///
  SituationEntity({
    required this.id,
    required this.personId,
    required this.createdById,
    required this.subjectId,
    this.currentDiagnosis,
    required this.description,
    required this.firstThought,
    required this.behavior,
    required this.affectationDegree,
    this.nursingAssessment,
    required this.createdAt,
    this.updatedAt,
  });

  /// from Map (json) constructor
  factory SituationEntity.fromJson(dynamic json) => SituationEntity(
        id: json['id'],
        personId: json['personId'],
        createdById: json['createdById'],
        subjectId: json['subjectId'],
        description: json['description'],
        firstThought: json['firstThought'],
        behavior: json['behavior'],
        affectationDegree: json['affectationDegree'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
        currentDiagnosis: Diagnosis.tryFromJson(json['currentDiagnosis']),
      );

  ///
  String id;

  ///
  String personId;

  ///
  String createdById;

  ///
  String subjectId;

  ///
  Diagnosis? currentDiagnosis;

  ///
  String description;

  ///
  String firstThought;

  ///
  String behavior;

  ///
  int affectationDegree;

  ///
  dynamic nursingAssessment;

  ///
  DateTime createdAt;

  ///
  DateTime? updatedAt;

  /// Parse a list of entities from a Json List<Map>
  static List<SituationEntity> fromJsonList(dynamic data) {
    final List<SituationEntity> result = [];

    try {
      for (var element in (data as List)) {
        try {
          result.add(SituationEntity.fromJson(element as Map));
        } catch (e) {
          GlobalLocator.appLogger.e(e);
        }
      }
    } catch (e) {
      GlobalLocator.appLogger.e(e);
    }

    return result;
  }
}
