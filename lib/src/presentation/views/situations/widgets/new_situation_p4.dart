import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/situations/new_situation_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/selected_alarm_signs.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/selected_feelings.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/selected_subjects.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class NewSituationP4 extends ConsumerWidget {
  ///
  const NewSituationP4({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final appLocalizations = AppLocalizations.of(context);
    return Scrollbar(
      child: ScrollColumnExpandable(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${appLocalizations?.affectationDegree}: ',
            style: theme.textTheme.bodyLarge?.copyWith(),
            textAlign: TextAlign.justify,
          ),
          const SafeSpacer(
            height: 8,
          ),
          DegreeSelector(
            stateProvider: affectationDegreeProvider,
          ),
          const SafeSpacer(
            height: 8,
          ),
          LabeledText(
            label: appLocalizations?.description ?? '',
            text: ref.watch(situationDescriptionProvider) ?? '',
          ),
          const SafeSpacer(
            height: 12,
          ),
          LabeledText(
            label: appLocalizations?.firstThought ?? '',
            text: ref.watch(situationFirstThoughtProvider) ?? '',
          ),
          const SafeSpacer(
            height: 12,
          ),
          LabeledText(
            label: appLocalizations?.behavior ?? '',
            text: ref.watch(situationBehaviorProvider) ?? '',
          ),
          const SafeSpacer(
            height: 12,
          ),
          Text(
            '${appLocalizations?.babyAlarmSigns}: ',
            style: theme.textTheme.bodyLarge?.copyWith(),
            textAlign: TextAlign.justify,
          ),
          const SafeSpacer(
            height: 8,
          ),
          const SelectedAlarmSignsBaby(),
          const SafeSpacer(
            height: 8,
          ),
          Text(
            '${appLocalizations?.motherAlarmSigns}: ',
            style: theme.textTheme.bodyLarge?.copyWith(),
            textAlign: TextAlign.justify,
          ),
          const SafeSpacer(
            height: 8,
          ),
          const SelectedAlarmSignsMother(),
          const SafeSpacer(
            height: 8,
          ),
          Text(
            '${appLocalizations?.relatedTopics}: ',
            style: theme.textTheme.bodyLarge?.copyWith(),
            textAlign: TextAlign.justify,
          ),
          const SafeSpacer(
            height: 8,
          ),
          const SelectedSubjects(),
          Text(
            '${appLocalizations?.feelings}: ',
            style: theme.textTheme.bodyLarge?.copyWith(),
            textAlign: TextAlign.justify,
          ),
          const SafeSpacer(
            height: 8,
          ),
          const SelectedFeelings(),
        ],
      ),
    );
  }
}
