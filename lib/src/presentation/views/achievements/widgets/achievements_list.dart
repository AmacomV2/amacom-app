import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/data/repositories/achievements_repository.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/achievements/achievements_fetch.dart';
import 'package:amacom_app/src/presentation/state/achievements/ranking_providers.dart';
import 'package:amacom_app/src/presentation/state/authentication/user_provider.dart';
import 'package:amacom_app/src/presentation/views/achievements/widgets/person_achievement_card.dart';
import 'package:amacom_app/src/utils/constant/app_constants.dart';
import 'package:amacom_app/src/utils/utils/app_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// Achievements list
///
/// ListView with which hace a controller with a listener to
/// fetch more achievements on scroll end.
class AchievementsList extends ConsumerStatefulWidget {
  ///
  const AchievementsList({
    super.key,
    required this.data,
    required this.controller,
  });

  ///
  final List<PersonAchievement>? data;

  ///
  final ScrollController controller;

  @override
  ConsumerState<AchievementsList> createState() => _AchievementsListState();
}

class _AchievementsListState extends ConsumerState<AchievementsList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    var _ = ref.refresh(achievementsProvider);
    ref.read(achievementsPageProvider.notifier).update((state) => 0);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final achievementData = widget.data?.first.achievement;
    String subjectId = achievementData?.subjectId ?? '';
    final textTheme = Theme.of(context).textTheme;
    final appLocalizations = AppLocalizations.of(context);
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      child: ListView.separated(
        padding: const EdgeInsets.only(
          bottom: 90,
        ),
        controller: widget.controller,
        physics: AppConstants.scrollPhysics,
        itemCount: widget.data?.length ?? 0,
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 8,
        ),
        itemBuilder: (context, index) {
          final resource = widget.data?[index];
          final card = PersonAchievementCard(
            data: resource,
            onScoreUpdate: (value) async {
              try {
                await ref.read(achievementsRepository).savePersonAchievement(
                      achievementId: resource?.achievement.id ?? '',
                      personId: ref.read(userProvider).value?.id ?? '',
                      score: value,
                    );
                ref.invalidate(achievementsRankingProvider);
              } catch (e) {
                AppDialogs.showCustomSnackBar(
                  appLocalizations?.error ?? '',
                  color: FigmaColors.danger_700,
                  icon: Icons.warning_amber_rounded,
                );
              }
            },
          );
          if (index == 0 || resource?.achievement.subjectId != subjectId) {
            subjectId = resource?.achievement.subjectId ?? '';
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  child: Text(
                    '${resource?.achievement.subjectName}',
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                card,
              ],
            );
          }
          return card;
        },
      ),
    );
  }
}
