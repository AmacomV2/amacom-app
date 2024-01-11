/// Logbook DTO
class LogbookDTO {
  /// Class constructor
  LogbookDTO({
    required this.name,
    required this.description,
  });

  /// Logbook name
  final String name;

  /// Logbook description
  final String description;

  /// Parse a [LogbookDTO] object into a Map
  Map<String, dynamic> toJson() => {
        'name': name.toLowerCase(),
        'description': description,
      };
}
