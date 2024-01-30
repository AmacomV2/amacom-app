import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/data/dataSources/local_data_source.dart';
import 'package:amacom_app/src/presentation/state/achievements/ranking_providers.dart';
import 'package:amacom_app/src/presentation/widgets/circular_progress_indicator.dart';
import 'package:amacom_app/src/utils/utils/navigation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

///
class IconRanking extends ConsumerWidget {
  ///
  const IconRanking({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double globalRankingValue = 0;
    return Material(
      borderRadius: BorderRadius.circular(500),
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(7),
        alignment: Alignment.center,
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
            ),
          ],
        ),
        child: ref.watch(rankingsProvider).when(
              data: (rankingsData) {
                return GestureDetector(
                  onTap: () {
                    LocalDataSource.setVar(
                      key: 'global_ranking',
                      value: globalRankingValue,
                    );
                    Navigation.goTo(CustomAppRouter.achievementsRanking);
                  },
                  child: ref.watch(achievementsRankingProvider).when(
                        data: (achievementsRanking) {
                          globalRankingValue =
                              achievementsRanking.globalRankingValue();
                          final image = rankingsData.globalRanking(
                            globalRankingValue,
                          );
                          if (image == null) {
                            return const FaIcon(
                              FontAwesomeIcons.trophy,
                              color: FigmaColors.primary_300,
                              size: 20,
                            );
                          }

                          return Badge(
                            isLabelVisible: LocalDataSource.getVarDouble(
                                  'global_ranking',
                                ) !=
                                globalRankingValue,
                            child: CachedNetworkImage(
                              imageUrl: rankingsData
                                  .globalRanking(
                                    achievementsRanking.globalRankingValue(),
                                  )!
                                  .image,
                            ),
                          );
                        },
                        error: (error, stackTrace) => const FaIcon(
                          FontAwesomeIcons.trophy,
                          color: FigmaColors.primary_300,
                          size: 20,
                        ),
                        loading: () =>
                            const SizedCustomProgressIndicator().paddingAll(4),
                      ),
                );
              },
              error: (error, stackTrace) => const Icon(
                Icons.warning,
                color: Colors.red,
              ),
              loading: () => const SizedCustomProgressIndicator2(),
            ),
      ),
    );
  }
}
