import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/presentation/state/subjects/subject_selection.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/selected_subjects.dart';
import 'package:amacom_app/src/presentation/views/subjects/widgets/subjects_body.dart';
import 'package:amacom_app/src/presentation/widgets/buttons.dart';
import 'package:amacom_app/src/presentation/widgets/spacers.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class SelectSubject extends ConsumerWidget {
  ///
  const SelectSubject({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final responsive = GlobalLocator.responsiveDesign;
    final appLocalizations = AppLocalizations.of(context);
    final selected = ref.watch(selectedSubject);
    return Column(
      children: [
        Text(
          '${appLocalizations?.relatedTopicsMessage}',
          style: theme.textTheme.bodyLarge?.copyWith(),
          textAlign: TextAlign.justify,
        ),
        const SafeSpacer(
          height: 8,
        ),
        const SelectedSubjects(),
        const SafeSpacer(
          height: 10,
        ),
        if (selected == null)
          GenericRoundedButton(
            onTap: () async {
              await AppDialogs.genericBottomSheet(
                widget: const SubjectsBody(),
              );
            },
            border: true,
            padding: EdgeInsets.symmetric(
              vertical: responsive.maxHeightValue(14),
              horizontal: responsive.maxWidthValue(12),
            ),
            textColor: FigmaColors.secondary_500,
            borderColor: FigmaColors.secondary_300,
            adaptiveTextColor: false,
            text: appLocalizations?.select ?? '',
            suffix: const Icon(
              Icons.add_circle_outline_rounded,
              size: 20,
            ),
          ),
      ],
    );
  }
}
