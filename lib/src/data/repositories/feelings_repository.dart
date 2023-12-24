import 'package:amacom_app/src/data/dataSources/api_data_source.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/domain/repositories/feelings_repository.dart';
import 'package:amacom_app/src/utils/utils/global_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Feelings repo
class FeelingsRepository implements IFeelingsRepository {
  /// Repository constructor
  FeelingsRepository({required this.api});

  /// APiDataSource object
  final ApiDataSource api;

  @override
  Future<Pageable<List<GenericData>>?> getFeelings({
    int page = 0,
    required String query,
  }) async {
    final requestData = RequestData(
      path: '/feelings/search',
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
          return Pageable<List<GenericData>>.fromJson(
            json as Map<String, dynamic>,
            GenericData.fromJsonList,
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
final feelingsRepository = Provider.autoDispose<IFeelingsRepository>(
  (ref) => FeelingsRepository(api: ref.read(apiProvider)),
);
