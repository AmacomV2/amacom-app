import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

///
class Achievement {
  ///
  Achievement({
    required this.id,
    required this.subjectId,
    required this.subjectName,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  ///

  factory Achievement.fromJson(Map json) => Achievement(
        id: json['id'],
        subjectId: json['subjectId'],
        subjectName: json['subjectName'],
        name: json['name'],
        description: json['description'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );

  ///
  String id;

  ///
  String subjectId;

  ///
  String subjectName;

  ///
  String name;

  ///
  String description;

  ///
  String createdAt;

  ///
  String updatedAt;

  /// To personAchievement
  PersonAchievement toPersonAchievement() {
    return PersonAchievement(
      id: '',
      score: 'CERO',
      personId: '',
      achievement: this,
      idAchievement: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Parse a list of entities from a Json List<Map>
  static List<Achievement> fromJsonList(dynamic data) {
    final List<Achievement> result = [];

    try {
      for (var element in (data as List)) {
        try {
          result.add(Achievement.fromJson(element as Map));
        } catch (e) {
          GlobalLocator.appLogger.e(e);
        }
      }
    } catch (e) {
      GlobalLocator.appLogger.e(e);
    }

    return result;
  }

  /// Parse a list of entities from a Json List<Map>
  static List<PersonAchievement> fromJsonList2(dynamic data) {
    final List<PersonAchievement> result = [];

    try {
      for (var element in (data as List)) {
        try {
          result
              .add(Achievement.fromJson(element as Map).toPersonAchievement());
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
