import 'package:amacom_app/src/domain/entities/situations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Situations list provider
final situationsListProvider =
    FutureProvider<List<SituationEntity>>((ref) async {
  await Future.delayed(const Duration(seconds: 3));

  return Future.value(
    SituationEntity.fromJsonList([
      {
        'id': 'asd',
        'person_id': 'asd',
        'created_by': 'asd',
        'subject_id': 'asd',
        'description': 'asd',
        'first_thought': 'asd',
        'behavior': 'asd',
        'affectation_degree': 8,
        'create_time': '2023-09-28 11:40:55',
        'update_time': '2023-09-28 11:40:55',
        'nursing_assessment': 'asd',
      }
    ]),
  );
});
