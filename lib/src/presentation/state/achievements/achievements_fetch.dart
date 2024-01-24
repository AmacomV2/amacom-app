import 'package:amacom_app/src/data/repositories/achievements_repository.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/authentication/user_provider.dart';
import 'package:amacom_app/src/presentation/state/subjects/subject_selection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Resources list provider
///
/// Calls achievements repository to fetch PersonAchievements data
final achievementsProvider =
    StateProvider.autoDispose<Pageable<List<PersonAchievement>>?>((ref) {
  ref.watch(achievementsSearchProvider);
  ref.watch(selectedSubject);
  ref.watch(achievementsOwnedProvider);
  return null;
});

/// Resources list provider
final achievementsListFetchProvider =
    FutureProvider.autoDispose<Pageable<List<PersonAchievement>>?>((ref) async {
  if (ref.watch(achievementsOwnedProvider)) {
    return await ref.read(achievementsRepository).getPersonAchievementsData(
          page: ref.watch(achievementsPageProvider),
          query: ref.watch(achievementsSearchProvider),
          subjectId: ref.watch(selectedSubject)?.id,
        );
  } else {
    return await ref.read(achievementsRepository).getAchievementsData(
          page: ref.watch(achievementsPageProvider),
          query: ref.watch(achievementsSearchProvider),
          personId: ref.read(userProvider).value?.id ?? '',
          subjectId: ref.watch(selectedSubject)?.id,
        );
  }
});

/// PersonAchievements search query provider
final achievementsSearchProvider =
    StateProvider.autoDispose<String>((ref) => '');

/// PersonAchievements search query provider
final achievementsOwnedProvider =
    StateProvider.autoDispose<bool>((ref) => true);

/// achievementsS list page provider
final achievementsPageProvider = StateProvider.autoDispose<int>((ref) {
  ref.watch(achievementsSearchProvider);
  return 0;
});
