///Diagnosis entity
class Diagnosis {
  ///
  Diagnosis({
    required this.id,
    required this.personSituationId,
    this.consultationResult,
    required this.consultationAlert,
    required this.consultationStatus,
  });

  /// from Map (json) constructor
  factory Diagnosis.fromJson(dynamic json) => Diagnosis(
        id: json['id'],
        personSituationId: json['personSituationId'],
        consultationAlert: json['consultationAlert'],
        consultationStatus: json['consultationStatus'],
        consultationResult: json['consultationResult'],
      );

  /// from Map (json) constructor
  static Diagnosis? tryFromJson(dynamic json) {
    try {
      return Diagnosis(
        id: json['id'],
        personSituationId: json['personSituationId'] ?? '',
        consultationAlert: json['consultationAlert'],
        consultationStatus: json['consultationStatus'],
        consultationResult: json['consultationResult'] ?? '',
      );
    } catch (_) {
      return null;
    }
  }

  ///
  String id;

  ///
  String personSituationId;

  ///
  String? consultationResult;

  ///
  String consultationAlert;

  ///
  String consultationStatus;
}
