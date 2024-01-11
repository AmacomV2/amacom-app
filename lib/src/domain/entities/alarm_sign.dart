import 'package:amacom_app/src/utils/utils/utils.dart';

/// AlarmSing data
class AlarmSignEntity {
  ///
  AlarmSignEntity({
    required this.id,
    required this.name,
    required this.description,
    this.imageUrl,
    this.status,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  /// from Map (json) constructor
  factory AlarmSignEntity.fromJson(dynamic json) => AlarmSignEntity(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        status: json['status'],
        type: json['type'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
      );

  ///
  String id;

  ///
  String name;

  ///
  String? description;

  ///
  String? imageUrl;

  ///
  String? status;

  ///
  String type;

  ///
  DateTime createdAt;

  ///
  DateTime updatedAt;

  /// Parse a list of entities from a Json List<Map>
  static List<AlarmSignEntity> fromJsonList(dynamic data) {
    final List<AlarmSignEntity> result = [];

    try {
      for (var element in (data as List)) {
        try {
          result.add(AlarmSignEntity.fromJson(element as Map));
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
