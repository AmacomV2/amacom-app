import 'package:amacom_app/src/data/dataSources/api_data_source.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/domain/repositories/password_recovering_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Code Validations Repo
///
/// Perform all verification code operations via email or sms
class PasswordRecoveringRepository implements IPasswordRecoveringRepository {
  /// Repository constructor
  PasswordRecoveringRepository({required this.api});

  /// APiDataSource object
  final ApiDataSource api;

  @override
  Future<BaseResponse?> sendCode(String email) async {
    final requestData = RequestData(
      path: '/auth/sendCode',
      method: Method.post,
      body: {'email': email},
    );
    final result = await ApiDataSource().request(
      requestData: requestData,
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
    return data;
  }

  @override
  Future<BaseResponse?> setNewPassword({
    required String email,
    required String password,
    required String code,
  }) async {
    final requestData = RequestData(
      path: '/auth/setPassword',
      method: Method.post,
      body: {
        'email': email,
        'code': code,
        'password': password,
      },
    );
    final result = await ApiDataSource().request(
      requestData: requestData,
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
    return data;
  }

  @override
  Future<BaseResponse?> verifyCode({
    required String email,
    required String code,
  }) async {
    final requestData = RequestData(
      path: '/auth/verifyCode',
      method: Method.post,
      body: {
        'email': email,
        'code': code,
      },
    );
    final result = await ApiDataSource().request(
      requestData: requestData,
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
    return data;
  }
}

/// Code validation repo instance
final passwordRecoveringRepoProvider =
    Provider.autoDispose<IPasswordRecoveringRepository>(
  (ref) => PasswordRecoveringRepository(api: ref.read(apiProvider)),
);
