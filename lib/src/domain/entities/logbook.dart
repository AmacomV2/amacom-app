import 'package:amacom_app/src/utils/utils/utils.dart';

/// Logbook entity
///
/// Class to manage logbook data
class Logbook {
  ///
  Logbook({
    required this.id,
    required this.personId,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  ///
  factory Logbook.fromJson(Map json) => Logbook(
        id: json['id'],
        personId: json['personId'],
        name: json['name'],
        description: json['description'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.tryParse(json['updatedAt'] ?? ''),
      );

  ///
  String id;

  ///
  String personId;

  ///
  String name;

  ///
  String description;

  ///
  DateTime createdAt;

  ///
  DateTime? updatedAt;

  ///
  Map<String, dynamic> toJson() => {
        'id': id,
        'personId': personId,
        'name': name,
        'description': description,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };

  /// Parse a list of entities from a Json List<Map>
  static List<Logbook> fromJsonList(dynamic data) {
    final List<Logbook> result = [];

    try {
      for (var element in (data as List)) {
        try {
          result.add(Logbook.fromJson(element as Map));
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
