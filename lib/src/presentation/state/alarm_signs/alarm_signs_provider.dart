import 'package:amacom_app/src/data/repositories/alarm_signs_repository.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Situations list provider
///
/// Calls alarmSign repository to fetch AlarmSignEntity data
final alarmSignProvider =
    StateProvider.autoDispose<Pageable<List<AlarmSignEntity>>?>((ref) {
  ref.watch(alarmSignSearchProvider);
  return null;
});

/// Situations list provider
final alarmSignListFetchProvider = FutureProvider.autoDispose
    .family<Pageable<List<AlarmSignEntity>>?, String>((ref, type) async {
  return await ref.read(alarmSignsRepository).getAlarmSignsData(
        page: ref.watch(alarmSignPageProvider),
        query: ref.watch(alarmSignSearchProvider),
        type: type,
      );
});

/// AlarmSignEntity search query provider
final alarmSignSearchProvider = StateProvider.autoDispose<String>((ref) => '');

/// alarmSignS list page provider
final alarmSignPageProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
