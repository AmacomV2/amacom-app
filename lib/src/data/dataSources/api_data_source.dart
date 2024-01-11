import 'dart:io';

import 'package:amacom_app/src/domain/entities/request_data.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

/// Class to perform API calls
class ApiDataSource {
  /// Api request constructor
  ApiDataSource() {
    _http.options.baseUrl =
        const String.fromEnvironment('HOST', defaultValue: '');
  }

  /// Headers
  static final Map<String, String> _headers = {};

  final _http = Dio();
  final _logger = GlobalLocator.appLogger;

  /// Method to check internet connection and set headers
  Future<void> _requestData(
    bool withAuthToken, {
    bool formData = false,
  }) async {
    if (formData) {
      _headers['Content-type'] = 'multipart/form-data';
    } else {
      _headers['Content-type'] = 'application/json';
    }
    _headers['Accept'] = '*/*';
    if (withAuthToken) {
      try {
        const storage = FlutterSecureStorage();
        final token = await storage.read(key: 'accessToken') ?? '';
        if (token.isNotEmpty) {
          _headers['Authorization'] = 'Bearer $token';
        }
      } catch (e) {
        log(e);
      }
    } else {
      _headers.remove('Authorization');
    }
    _headers['X-Platform'] = Platform.isIOS ? 'ios' : 'android';
    _headers['User-Agent'] = await userAgent();
    _http.options.headers = _headers;
    _http.interceptors.add(RetryOnConnectionChangeInterceptor(dio: _http));
  }

  Future<dynamic> _httpRequest(
    Future<dynamic> Function() request,
  ) async {
    return await request.call().timeout(
          const Duration(seconds: 30),
        );
  }

  static Map<String, dynamic> _resolveInternalError(dynamic e) {
    return {
      'ok': false,
      'message': '${AppMessages.internalError}$e',
      'error': true,
      'data': [],
    };
  }

  static Map<String, dynamic> _resolveServerErrorCode(DioException e) {
    return {
      'message': '${e.response?.data['message'] ?? e.message}',
      'ok': false,
      'data': {},
    };
  }

  /// Perform any http-https request with a given [RequestData]
  Future<Map<String, dynamic>> request({
    required RequestData requestData,
    bool withAuthToken = true,
    dynamic Function(Object?)? fromJsonT,
  }) async {
    if (await isNetworkAvailable()) {
      /// Show toast with no internet connection message
    } else {
      toast(AppMessages.noInternetConnection);
      return {
        'ok': false,
        'message': AppMessages.noInternetConnection,
        'data': [],
      };
    }
    await _requestData(withAuthToken);
    _logger.d('Request endpoint: ${requestData.body}');
    _headers.addAll(requestData.headers);
    dynamic data;
    try {
      switch (requestData.method) {
        case Method.get:
          data = await get(
            requestData.path,
            queryParameters: requestData.queryParameters,
          );
          break;
        case Method.post:
          data = await post(
            requestData.path,
            requestData.body,
            queryParameters: requestData.queryParameters,
          );
          break;
        case Method.put:
          data = await put(
            requestData.path,
            requestData.body,
            queryParameters: requestData.queryParameters,
          );
          break;
        case Method.delete:
          data = await delete(
            requestData.path,
            queryParameters: requestData.queryParameters,
          );
          break;
        default:
          return {
            'ok': false,
            'message': 'El método de comunicación http no fue encontrado.',
            'data': [],
          };
      }
    } on DioException catch (e) {
      data = _resolveServerErrorCode(e);
    } on Exception catch (e) {
      data = _resolveInternalError(e);
    }
    return data;
  }

