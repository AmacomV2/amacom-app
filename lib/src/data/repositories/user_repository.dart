import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:amacom_app/src/data/dataSources/api_data_source.dart';
import 'package:amacom_app/src/domain/dtos/user_login_dto.dart';
import 'package:amacom_app/src/domain/dtos/user_register_dto.dart';
import 'package:amacom_app/src/domain/entities/baseResponse/base_response.dart';
import 'package:amacom_app/src/domain/entities/request_data.dart';
import 'package:amacom_app/src/domain/entities/session.dart';
import 'package:amacom_app/src/domain/entities/user.dart';
import 'package:amacom_app/src/domain/repositories/user_repository.dart';
import 'package:uuid/uuid.dart';

/// Implementation for UserRepository using APIDataSource
class UserRepository implements IUserRepository {
  /// Repository constructor
  UserRepository({required this.api});

  /// APiDataSource object
  final ApiDataSource api;

  @override
  Future<Session> userLogin(UserLoginDTO login) async {
    // final requestData = RequestData(
    //   path: '/auth/login',
    //   method: Method.post,
    //   body: login.toJson(),
    // );
    // final result = await api.request(
    //   requestData: requestData,
    //   fromJsonT: Session.fromJson,
    //   withAuthToken: false,
    // ).timeout(AppDurations.timeout);
    final result = await Future.value({
      'data': {
        'accessToken' : '',
        'refreshToken' : '',
      },
      'error': false
    });
    BaseResponse data;
    try {
      data = BaseResponse.fromJson(result, Session.fromJson);
    } catch (e) {
      data = BaseResponse.fromJson(result, (_) {});
    }
    if (data.error) {
      throw Exception(data.message);
    } else {
      setSessionData(data.data);
      return data.data;
    }
  }

  @override
  Future<void> logout() async {
    ///TODO: Perform logout on server side
    // final requestData = RequestData(
    //   path: 'auth/logout',
    //   method: Method.get,
    // );
    // final result = await api.request(
    //   requestData: requestData,
    //   fromJsonT: Session.fromJson,
    //   withAuthToken: true,
    // );
    // BaseResponse data;
    //   data = BaseResponse.fromJson(result, (_) {});
    await setSessionData(Session(accessToken: '', refreshToken: ''));
  }

  @override
  Future<Session?> userRegister(UserRegisterDTO userData) async {
    var uuid = const Uuid();
    userData.id = uuid.v4();
    final requestData = RequestData(
      path: '/auth/registration',
      method: Method.post,
      body: userData.toJson(),
    );
    final result = await api.request(
      requestData: requestData,
      fromJsonT: Session.fromJson,
      withAuthToken: false,
    );
    BaseResponse data;
    try {
      data = BaseResponse.fromJson(result, Session.fromJson);
    } catch (e) {
      data = BaseResponse.fromJson(result, (_) {});
    }
    if (data.error) {
      throw Exception(data.message);
    } else {
      setSessionData(data.data);
      return data.data;
    }
  }

  @override
  Future<void> setSessionData(Session? session) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'access_token', value: session?.accessToken);
    await storage.write(key: 'refresh_token', value: session?.refreshToken);
  }

  @override
  Future<User> getUserData() async {
    // final requestData = RequestData(
    //   path: '/auth/getUser',
    //   method: Method.get,
    // );
    // final result = await api.request(
    //   requestData: requestData,
    //   fromJsonT: User.fromJson,
    //   withAuthToken: true,
    // );
    final result = {
      'error' : false,
      'data': {
        'id': '',
        'firstName': 'Name',
        'lastName': 'LastName',
        'email': 'email@mail.com',
        'phone': '',
        'avatar': 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2F736x%2F74%2F74%2Fce%2F7474ce023daef33ad954a6aed569177a.jpg%3Fb%3Dt&f=1&nofb=1&ipt=6d0ca7b046193db1ca9534799e4187ce14e545de5ec1de9590c0fdd290847f47&ipo=images',
        'role': {
          'id': 'asd',
        'name': 'final_user',
        'description': 'ff',
        },
      }
    };
    BaseResponse data;
    try {
      data = BaseResponse.fromJson(result, User.fromJson);
    } catch (e) {
      data = BaseResponse.fromJson(result, (_) {});
    }
    if (data.error) {
      throw Exception(data.message);
    } else {
      return data.data;
    }
  }
}

/// User repository riverpod instance
final userRepository = Provider.autoDispose<IUserRepository>(
  (ref) => UserRepository(api: ref.read(apiProvider)),
);
