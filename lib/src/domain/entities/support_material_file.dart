import 'package:amacom_app/src/utils/utils/utils.dart';

/// Class used to manage support material files
class SupportMaterialFile {
  ///
  SupportMaterialFile({
    required this.id,
    required this.idSupportMaterial,
    required this.path,
    required this.createdAt,
    required this.name,
    this.description,
    required this.updatedAt,
  });

  /// From raw json constructor
  factory SupportMaterialFile.fromJson(Map json) => SupportMaterialFile(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        idSupportMaterial: json['idSupportMaterial'],
        path: json['path'],
        createdAt: DateTime.parse(json['createdAt'] ?? ''),
        updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      );

  /// From raw json constructor
  static SupportMaterialFile? tryFromJson(dynamic json) {
    try {
      return SupportMaterialFile(
        id: json?['id'],
        name: json?['name'],
        description: json?['description'],
        idSupportMaterial: json?['idSupportMaterial'],
        path: json?['path'],
        createdAt: DateTime.parse(json?['createdAt'] ?? ''),
        updatedAt: DateTime.tryParse(json?['updatedAt'] ?? ''),
      );
    } catch (e) {
      return null;
    }
  }

  /// UUID for entity
  String id;

  /// Entity idSupportMaterial
  String idSupportMaterial;

  /// Entity optional path
  String path;

  /// Name
  String name;

  /// Name
  String? description;

  /// Entity creationDate
  DateTime createdAt;

  /// Entity updatedDate
  DateTime? updatedAt;

  /// Parse a list of entities from a Json List<Map>
  static List<SupportMaterialFile> fromJsonList(dynamic data) {
    final List<SupportMaterialFile> result = [];

    try {
      for (var element in (data as List)) {
        try {
          result.add(SupportMaterialFile.fromJson(element as Map));
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
