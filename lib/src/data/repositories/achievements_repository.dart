import 'package:amacom_app/src/data/dataSources/api_data_source.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/domain/repositories/achievements_repository.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class AchievementsRepository implements IAchievementsRepository {
  ///
  AchievementsRepository({required this.api});

  /// APiDataSource object
  final ApiDataSource api;
  @override
  Future<Pageable<List<PersonAchievement>>?> getAchievementsData({
    int page = 0,
    required String query,
    String? subjectId,
    required String personId,
  }) async {
    final requestData = RequestData(
      path: '/achievement/searchNotAchieved',
      method: Method.get,
      queryParameters: {
        'page': page,
        'query': query,
        'personId': personId,
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
          return Pageable<List<PersonAchievement>>.fromJson(
            json as Map<String, dynamic>,
            Achievement.fromJsonList2,
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

  @override
  Future<Pageable<List<PersonAchievement>>?> getPersonAchievementsData({
    int page = 0,
    required String query,
    String? subjectId,
  }) async {
    final requestData = RequestData(
      path: '/personAchievement/search',
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
          return Pageable<List<PersonAchievement>>.fromJson(
            json as Map<String, dynamic>,
            PersonAchievement.fromJsonList,
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

  @override
  Future<PersonRanking> getAchievementsRanking({
    required String personId,
  }) async {
    final requestData = RequestData(
      path: '/personAchievement/personRanking',
      method: Method.get,
      queryParameters: {
        'personId': personId,
      },
    );
    final result = await api.request(
      requestData: requestData,
      withAuthToken: true,
    );
    BaseResponse data;
    try {
      data =
          BaseResponse.fromJson(result, (json) => PersonRanking.fromJson(json));
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
  Future<RankingData> getRankings() async {
    final requestData = RequestData(
      path: '/reward/getAll',
      method: Method.get,
    );
    final result = await api.request(
      requestData: requestData,
      withAuthToken: true,
    );
    BaseResponse data;
    try {
      data =
          BaseResponse.fromJson(result, (json) => RankingData.fromJson(json));
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
  Future<PersonAchievement> savePersonAchievement({
    int score = 0,
    required String achievementId,
    required String personId,
  }) async {
    final requestData = RequestData(
      path: '/personAchievement/save',
      method: Method.post,
      body: {
        'idAchievement': achievementId,
        'personId': personId,
        'score': score,
      },
    );
    final result = await api.request(
      requestData: requestData,
      withAuthToken: true,
    );
    BaseResponse data;
    try {
      data = BaseResponse.fromJson(
        result,
        (json) => PersonAchievement.fromJson(json as Map),
      );
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
final achievementsRepository = Provider.autoDispose<IAchievementsRepository>(
  (ref) => AchievementsRepository(api: ref.read(apiProvider)),
);
