import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/situations/situation_provider.dart';
import 'package:amacom_app/src/presentation/views/subjects/widgets/sub_subject_card.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class SituationDetailPart1 extends ConsumerWidget {
  ///
  const SituationDetailPart1({super.key});

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
        ref.watch(selectedSituationAllDataProvider).when(
              data: (data) {
                return SubSubjectCard(
                  data: data?.subjectData,
                  showCheckBox: false,
                );
              },
              error: (error, stackTrace) => Container(),
              loading: () => const SizedCustomProgressIndicator(),
            ),
      ],
    );
  }
}
