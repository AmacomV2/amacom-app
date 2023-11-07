import 'package:amacom_app/src/data/dataSources/api_data_source.dart';
import 'package:amacom_app/src/domain/dtos/logbook_dto.dart';
import 'package:amacom_app/src/domain/entities/baseResponse/base_response.dart';
import 'package:amacom_app/src/domain/entities/logbook.dart';
import 'package:amacom_app/src/domain/entities/pageable/pageable.dart';
import 'package:amacom_app/src/domain/entities/request_data.dart';
import 'package:amacom_app/src/domain/repositories/logbooks_repository.dart';
import 'package:amacom_app/src/utils/utils/global_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Logbooks repo
class LogbooksRepository implements ILogbooksRepository {
  /// Repository constructor
  LogbooksRepository({required this.api});

  /// APiDataSource object
  final ApiDataSource api;
  @override
  Future<Logbook> create(LogbookDTO logbookDTO) async {
    final requestData = RequestData(
      path: '/logBook/create',
      method: Method.post,
      body: logbookDTO.toJson(),
    );
    final result = await api.request(
      requestData: requestData,
      withAuthToken: true,
    );
    BaseResponse data;
    try {
      data = BaseResponse.fromJson(result, (json) {
        return Logbook.fromJson(json as Map);
      });
    } catch (e) {
      data = BaseResponse.fromJson(result, (_) {});
    }
    if (!data.ok) {
      throw Exception(data.message);
    } else {
      return data.data;
    }
  }

  @override
  Future<bool> delete(String logbookId) async {
    final requestData = RequestData(
      path: '/logBook/$logbookId',
      method: Method.delete,
    );
    final result = await api.request(
      requestData: requestData,
      withAuthToken: true,
    );
    BaseResponse data;
    try {
      data = BaseResponse.fromJson(result, (json) {
        return json == true;
      });
    } catch (e) {
      data = BaseResponse.fromJson(result, (_) {});
    }
    if (!data.ok) {
      throw Exception(data.message);
    } else {
      return data.data;
    }
  }

  @override
  Future<bool> edit({required String id, required LogbookDTO logbookDTO}) {
    throw UnimplementedError();
  }

  @override
  Future<Pageable<List<Logbook>>?> getLogbooksData({
    int page = 0,
    required String query,
  }) async {
    final requestData = RequestData(
      path: '/logBook/consult',
      method: Method.get,
      queryParameters: {
        'page': page,
        'query': query,
      },
    );
    final result = await api.request(
      requestData: requestData,
      withAuthToken: true,
    );
    BaseResponse data;
    try {
      data = BaseResponse.fromJson(result, (json) {
        try {
          return Pageable<List<Logbook>>.fromJson(
            json as Map<String, dynamic>,
            Logbook.fromJsonList,
          );
        } catch (e) {
          GlobalLocator.appLogger.e(e);
        }
        return null;
      });
    } catch (e) {
      data = BaseResponse.fromJson(result, (_) {});
    }
    if (!data.ok) {
      throw Exception(data.message);
    } else {
      return data.data;
    }
  }
}

/// User repository riverpod instance
final logbooksRepository = Provider.autoDispose<ILogbooksRepository>(
  (ref) => LogbooksRepository(api: ref.read(apiProvider)),
);
