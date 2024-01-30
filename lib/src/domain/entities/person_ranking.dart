import 'package:amacom_app/src/utils/utils/global_locator.dart';

///
class PersonRanking {
  ///
  PersonRanking({
    required this.achievementsRanking,
  });

  ///
  List<PersonAchievementRanking> achievementsRanking;

  ///
  Map<String, double> globalRanking() {
    Map<String, double> global = {
      'achievementsCount': 0,
      'personAchievements': 0,
    };
    for (PersonAchievementRanking element in achievementsRanking) {
      global['achievementsCount'] =
          (global['achievementsCount'] ?? 0) + element.achievementCount;
      global['personAchievements'] =
          (global['personAchievements'] ?? 0) + element.personAchievementCount;
    }
    return global;
  }

  ///
  double globalRankingValue() {
    double achievementsCount = 0;
    double personAchievements = 0;
    for (PersonAchievementRanking element in achievementsRanking) {
      achievementsCount = achievementsCount + element.achievementCount;
      personAchievements = personAchievements + element.personAchievementCount;
    }
    return personAchievements /
        ((achievementsCount > 0 ? achievementsCount : 1) * 3);
  }

  /// Parse a list of entities from a Json List<Map>
  static PersonRanking fromJson(dynamic data) {
    final List<PersonAchievementRanking> result = [];

    try {
      for (var element in (data as List)) {
        try {
          result.add(PersonAchievementRanking.fromJson(element as Map));
        } catch (e) {
          GlobalLocator.appLogger.e(e);
        }
      }
    } catch (e) {
      GlobalLocator.appLogger.e(e);
    }
    return PersonRanking(achievementsRanking: result);
  }
}

///
class PersonAchievementRanking {
  ///
  PersonAchievementRanking({
    required this.subjectName,
    required this.subjectId,
    required this.achievementCount,
    required this.personAchievementCount,
  });

  ///
  factory PersonAchievementRanking.fromJson(Map json) =>
      PersonAchievementRanking(
        subjectName: json['subjectName'],
        subjectId: json['subjectId'],
        achievementCount:
            int.tryParse((json['achievementCount'] ?? '').toString()) ?? 0,
        personAchievementCount:
            int.tryParse((json['personAchievementCount'] ?? '').toString()) ??
                0,
      );

  ///
  String subjectName;

  ///
  String subjectId;

  ///
  int achievementCount;

  ///
  int personAchievementCount;

  ///
  Map<String, dynamic> toJson() => {
        'subjectName': subjectName,
        'subjectId': subjectId,
        'achievementCount': achievementCount,
        'personAchievementCount': personAchievementCount,
      };

  ///
  double rankingValue() {
    return personAchievementCount /
        ((achievementCount > 0 ? achievementCount : 1) * 3);
  }
}
