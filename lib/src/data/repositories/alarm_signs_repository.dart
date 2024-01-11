import 'package:amacom_app/src/data/dataSources/api_data_source.dart';
import 'package:amacom_app/src/domain/entities/alarm_sign.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/domain/repositories/alarm_signs_repository.dart';
import 'package:amacom_app/src/utils/utils/global_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// AlarmSigns repo
class AlarmSignsRepository implements IAlarmSignsRepository {
  /// Repository constructor
  AlarmSignsRepository({required this.api});

  /// APiDataSource object
  final ApiDataSource api;

  @override
  Future<Pageable<List<AlarmSignEntity>>?> getAlarmSignsData({
    int page = 0,
    required String query,
    required String type,
  }) async {
    final requestData = RequestData(
      path: '/alarmSign/search',
      method: Method.get,
      queryParameters: {
        'page': page,
        'query': query,
        'type': type,
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
          return Pageable<List<AlarmSignEntity>>.fromJson(
            json as Map<String, dynamic>,
            AlarmSignEntity.fromJsonList,
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
final alarmSignsRepository = Provider.autoDispose<IAlarmSignsRepository>(
  (ref) => AlarmSignsRepository(api: ref.read(apiProvider)),
);
