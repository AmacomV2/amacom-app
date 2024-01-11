import 'package:amacom_app/src/data/dataSources/api_data_source.dart';
import 'package:amacom_app/src/domain/entities/baseResponse/base_response.dart';
import 'package:amacom_app/src/domain/entities/request_data.dart';
import 'package:amacom_app/src/domain/entities/session.dart';
import 'package:amacom_app/src/domain/repositories/code_validation_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Code Validations Repo
///
/// Perform all verification code operations via email or sms
class CodeValidationRepository implements ICodeValidationRepository {
  /// Repository constructor
  CodeValidationRepository({required this.api});

  /// APiDataSource object
  final ApiDataSource api;
  @override
  Future<BaseResponse> recoverPassword({required String code}) {
    // TODO: implement recoverPassword
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse?> verifyEmail({required String code}) async {
    final requestData = RequestData(
      path: '/codes/verifyEmail',
      method: Method.post,
      body: {'code': code},
    );
    final result = await ApiDataSource().request(
      requestData: requestData,
      fromJsonT: Session.fromJson,
      withAuthToken: false,
    );
    BaseResponse data;
    try {
      data = BaseResponse.fromJson(
        result,
        (json) => json as bool,
      );
    } catch (e) {
      data = BaseResponse.fromJson(result, (_) {});
    }
    if (!data.ok) {
      throw Exception(data.message);
    } else {
      return data;
    }
  }

  @override
  Future<BaseResponse?> verifyPhone({required String code}) {
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse?> reSendEmailVerificationCode() async {
    final requestData = RequestData(
      path: '/codes/resendEmail',
      method: Method.get,
    );
    final result = await ApiDataSource().request(
      requestData: requestData,
      fromJsonT: Session.fromJson,
      withAuthToken: true,
    );
    BaseResponse data;
    try {
      data = BaseResponse.fromJson(
        result,
        (json) => json as bool,
      );
    } catch (e) {
      data = BaseResponse.fromJson(result, (_) {});
    }
    if (!data.ok) {
      throw Exception(data.message);
    } else {
      return data;
    }
  }
}

/// Code validation repo instance
final codeValidationRepo = Provider.autoDispose<ICodeValidationRepository>(
  (ref) => CodeValidationRepository(api: ref.read(apiProvider)),
);
