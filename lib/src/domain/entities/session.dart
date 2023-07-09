// To parse this JSON data, do
//
//     final session = sessionFromJson(jsonString);


/// Session data entity
class Session {
  /// from Map (json) constructor
  factory Session.fromJson(dynamic json) => Session(
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken'],
      );
  /// CLass constructor
  Session({
    required this.accessToken,
    required this.refreshToken,
  });
  /// Session refresh token
  String refreshToken;
  /// Session access token
  String accessToken;
}
