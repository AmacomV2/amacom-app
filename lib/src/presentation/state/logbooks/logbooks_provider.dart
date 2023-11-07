import 'package:amacom_app/src/data/repositories/logbooks_repository.dart';
import 'package:amacom_app/src/domain/entities/logbook.dart';
import 'package:amacom_app/src/domain/entities/pageable/pageable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// logbook list provider
///
/// Calls logbooks repository to fetch Logbook data
final logbooksProvider =
    StateProvider.autoDispose<Pageable<List<Logbook>>?>((ref) {
  ref.watch(logbookSearchProvider);
  return null;
});

/// logbook list provider
final logbookListFetchProvider =
    FutureProvider.autoDispose<Pageable<List<Logbook>>?>((ref) async {
  return await ref.read(logbooksRepository).getLogbooksData(
        page: ref.watch(logbookPageProvider),
        query: ref.watch(logbookSearchProvider),
      );
});

/// Logbook search query provider
final logbookSearchProvider = StateProvider.autoDispose<String>((ref) => '');

/// Logbooks list page provider
final logbookPageProvider = StateProvider.autoDispose<int>((ref) {
  ref.watch(logbookSearchProvider);
  return 0;
});
