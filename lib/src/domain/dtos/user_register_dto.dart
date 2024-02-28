/// UserRegistration DTO, saves registration data into an object and cast it
/// into a Map object for repository operations
class UserRegisterDTO {
  /// Class constructor
  UserRegisterDTO({
    this.id,
    required this.email,
    required this.name,
    required this.lastName,
    required this.username,
    required this.password,
    this.occupation,
    this.privacyPolicy = true,
    required this.document,
    required this.birthDate,
    this.civilStatusId,
    required this.genderId,
    required this.documentTypeId,
    this.address,
  });

  /// User UUID
  String? id;

  /// User name
  final String name;

  /// User name
  final String username;

  /// User lastName
  final String lastName;

  /// User e-mail
  final String email;

  /// User password
  final String password;

  /// User password
  final String document;

  /// User password
  final DateTime? birthDate;

  /// User occupation
  final String? occupation;

  /// User occupation
  final String? civilStatusId;

  /// User occupation
  final String genderId;

  /// User occupation
  final String documentTypeId;

  /// User occupation
  final String? address;

  /// Bool to know if user accepts terms and conditions of app
  final bool privacyPolicy;

  /// Parse a [UserRegisterDTO] object into a Map
  Map<String, dynamic> toJson() => {
        'email': email.toLowerCase(),
        'password': password,
        'name': name,
        'username': username,
        'lastName': lastName,
        'occupation': occupation,
        'documentNo': document,
        'documentTypeId': documentTypeId,
        'civilStatusId': civilStatusId,
        'genderId': genderId,
        'evaluationCompleted': false,
        'birthDate': birthDate?.toIso8601String(),
        'address': occupation,
        'privacyPolicy': privacyPolicy,
        'consentText': privacyPolicy,
      };
}