  /// Perform API GET operations
  Future<dynamic> get(
    String endpoint, {
    bool withAuthToken = true,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _httpRequest(
      () async {
        try {
          _logger.d('get() to ($endpoint) - headers ($_headers)');

          final response = await _http.get(
            endpoint,
            queryParameters: queryParameters,
          );
          return response.data;
        } on DioException catch (e) {
          GlobalLocator.appLogger.e(e);
          rethrow;
        } on Exception catch (e) {
          return _resolveInternalError(e);
        }
      },
    );
  }

  /// Perform API POST operations
  Future<dynamic> post(
    String endpoint,
    Map<String, dynamic> data, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _httpRequest(
      () async {
        try {
          /// Used for test purposes
          _logger
              .d('post() to ($endpoint) - headers ($_headers) with data $data');
          final response = await _http.post(
            endpoint,
            data: data,
            queryParameters: queryParameters,
          );
          return response.data;
        } on DioException catch (e) {
          _logger.e(e.message);
          rethrow;
        } on Exception catch (e) {
          return _resolveInternalError(e);
        }
      },
    );
  }

  /// Perform API POST form data operations
  Future<dynamic> postFormData(
    String endpoint,
    Map<String, dynamic> data, {
    bool withAuthToken = true,
    String? filePath,
    String? fileKey,
    String? fileName,
  }) async {
    return await _httpRequest(
      () async {
        await _requestData(
          withAuthToken,
          formData: true,
        );
        try {
          if (filePath != null && fileKey != null) {
            if (fileName != null) {
              data[fileKey] = await MultipartFile.fromFile(
                filePath,
                filename: fileName,
              );
            } else {
              data[fileKey] = await MultipartFile.fromFile(
                filePath,
              );
            }
          }
          var formData = FormData.fromMap(data);
          final response = await _http.post(
            endpoint,
            data: formData,
          );
          return response.data;
        } on DioException {
          rethrow;
        } on Exception catch (e) {
          return _resolveInternalError(e);
        }
      },
    );
  }

  /// Perform API PUT operations
  Future<dynamic> put(
    String endpoint,
    Map<String, dynamic> data, {
    bool withAuthToken = true,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _httpRequest(
      () async {
        try {
          _logger
              .d('put() to ($endpoint) - headers ($_headers) with data $data');
          final response = await _http.put(
            endpoint,
            data: data,
            queryParameters: queryParameters,
          );
          return response.data;
        } on DioException {
          rethrow;
        } on Exception catch (e) {
          _logger.e(endpoint, e);
          return _resolveInternalError(e);
        }
      },
    );
  }

  /// Perform API DELETE operations
  Future<dynamic> delete(
    String endpoint, {
    bool withAuthToken = true,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _httpRequest(
      () async {
        try {
          _logger.d('delete() to ($endpoint) - headers ($_headers)');
          final response = await _http.delete(
            endpoint,
            queryParameters: queryParameters,
          );
          return response.data;
        } on DioException {
          rethrow;
        } on Exception catch (e) {
          return _resolveInternalError(e);
        }
      },
    );
  }
}

/// Interceptor
class RetryOnConnectionChangeInterceptor extends Interceptor {
  /// Constructor
  RetryOnConnectionChangeInterceptor({
    required this.dio,
  });

  /// Dio instance
  final Dio dio;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetryOnHttpException(err)) {
      try {
        handler.resolve(
          await DioHttpRequestRetirer(dio: dio).requestRetry(err.requestOptions)
          // ignore: body_might_complete_normally_catch_error
          ,
        );
      } catch (e) {
        handler.reject(err);
      }
    } else {
      handler.reject(err);
    }
  }

  bool _shouldRetryOnHttpException(DioException err) {
    return err.response?.statusCode == 401;
  }
}

/// Retirer
class DioHttpRequestRetirer {
  /// Constructor
  DioHttpRequestRetirer({
    required this.dio,
  });

  /// Client instance
  final Dio dio;

  final String _refreshPath = '/auth/refresh';

  /// Request retry method
  Future<Response> requestRetry(RequestOptions requestOptions) async {
    const storage = FlutterSecureStorage();
    final refreshToken = await storage.read(key: 'refreshToken') ?? '';
    if (refreshToken.isNotEmpty) {
      try {
        final result = await dio.request(
          _refreshPath,
          cancelToken: requestOptions.cancelToken,
          data: {'refreshToken': refreshToken},
          onReceiveProgress: requestOptions.onReceiveProgress,
          onSendProgress: requestOptions.onSendProgress,
          queryParameters: requestOptions.queryParameters,
          options: Options(
            headers: requestOptions.headers,
            sendTimeout: requestOptions.sendTimeout,
            receiveTimeout: requestOptions.receiveTimeout,
            extra: requestOptions.extra,
            followRedirects: requestOptions.followRedirects,
            listFormat: requestOptions.listFormat,
            maxRedirects: requestOptions.maxRedirects,
            method: 'POST',
            receiveDataWhenStatusError:
                requestOptions.receiveDataWhenStatusError,
            requestEncoder: requestOptions.requestEncoder,
            responseDecoder: requestOptions.responseDecoder,
            responseType: requestOptions.responseType,
            validateStatus: requestOptions.validateStatus,
          ),
        );
        if (!(result.data['error'] ?? true)) {
          GlobalLocator.appLogger.d('User session refreshed.');
          storage.write(
            key: 'accessToken',
            value: result.data['data']?['accessToken'],
          );
          storage.write(
            key: 'refreshToken',
            value: result.data['data']?['refreshToken'],
          );
          if ((result.data['data']?['accessToken'] ?? '')
              .toString()
              .isNotEmpty) {
            requestOptions.headers['Authorization'] =
                'Bearer ${result.data['data']?['accessToken']}';
          }
        }
        return await dio.request(
          requestOptions.path,
          cancelToken: requestOptions.cancelToken,
          data: requestOptions.data,
          onReceiveProgress: requestOptions.onReceiveProgress,
          onSendProgress: requestOptions.onSendProgress,
          queryParameters: requestOptions.queryParameters,
          options: Options(
            headers: requestOptions.headers,
            sendTimeout: requestOptions.sendTimeout,
            receiveTimeout: requestOptions.receiveTimeout,
            extra: requestOptions.extra,
            followRedirects: requestOptions.followRedirects,
            listFormat: requestOptions.listFormat,
            maxRedirects: requestOptions.maxRedirects,
            method: requestOptions.method,
            receiveDataWhenStatusError:
                requestOptions.receiveDataWhenStatusError,
            requestEncoder: requestOptions.requestEncoder,
            responseDecoder: requestOptions.responseDecoder,
            responseType: requestOptions.responseType,
            validateStatus: requestOptions.validateStatus,
          ),
        );
      } catch (e) {
        GlobalLocator.appLogger.d(e.toString());
        storage.write(
          key: 'accessToken',
          value: '',
        );
        storage.write(
          key: 'refreshToken',
          value: '',
        );
        return Response(requestOptions: requestOptions);
      }
    } else {
      return Response(requestOptions: requestOptions);
    }
  }
}

/// Api provider riverpod instance
final apiProvider =
    Provider.autoDispose<ApiDataSource>((ref) => ApiDataSource());
