/// UserEdit DTO, used to send only required data to server.
class PersonEditDTO {
  /// Class constructor
  PersonEditDTO({
    required this.id,
    this.consentText = false,
    required this.lastName,
    required this.name,
    this.occupation,
    required this.document,
    required this.birthDate,
    this.civilStatusId,
    this.imageUrl,
    required this.genderId,
    required this.documentTypeId,
    this.address,
  });

  /// User UUID
  String? id;

  /// User name
  String name;

  /// User lastName
  String lastName;

  /// User consentText
  bool consentText;

  /// User password
  String document;

  /// User password
  DateTime? birthDate;

  /// User occupation
  String? occupation;

  /// User occupation
  String? civilStatusId;

  /// User image
  String? imageUrl;

  /// User occupation
  String genderId;

  /// User occupation
  String documentTypeId;

  /// User occupation
  String? address;

  /// Parse a [PersonEditDTO] object into a Map
  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'lastName': lastName,
        'occupation': occupation,
        'documentNo': document,
        'documentTypeId': documentTypeId,
        'civilStatusId': civilStatusId,
        'imageUrl': imageUrl,
        'genderId': genderId,
        'evaluationCompleted': false,
        'privacyPolicy': true,
        'consentText': consentText,
        'birthDate': birthDate?.toIso8601String(),
        'address': occupation,
      };
}
