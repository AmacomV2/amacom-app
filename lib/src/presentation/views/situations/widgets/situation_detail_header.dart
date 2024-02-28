import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/presentation/state/situations/situation_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/delete_situation.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/app_constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

///
class SituationDetailHeader extends ConsumerWidget {
  ///
  const SituationDetailHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final situationData = ref.watch(selectedSituationProvider);
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context);
    return ColumnWithPadding(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar2(
          titleIcon:
              CoolDateToText(date: situationData?.createdAt ?? DateTime.now()),
          subtitle: situationData?.description,
          action: ref.watch(selectedSituationAllDataProvider).when(
                data: (data) {
                  if (data?.currentDiagnosis == null) {
                    return const DeleteSituation();
                  }
                  return null;
                },
                error: (error, stackTrace) => const SizedBox(),
                loading: () => const SizedCustomProgressIndicator(),
              ),
          includeBottomSpacer: false,
          onBack: () {
            ref.invalidate(selectedSituationProvider);
            Navigation.goBack();
          },
        ),
        const SafeSpacer(
          height: 10,
        ),
        Center(
          child: MaterialSegmentedControl(
            children: {
              0: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Text(
                  appLocalizations?.description ?? 'Description',
                ),
              ),
              1: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Text(
                  appLocalizations?.diagnosis ?? 'Diagnosis',
                ),
              ),
            },
            selectionIndex: ref.watch(selectedSituationDataIndexProvider),
            borderColor: Colors.grey,
            selectedColor: theme.primaryColor,
            unselectedColor: theme.scaffoldBackgroundColor,
            selectedTextStyle: theme.textTheme.bodyLarge?.copyWith(
              color: FigmaColors.getFontColorForBackground(theme.primaryColor),
            ),
            unselectedTextStyle: theme.textTheme.bodyLarge?.copyWith(
              color: FigmaColors.getFontColorForBackground(
                theme.scaffoldBackgroundColor,
                darkColor: FigmaColors.secondary_500,
              ),
            ),
            borderWidth: 0.5,
            borderRadius: AppConstants.cardRadius,
            horizontalPadding: EdgeInsets.zero,
            onSegmentTapped: (index) {
              ref
                  .read(selectedSituationDataIndexProvider.notifier)
                  .update((state) => index);
            },
          ),
        ),
      ],
    );
  }
}
