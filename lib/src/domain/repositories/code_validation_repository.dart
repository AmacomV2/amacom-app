import 'package:amacom_app/src/domain/entities/baseResponse/base_response.dart';

/// Code validations repository interface
abstract class ICodeValidationRepository {
  /// Validate user registration email
  Future<BaseResponse?> verifyEmail({
    required String code,
  });
  /// Generate and send a new email verification code to user email
  Future<BaseResponse?> reSendEmailVerificationCode();
  /// Perform user phone validation
  Future<BaseResponse?> verifyPhone({
    required String code,
  });

  /// Perform user recover password validation code
  Future<BaseResponse> recoverPassword({
    required String code,
  });
}
