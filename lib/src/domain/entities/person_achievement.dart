import 'package:amacom_app/src/domain/entities/achievement.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

///

class PersonAchievement {
  ///
  PersonAchievement({
    required this.id,
    required this.score,
    required this.personId,
    required this.achievement,
    required this.idAchievement,
    required this.createdAt,
    required this.updatedAt,
  });

  ///
  factory PersonAchievement.fromJson(Map json) => PersonAchievement(
        id: json['id'],
        score: json['score'],
        personId: json['personId'],
        achievement: Achievement.fromJson(json['achievement']),
        idAchievement: json['idAchievement'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );

  ///

  String id;

  ///
  String score;

  ///
  String personId;

  ///
  Achievement achievement;

  ///
  String idAchievement;

  ///
  String createdAt;

  ///
  String updatedAt;

  /// Get numeric score value
  int getScore() {
    switch (score) {
      case 'UNO':
        return 1;
      case 'DOS':
        return 2;
      case 'TRES':
        return 3;
      default:
        return 0;
    }
  }

  /// Parse a list of entities from a Json List<Map>
  static List<PersonAchievement> fromJsonList(dynamic data) {
    final List<PersonAchievement> result = [];

    try {
      for (var element in (data as List)) {
        try {
          result.add(PersonAchievement.fromJson(element as Map));
        } catch (e) {
          GlobalLocator.appLogger.e(e);
        }
      }
    } catch (e) {
      GlobalLocator.appLogger.e(e);
    }

    return result;
  }
}
