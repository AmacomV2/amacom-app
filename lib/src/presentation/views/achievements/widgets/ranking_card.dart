import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/widgets/spacers.dart';
import 'package:amacom_app/src/utils/constant/app_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

///
class RankingCard extends StatelessWidget {
  ///
  const RankingCard({
    super.key,
    required this.achievementRanking,
    this.ranking,
    required this.name,
    this.global = false,
  });

  /// To show as Global Ranking
  final bool global;

  ///
  final double achievementRanking;

  ///
  final String name;

  ///
  final Ranking? ranking;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      borderRadius: BorderRadius.circular(AppConstants.cardRadius),
      elevation: global ? 0 : 2,
      child: Container(
        height: global ? 80 : 75,
        decoration: BoxDecoration(
          color: global ? Colors.white : FigmaColors.background,
          borderRadius: BorderRadius.circular(AppConstants.cardRadius),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 12,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: theme.textTheme.headlineSmall
                        ?.copyWith(fontSize: global ? 18 : 17),
                    maxLines: 1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ranking?.name ?? '',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                      ),
                      SafeSpacer(
                        height: global ? 6 : 2,
                      ),
                      LinearProgressIndicator(
                        value: achievementRanking,
                        borderRadius:
                            BorderRadius.circular(AppConstants.cardRadius),
                        minHeight: global ? 10 : 6,
                      ),
                    ],
                  ).paddingLeft(4),
                ],
              ),
            ),
            const HorizontalSpacer(),
            Container(
              height: global ? 65 : 60,
              width: global ? 65 : 60,
              decoration: BoxDecoration(
                color: FigmaColors.primary_400,
                borderRadius: BorderRadius.circular(999),
              ),
              padding: const EdgeInsets.all(4),
              child: Container(
                decoration: BoxDecoration(
                  color: FigmaColors.primary_100,
                  borderRadius: BorderRadius.circular(999),
                ),
                padding: const EdgeInsets.all(4),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(9999),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ranking != null
                          ? CachedNetworkImage(
                              imageUrl: ranking!.image,
                            )
                          : const FaIcon(
                              FontAwesomeIcons.trophy,
                              color: FigmaColors.primary_300,
                              size: 30,
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
