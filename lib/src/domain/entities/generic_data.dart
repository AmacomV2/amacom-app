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
  factory GenericData.fromJson(Map<String, dynamic> json) => GenericData(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: json['updatedAt'],
      );

  /// UUID for entity
  String id;

  /// Entity name
  String name;

  /// Entity optional description
  String? description;

  /// Entity creationDate
  DateTime createdAt;

  /// Entity updatedDate
  dynamic updatedAt;
}
