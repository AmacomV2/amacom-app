import 'package:amacom_app/src/data/repositories/resources_repository.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/resources/selected_resource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Resources list provider
///
/// Calls resourceFiles repository to fetch ResourcesEntity data
final resourceFilesProvider =
    StateProvider.autoDispose<Pageable<List<SupportMaterialFile>>?>((ref) {
  ref.watch(resourceFilesSearchProvider);
  return null;
});

/// Resources list provider
final resourceFilesListFetchProvider =
    FutureProvider.autoDispose<Pageable<List<SupportMaterialFile>>?>(
        (ref) async {
  return await ref.read(resourcesRepository).getFiles(
        page: ref.watch(resourceFilesPageProvider),
        query: ref.read(resourceFilesSearchProvider),
        supportMaterialId: ref.read(selectedResourceProvider)?.id,
      );
});

/// ResourcesEntity search query provider
final resourceFilesSearchProvider =
    StateProvider.autoDispose<String>((ref) => '');

/// resourceFilesS list page provider
final resourceFilesPageProvider = StateProvider.autoDispose<int>((ref) {
  ref.watch(resourceFilesSearchProvider);
  return 0;
});
