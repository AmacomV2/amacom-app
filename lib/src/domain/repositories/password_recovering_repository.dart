import 'package:amacom_app/src/domain/entities/baseResponse/base_response.dart';

/// User repository interface
abstract class IPasswordRecoveringRepository {
  /// User password recovering
  /// Send a new recovery code to user email
  Future<BaseResponse?> sendCode(String email);

  /// User password recovering
  /// Verify code sent to user email
  Future<BaseResponse?> verifyCode(
      {required String email, required String code,});

  /// User password recovering
  /// Set a new password for user who have a verified and not expired
  /// recovery code
  Future<BaseResponse?> setNewPassword({required String email, required String password});
}
