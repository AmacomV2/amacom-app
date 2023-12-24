// Generated by https://quicktype.io

import 'package:amacom_app/src/utils/utils/global_locator.dart';

/// SubjectEntity entity
///
/// Used to manage SubjectEntities data
class SubjectEntity {
  ///
  SubjectEntity({
    required this.id,
    this.parentId,
    this.associatedResultId,
    required this.name,
    this.validityIndicator,
    required this.createdAt,
    required this.updatedAt,
  });

  /// from Map (json) constructor
  factory SubjectEntity.fromJson(dynamic json) => SubjectEntity(
        id: json['id'],
        name: json['name'],
        associatedResultId: json['associatedResultId'],
        validityIndicator: json['validityIndicator'],
        parentId: json['parentId'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
      );

  ///
  String id;

  ///
  String? parentId;

  ///
  String? associatedResultId;

  ///
  String name;

  ///
  String? validityIndicator;

  ///
  DateTime createdAt;

  ///
  DateTime updatedAt;

  /// Parse a list of entities from a Json List<Map>
  static List<SubjectEntity> fromJsonList(dynamic data) {
    final List<SubjectEntity> result = [];

    try {
      for (var element in (data as List)) {
        try {
          result.add(SubjectEntity.fromJson(element as Map));
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
