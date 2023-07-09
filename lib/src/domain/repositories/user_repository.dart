import 'package:amacom_app/src/domain/dtos/user_login_dto.dart';
import 'package:amacom_app/src/domain/dtos/user_register_dto.dart';
import 'package:amacom_app/src/domain/entities/session.dart';
import 'package:amacom_app/src/domain/entities/user.dart';

/// User repository interface
abstract class IUserRepository {
  /// User login, perform login operation. Saves auth tokens and returns
  /// User instance
  Future<Session?> userLogin(UserLoginDTO login);
  /// Perform user registration, return a user object ID
  Future<Session?> userRegister(UserRegisterDTO userData);

  /// Perform user registration, return a user object ID
  Future<void> setSessionData(Session session);

  /// Perform user registration, return a user object ID
  Future<User> getUserData();

  /// Perform user logout on server?
  /// Delete session data stored locally
  Future<void> logout();
}
