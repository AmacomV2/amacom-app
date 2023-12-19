import 'package:amacom_app/src/data/dataSources/api_data_source.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/domain/repositories/situations_repository.dart';
import 'package:amacom_app/src/utils/utils/global_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Situations repo
class SituationsRepository implements ISituationsRepository {
  /// Repository constructor
  SituationsRepository({required this.api});

  /// APiDataSource object
  final ApiDataSource api;
  @override
  Future<Pageable<List<SituationEntity>>?> getUserSituations({
    int page = 0,
    required String query,
    String? status,
    String? alert,
  }) async {
    final requestData = RequestData(
      path: '/personSituation/search',
      method: Method.get,
      queryParameters: {
        'page': page,
        'query': query,
        'consultationStatus': status,
        'consultationAlert': alert,
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
          return Pageable<List<SituationEntity>>.fromJson(
            json as Map<String, dynamic>,
            SituationEntity.fromJsonList,
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
final situationsRepository = Provider.autoDispose<ISituationsRepository>(
  (ref) => SituationsRepository(api: ref.read(apiProvider)),
);
