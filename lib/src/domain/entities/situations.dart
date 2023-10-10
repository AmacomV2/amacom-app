import 'dart:convert';

import 'package:amacom_app/src/utils/utils/global_locator.dart';

/// Class to manage situations data
class SituationEntity {
  /// Parse an entity instance from a Json Map
  factory SituationEntity.fromJson(Map json) => SituationEntity(
        id: json['id'],
        personId: json['person_id'],
        createdBy: json['created_by'],
        subjectId: json['subject_id'],
        description: json['description'],
        firstThought: json['first_thought'],
        behavior: json['behavior'],
        affectationDegree: json['affectation_degree'],
        createTime: DateTime.parse(json['create_time']),
        updateTime: DateTime.parse(json['update_time']),
        nursingAssessment: json['nursing_assessment'],
      );

  ///
  SituationEntity({
    required this.id,
    required this.personId,
    required this.createdBy,
    required this.subjectId,
    required this.description,
    required this.firstThought,
    required this.behavior,
    required this.affectationDegree,
    required this.createTime,
    required this.updateTime,
    required this.nursingAssessment,
  });

  ///
  factory SituationEntity.fromRawJson(String str) =>
      SituationEntity.fromJson(json.decode(str));

  /// Parse a list of entities from a Json List<Map>
  static List<SituationEntity> fromJsonList(List data) {
    final List<SituationEntity> result = [];
    for (var element in data) {
      try {
        result.add(SituationEntity.fromJson(element as Map));
      } catch (e) {
        GlobalLocator.appLogger.e(e);
      }
    }
    return result;
  }

  ///
  String id;

  ///
  String personId;

  ///
  String createdBy;

  ///
  String subjectId;

  ///
  String description;

  ///
  String firstThought;

  ///
  String behavior;

  ///
  int affectationDegree;

  ///
  DateTime createTime;

  ///
  DateTime updateTime;

  ///
  String nursingAssessment;
}
