import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/achievements/achievements_fetch.dart';
import 'package:amacom_app/src/presentation/views/subjects/widgets/subjects_body.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class AchievementsFilter extends ConsumerStatefulWidget {
  ///
  const AchievementsFilter({super.key});

  @override
  ConsumerState<AchievementsFilter> createState() => _AchievementsFilterState();
}

class _AchievementsFilterState extends ConsumerState<AchievementsFilter> {
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                appLocalizations?.onlyObtained ?? '',
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 18,
              child: Switch.adaptive(
                value: ref.watch(achievementsOwnedProvider),
                onChanged: (value) {
                  ref
                      .read(achievementsOwnedProvider.notifier)
                      .update((state) => value);
                },
              ),
            ),
          ],
        ),
        const SafeSpacer(
          height: 8,
        ),
        Expanded(
          child: SubjectsBody(
            title: appLocalizations?.selectSubject ?? '',
          ),
        ),
      ],
    );
  }
}
