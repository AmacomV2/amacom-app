import 'package:amacom_app/src/domain/dtos/person_dto.dart';
import 'package:amacom_app/src/domain/dtos/user_login_dto.dart';
import 'package:amacom_app/src/domain/dtos/user_register_dto.dart';
import 'package:amacom_app/src/domain/entities/person.dart';
import 'package:amacom_app/src/domain/entities/session.dart';

/// User repository interface
abstract class IUserRepository {
  /// User login, perform login operation. Saves auth tokens and returns
  /// User instance
  Future<Session?> userLogin(UserLoginDTO login);

  /// Perform user registration, return a user object ID
  Future<Session?> userRegister(UserRegisterDTO userData);

  /// Perform user data update
  Future<bool?> updateUserData(PersonEditDTO personData);

  /// Perform user registration, return a user object ID
  Future<void> setSessionData(Session session);

  /// Perform user password change
  Future<bool> changePassword({
    required String oldPassword,
    required String newPassword,
  });

  /// Perform user registration, return a user object ID
  Future<Person> getUserData();

  /// Perform user logout on server?
  /// Delete session data stored locally
  Future<void> logout();
}
