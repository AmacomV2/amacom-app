import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/views/achievements/widgets/widgets.dart';
import 'package:amacom_app/src/presentation/widgets/app_bars.dart';
import 'package:amacom_app/src/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

///
class AchievementRankingScreen extends StatelessWidget {
  ///
  const AchievementRankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return CustomScaffold(
      body: Column(
        children: [
          CustomAppBar2(
            title:
                appLocalizations?.achievementsRanking ?? 'Achievements ranking',
            subtitle: appLocalizations?.achievementsRankingText ?? '',
            padding: true,
          ),
          const Expanded(
            child: AchievementsRankingBody(),
          ),
        ],
      ),
    );
  }
}
