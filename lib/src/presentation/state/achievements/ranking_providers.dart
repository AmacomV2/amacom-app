import 'package:amacom_app/src/data/repositories/achievements_repository.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/authentication/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Achievements ranking provider
final achievementsRankingProvider =
    FutureProvider.autoDispose<PersonRanking>((ref) async {
  return await ref.read(achievementsRepository).getAchievementsRanking(
        personId: ref.read(userProvider).value?.id ?? '',
      );
});

/// Rankings provider
final rankingsProvider = FutureProvider<RankingData>((ref) async {
  return await ref.read(achievementsRepository).getRankings();
});
