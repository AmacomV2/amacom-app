import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/situations/situation_provider.dart';
import 'package:amacom_app/src/presentation/widgets/labeled_text.dart';
import 'package:amacom_app/src/presentation/widgets/scroll_column_expandable.dart';
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
      children: [
        LabeledText(
          label: appLocalizations?.firstThought ?? '',
          text: situationData?.firstThought ?? '',
        ),
        LabeledText(
          label: appLocalizations?.behavior ?? '',
          text: situationData?.behavior ?? '',
        ),
      ],
    );
  }
}
