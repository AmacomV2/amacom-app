import 'package:amacom_app/src/data/dataSources/api_data_source.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/domain/repositories/resources_repository.dart';
import 'package:amacom_app/src/utils/utils/global_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Resources repo
class ResourcesRepository implements IResourcesRepository {
  /// Repository constructor
  ResourcesRepository({required this.api});

  /// APiDataSource object
  final ApiDataSource api;

  @override
  Future<Pageable<List<GenericData>>?> getResourcesData({
    int page = 0,
    required String query,
    String? subjectId,
  }) async {
    final requestData = RequestData(
      path: '/supportMaterial/search',
      method: Method.get,
      queryParameters: {
        'page': page,
        'query': query,
        'subjectId': subjectId,
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

/// Resources repository riverpod instance
final resourcesRepository = Provider.autoDispose<IResourcesRepository>(
  (ref) => ResourcesRepository(api: ref.read(apiProvider)),
);
