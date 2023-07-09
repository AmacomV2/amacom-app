/// UserRegistration DTO, saves registration data into an object and cast it
/// into a Map object for repository operations
class UserRegisterDTO {
  /// Class constructor
  UserRegisterDTO({
    this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    this.phone,
    this.termsAndConditions = true,
  });

  /// User UUID
  String? id;

  /// User firstName
  final String firstName;

  /// User lastName
  final String lastName;

  /// User e-mail
  final String email;

  /// User password
  final String password;

  /// User phone
  final String? phone;

  /// Bool to know if user accepts terms and conditions of app
  final bool termsAndConditions;

  /// Parse a [UserRegisterDTO] object into a Map
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email.toLowerCase(),
        'password': password,
        'first_name': firstName,
        'last_name': lastName,
        'phone': phone,
        'terms_and_conditions': termsAndConditions,
      };
}
