import 'package:amacom_app/src/data/repositories/resources_repository.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/subjects/subject_selection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Resources list provider
///
/// Calls resources repository to fetch ResourcesEntity data
final resourcesProvider =
    StateProvider.autoDispose<Pageable<List<GenericData>>?>((ref) {
  ref.watch(resourcesSearchProvider);
  ref.watch(selectedSubject);
  return null;
});

/// Resources list provider
final resourcesListFetchProvider =
    FutureProvider.autoDispose<Pageable<List<GenericData>>?>((ref) async {
  return await ref.read(resourcesRepository).getResourcesData(
        page: ref.watch(resourcesPageProvider),
        query: ref.watch(resourcesSearchProvider),
        subjectId: ref.watch(selectedSubject)?.id,
      );
});

/// ResourcesEntity search query provider
final resourcesSearchProvider = StateProvider.autoDispose<String>((ref) => '');

/// resourcesS list page provider
final resourcesPageProvider = StateProvider.autoDispose<int>((ref) {
  ref.watch(resourcesSearchProvider);
  return 0;
});
