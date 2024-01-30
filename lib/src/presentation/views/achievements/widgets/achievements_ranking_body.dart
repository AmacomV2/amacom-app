import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/achievements/ranking_providers.dart';
import 'package:amacom_app/src/presentation/views/achievements/widgets/ranking_card.dart';
import 'package:amacom_app/src/presentation/widgets/custom_body.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

///
class AchievementsRankingBody extends ConsumerWidget {
  ///
  const AchievementsRankingBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context);

    return ref.watch(rankingsProvider).when(
          data: (rankingsData) {
            return ref.watch(achievementsRankingProvider).when(
                  data: (achievementsRanking) {
                    final globalRanking = rankingsData.globalRanking(
                      achievementsRanking.globalRankingValue(),
                    );
                    return ScrollColumnExpandable(
                      padding: EdgeInsets.zero,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (globalRanking != null)
                          Padding(
                            padding: GlobalLocator
                                .responsiveDesign.appHorizontalPadding,
                            child: RankingCard(
                              global: true,
                              achievementRanking:
                                  achievementsRanking.globalRankingValue(),
                              ranking: globalRanking,
                              name: appLocalizations?.globalRanking ??
                                  'Global Ranking',
                            ),
                          ),
                        const SafeSpacer(),
                        Expanded(
                          child: CustomBody(
                            padding:
                                GlobalLocator.responsiveDesign.appHInnerPadding,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Column(
                              children: [
                                const SafeSpacer(
                                  height: 14,
                                ),
                                Text(
                                  appLocalizations?.rankingByTopic ??
                                      'Ranking by topic category',
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    fontSize: 17,
                                  ),
                                ),
                                const SafeSpacer(
                                  height: 12,
                                ),
                                ...achievementsRanking.achievementsRanking.map(
                                  (e) => RankingCard(
                                    global: false,
                                    achievementRanking: e.rankingValue(),
                                    ranking: rankingsData.globalRanking(
                                      e.rankingValue(),
                                    ),
                                    name: e.subjectName,
                                  ).paddingBottom(12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  error: (error, stackTrace) => const EmptyListWidget(),
                  loading: () => const SizedCustomProgressIndicator(),
                );
          },
          error: (error, stackTrace) => const EmptyListWidget(),
          loading: () => const SizedCustomProgressIndicator(),
        );
  }
}
