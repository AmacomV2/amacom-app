/// UserLogin DTO
class UserLoginDTO {
  /// Class constructor
  UserLoginDTO({
    required this.email,
    required this.password,
  });

  /// User e-mail
  final String email;

  /// User password
  final String password;

  /// Parse a [UserLoginDTO] object into a Map
  Map<String, dynamic> toJson() => {
        'email': email.toLowerCase(),
        'password': password,
      };
}
