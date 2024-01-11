import 'package:amacom_app/src/data/repositories/subjects_repository.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Situations list provider
///
/// Calls subjects repository to fetch SubjectEntity data
final subjectsProvider =
    StateProvider.autoDispose<Pageable<List<SubjectEntity>>?>((ref) {
  ref.watch(subjectsSearchProvider);
  return null;
});

/// Situations list provider
///
/// Calls subjects repository to fetch SubjectEntity data
final subjectsProviderFamily = FutureProvider.family
    .autoDispose<Pageable<List<SubjectEntity>>?, String>((ref, parentId) async {
  return await ref.read(subjectsRepository).getSubjectsData(
        page: 0,
        query: '',
        parentId: parentId,
      );
});

/// Situations list provider
final subjectsListFetchProvider =
    FutureProvider.autoDispose<Pageable<List<SubjectEntity>>?>((ref) async {
  return await ref.read(subjectsRepository).getSubjectsData(
        page: ref.watch(subjectsPageProvider),
        query: ref.watch(subjectsSearchProvider),
      );
});

/// SubjectEntity search query provider
final subjectsSearchProvider = StateProvider.autoDispose<String>((ref) => '');

/// subjectsS list page provider
final subjectsPageProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});
