import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/subjects/subject_selection.dart';
import 'package:amacom_app/src/presentation/views/achievements/widgets/ranking_icon.dart';
import 'package:amacom_app/src/presentation/views/achievements/widgets/search_achievements.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class AchievementsHeader extends ConsumerWidget {
  ///
  const AchievementsHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final appLocalizations = AppLocalizations.of(context);
    return ColumnWithPadding(
      children: [
        CustomAppBar2(
          title: appLocalizations?.achievements ?? '',
          subtitle: appLocalizations?.achievementsText ?? '',
          action: const IconRanking(),
        ),
        SearchAchievements(),
        const SafeSpacer(
          height: 10,
        ),
        if (ref.watch(selectedSubject) != null)
          ChoiceChip(
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            selected: true,
            onSelected: (_) {
              ref.read(selectedSubject.notifier).update((state) => null);
            },
            avatar: const Icon(
              Icons.check_circle_outline_rounded,
              color: Colors.white,
            ),
            label: Text(
              ref.read(selectedSubject)?.name ?? '',
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}
