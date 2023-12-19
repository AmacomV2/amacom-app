import 'package:amacom_app/src/data/repositories/situation_repository.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Situations list provider
///
/// Calls situations repository to fetch SituationEntity data
final situationsProvider =
    StateProvider.autoDispose<Pageable<List<SituationEntity>>?>((ref) {
  ref.watch(situationsSearchProvider);
  ref.watch(situationsStatusProvider);
  ref.watch(situationsAlertProvider);
  return null;
});

/// Situations list provider
final situationsListFetchProvider =
    FutureProvider.autoDispose<Pageable<List<SituationEntity>>?>((ref) async {
  return await ref.read(situationsRepository).getUserSituations(
        page: ref.watch(situationsPageProvider),
        query: ref.watch(situationsSearchProvider),
        status: ref.watch(situationsStatusProvider),
        alert: ref.watch(situationsAlertProvider),
      );
});

/// SituationEntity search query provider
final situationsSearchProvider = StateProvider.autoDispose<String>((ref) => '');

/// SituationEntity status query provider
final situationsStatusProvider =
    StateProvider.autoDispose<String?>((ref) => null);

/// SituationEntity alert query provider
final situationsAlertProvider =
    StateProvider.autoDispose<String?>((ref) => null);

/// situationsS list page provider
final situationsPageProvider = StateProvider.autoDispose<int>((ref) {
  ref.watch(situationsSearchProvider);
  ref.watch(situationsStatusProvider);
  ref.watch(situationsAlertProvider);
  return 0;
});
