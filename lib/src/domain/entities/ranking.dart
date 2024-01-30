import 'package:amacom_app/src/utils/utils/global_locator.dart';

///
class RankingData {
  ///
  RankingData({
    required this.rankings,
  });

  ///
  List<Ranking> rankings;

  ///
  Ranking? globalRanking(double value) {
    for (Ranking element in rankings) {
      if (element.inRange(value)) {
        return element;
      }
    }
    return null;
  }

  /// Parse a list of entities from a Json List<Map>
  static RankingData fromJson(dynamic data) {
    final List<Ranking> result = [];

    try {
      for (var element in (data as List)) {
        try {
          result.add(Ranking.fromJson(element as Map));
        } catch (e) {
          GlobalLocator.appLogger.e(e);
        }
      }
    } catch (e) {
      GlobalLocator.appLogger.e(e);
    }
    return RankingData(rankings: result);
  }
}

///
class Ranking {
  ///

  Ranking({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.minScore,
    required this.maxScore,
    required this.level,
    required this.createdAt,
    required this.updatedAt,
  });

  ///

  factory Ranking.fromJson(Map json) => Ranking(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image: json['image'],
        minScore: json['minScore'],
        maxScore: json['maxScore'],
        level: json['level'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
      );

  ///

  String id;

  ///

  String name;

  ///

  String? description;

  ///
  String image;

  ///
  int minScore;

  ///
  int maxScore;

  ///
  String? level;

  ///
  DateTime createdAt;

  ///
  DateTime updatedAt;

  ///
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image': image,
        'minScore': minScore,
        'maxScore': maxScore,
        'level': level,
        'createdAt': createdAt.toString(),
        'updatedAt': updatedAt.toString(),
      };

  ///
  bool inRange(double value) {
    double min = (minScore > 1) ? (minScore / 100) : minScore.toDouble();
    double max = (maxScore > 1) ? (maxScore / 100) : maxScore.toDouble();
    return (value > (min > 0 ? min : -1)) && value <= max;
  }
}
