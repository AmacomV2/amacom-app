import 'package:amacom_app/src/data/repositories/resources_repository.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Resources list provider
///
/// Calls resources repository to fetch ResourcesEntity data
final resourcesProvider =
    StateProvider.autoDispose<Pageable<List<GenericData>>?>((ref) {
  ref.watch(resourcesSearchProvider);
  ref.watch(resourcesSubjectProvider);
  return null;
});

/// Resources list provider
final resourcesListFetchProvider =
    FutureProvider.autoDispose<Pageable<List<GenericData>>?>((ref) async {
  return await ref.read(resourcesRepository).getResourcesData(
        page: ref.watch(resourcesPageProvider),
        query: ref.watch(resourcesSearchProvider),
      );
});

/// ResourcesEntity search query provider
final resourcesSearchProvider = StateProvider.autoDispose<String>((ref) => '');

/// ResourcesEntity status query provider
final resourcesSubjectProvider =
    StateProvider.autoDispose<SubjectEntity?>((ref) => null);

/// resourcesS list page provider
final resourcesPageProvider = StateProvider.autoDispose<int>((ref) {
  ref.watch(resourcesSearchProvider);
  ref.watch(resourcesSubjectProvider);
  return 0;
});
