import 'package:amacom_app/src/data/dataSources/api_data_source.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/domain/repositories/subjects_repository.dart';
import 'package:amacom_app/src/utils/utils/global_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Subjects repo
class SubjectsRepository implements ISubjectsRepository {
  /// Repository constructor
  SubjectsRepository({required this.api});

  /// APiDataSource object
  final ApiDataSource api;

  @override
  Future<Pageable<List<SubjectEntity>>?> getSubjectsData({
    int page = 0,
    required String query,
    String? parentId,
  }) async {
    final requestData = RequestData(
      path: '/subject/search',
      method: Method.get,
      queryParameters: {
        'page': page,
        'query': query,
        'parentId': parentId,
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
          return Pageable<List<SubjectEntity>>.fromJson(
            json as Map<String, dynamic>,
            SubjectEntity.fromJsonList,
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
final subjectsRepository = Provider.autoDispose<ISubjectsRepository>(
  (ref) => SubjectsRepository(api: ref.read(apiProvider)),
);
