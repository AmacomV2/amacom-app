import 'package:amacom_app/src/data/repositories/feelings_repository.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Situations list provider
///
/// Calls feelings repository to fetch GenericData data
final feelingsProvider =
    StateProvider.autoDispose<Pageable<List<GenericData>>?>((ref) {
  ref.watch(feelingsSearchProvider);
  return null;
});

/// Situations list provider
final feelingsListFetchProvider =
    FutureProvider.autoDispose<Pageable<List<GenericData>>?>((ref) async {
  return await ref.read(feelingsRepository).getFeelings(
        page: ref.watch(feelingsPageProvider),
        query: ref.watch(feelingsSearchProvider),
      );
});

/// GenericData search query provider
final feelingsSearchProvider = StateProvider.autoDispose<String>((ref) => '');

/// feelingsS list page provider
final feelingsPageProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
