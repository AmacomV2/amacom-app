import 'package:amacom_app/src/utils/utils/utils.dart';

/// Class used to manage generic data
class GenericData {
  ///
  GenericData({
    required this.id,
    required this.name,
    this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  /// From raw json constructor
  factory GenericData.fromJson(Map json) => GenericData(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        createdAt: DateTime.tryParse(json['createdAt'] ?? ''),
        updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      );

  /// UUID for entity
  String id;

  /// Entity name
  String name;

  /// Entity optional description
  String? description;

  /// Entity creationDate
  DateTime? createdAt;

  /// Entity updatedDate
  DateTime? updatedAt;

  /// Parse a list of entities from a Json List<Map>
  static List<GenericData> fromJsonList(dynamic data) {
    final List<GenericData> result = [];

    try {
      for (var element in (data as List)) {
        try {
          result.add(GenericData.fromJson(element as Map));
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
