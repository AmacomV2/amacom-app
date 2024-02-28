import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/situations/situation_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/alarm_sign_card.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/generic_card.dart';
import 'package:amacom_app/src/presentation/views/subjects/widgets/sub_subject_card.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class SituationDescription extends ConsumerWidget {
  ///
  const SituationDescription({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final situationData = ref.watch(selectedSituationProvider);
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context);
    return ScrollColumnExpandable(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabeledText(
          label: appLocalizations?.firstThought ?? '',
          text: situationData?.firstThought ?? '',
        ),
        LabeledText(
          label: appLocalizations?.behavior ?? '',
          text: situationData?.behavior ?? '',
        ),
        const SafeSpacer(
          height: 8,
        ),
        Text(
          '${appLocalizations?.affectationDegree}',
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.justify,
        ),
        const SafeSpacer(
          height: 8,
        ),
        DegreeSelector(
          stateProvider: StateProvider<int>(
            (ref) => situationData?.affectationDegree ?? 0,
          ),
          enabled: false,
        ),
        ref.watch(selectedSituationAllDataProvider).when(
              data: (data) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SafeSpacer(
                      height: 10,
                    ),
                    Text(
                      '${appLocalizations?.selectedSubject}',
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.justify,
                    ),
                    const SafeSpacer(
                      height: 2,
                    ),
                    SubSubjectCard(
                      data: data?.subjectData,
                      showCheckBox: false,
                    ),
                    const SafeSpacer(
                      height: 6,
                    ),
                    Text(
                      '${appLocalizations?.feelings}',
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.justify,
                    ),
                    const SafeSpacer(
                      height: 2,
                    ),
                    Wrap(
                      runAlignment: WrapAlignment.spaceBetween,
                      alignment: WrapAlignment.spaceBetween,
                      spacing: 14,
                      children: [
                        ...(data?.feelingsData ?? []).map(
                          (e) => FeelingCard(
                            text: e.name,
                            image: e.imageUrl,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    const SafeSpacer(
                      height: 6,
                    ),
                    Text(
                      '${appLocalizations?.babyAlarmSigns}',
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.justify,
                    ),
                    const SafeSpacer(
                      height: 2,
                    ),
                    ...(data?.alarmSignsData ?? [])
                        .where((element) => element.type == 'BABY')
                        .map(
                          (e) => AlarmSignCard(
                            data: e,
                            isSelected: false,
                            showCheckBox: false,
                            onTap: () {},
                          ),
                        ),
                    const SafeSpacer(
                      height: 6,
                    ),
                    Text(
                      '${appLocalizations?.motherAlarmSigns}',
                      style: theme.textTheme.bodyLarge,
                      textAlign: TextAlign.justify,
                    ),
                    const SafeSpacer(
                      height: 2,
                    ),
                    ...(data?.alarmSignsData ?? [])
                        .where((element) => element.type == 'MOTHER')
                        .map(
                          (e) => AlarmSignCard(
                            data: e,
                            isSelected: false,
                            showCheckBox: false,
                            onTap: () {},
                          ),
                        ),
                    const BottomSpacer(),
                  ],
                );
              },
              error: (error, stackTrace) => Container(),
              loading: () => const SizedCustomProgressIndicator(),
            ),
      ],
    );
  }
}
