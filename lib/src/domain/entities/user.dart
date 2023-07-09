/// User entity
/// 
/// Manage user data
class User {
  ///
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.role,
    required this.avatar,
  });
  /// From json constructor
  factory User.fromJson(dynamic json) => User(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: Email.fromJson(json['email']),
        phone: json['phone'],
        avatar: json['avatar'] ?? '',
        role: Role.fromJson(json['role']),
      );
  ///
  final String id;

  ///
  final String firstName;

  ///
  final String lastName;

  ///
  final Email email;

  ///
  final String? phone;

  ///
  final String avatar;

  ///
  final Role role;

  /// Return user both names
  String get names => '$firstName $lastName';
}

/// Email entity
/// 
/// Class to manage emails data
class Email {
  ///
  Email({
    required this.id,
    required this.email,
    required this.status,
    required this.verified,
    required this.userId,
  });

  /// From json class constructor
  factory Email.fromJson(Map<String, dynamic> json) => Email(
        id: json['id'],
        email: json['email'],
        status: json['status'],
        verified: json['verified'],
        userId: json['userId'],
      );
  ///
  final String id;
  
  ///
  final String email;

  ///
  final String status;

  ///
  final bool verified;
  
  ///
  final String userId;
}

/// User role data
class Role {
  ///
  Role({
    required this.id,
    required this.name,
    this.description,
  });
  /// From json class constructor
  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json['id'],
        name: json['name'],
        description: json['description'],
      );

  
  ///
  final String id;
  
  ///
  final String name;
  
  ///
  final String? description;
}
