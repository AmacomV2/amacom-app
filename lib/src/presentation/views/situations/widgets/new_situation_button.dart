import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/data/repositories/situation_repository.dart';
import 'package:amacom_app/src/domain/dtos/new_situation_dto.dart';
import 'package:amacom_app/src/presentation/state/alarm_signs/alarm_signs_provider.dart';
import 'package:amacom_app/src/presentation/state/situations/new_situation_provider.dart';
import 'package:amacom_app/src/presentation/state/situations/situations_list_provider.dart';
import 'package:amacom_app/src/presentation/state/subjects/subject_selection.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// New situation form button
class NewSituationButton extends ConsumerWidget {
  ///
  const NewSituationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(newSituationIndexProvider);
    final responsive = GlobalLocator.responsiveDesign;
    final appLocalizations = AppLocalizations.of(context);
    return CustomButtonWithState(
      text: currentIndex != 3
          ? '${appLocalizations?.next}'
          : '${appLocalizations?.send}',
      margin: responsive.appHorizontalPadding.copyWith(
        top: responsive.maxHeightValue(16),
      ),
      onTap: () async {
        switch (currentIndex) {
          case 0:
            if (_validateForm1(ref, appLocalizations)) {
              ref
                  .read(newSituationIndexProvider.notifier)
                  .update((state) => state + 1);
            }
            break;
          case 1:
            if (_validateForm2(ref, appLocalizations)) {
              ref
                  .read(newSituationIndexProvider.notifier)
                  .update((state) => state + 1);
            }
            break;
          case 2:
            if (_validateForm3(ref, appLocalizations)) {
              ref
                  .read(newSituationIndexProvider.notifier)
                  .update((state) => state + 1);
            }
            break;
          case 3:
            if (_validateForm4(ref, appLocalizations)) {
              ref
                  .read(newSituationIndexProvider.notifier)
                  .update((state) => state + 1);
            }
            break;
          case 4:
            final situationDTO = NewSituationDTO(
              firstThought: ref.read(situationFirstThoughtProvider) ?? '',
              description: ref.read(situationDescriptionProvider) ?? '',
              behavior: ref.read(situationBehaviorProvider) ?? '',
              affectationDegree: ref.read(affectationDegreeProvider)!,
              subject: ref.read(selectedSubject)!,
              feelings:
                  ref.read(situationFeelingsProvider).map((e) => e.id).toList(),
              babyAlarmSigns: ref
                  .read(babySituationAlarmSignsProvider)
                  .map((e) => e.id)
                  .toList(),
              motherAlarmSigns: ref
                  .read(motherSituationAlarmSignsProvider)
                  .map((e) => e.id)
                  .toList(),
            );
            try {
              await ref
                  .read(situationsRepository)
                  .create(situation: situationDTO);
              AppDialogs.showCustomSnackBar(
                '${appLocalizations?.successOnCreating} ${appLocalizations?.newSituation.toLowerCase()}.',
                icon: Icons.check_circle_rounded,
              );

              /// Reload situations list
              ref.read(situationsPageProvider.notifier).update((state) => 0);
              ref.invalidate(situationsProvider);
              _disposeProviders(ref);
              Navigation.goBack();
            } catch (e) {
              AppDialogs.showCustomSnackBar(e.toString());
            }
            break;
          default:
        }
      },
    );
  }

  bool _validateForm1(WidgetRef ref, AppLocalizations? appLocalizations) {
    if (ref.read(newSituationForm1Key).currentState?.validate() == true) {
      if (ref.read(affectationDegreeProvider) != null) {
        if (ref.read(selectedSubject) != null) {
          return true;
        } else {
          AppDialogs.showCustomSnackBar(
            '${appLocalizations?.youMustChooseAtLeastOne} ${appLocalizations?.relatedTopic.toLowerCase()}.',
            color: FigmaColors.danger_700,
            icon: Icons.warning_rounded,
          );
        }
      } else {
        AppDialogs.showCustomSnackBar(
          '${appLocalizations?.youMustChoose} ${appLocalizations?.affectationDegree.toLowerCase()}.',
          color: FigmaColors.danger_700,
          icon: Icons.warning_rounded,
        );
      }
    }
    return false;
  }

  void _disposeProviders(WidgetRef ref) {
    ref.invalidate(situationDescriptionProvider);
    ref.invalidate(situationFirstThoughtProvider);
    ref.invalidate(situationBehaviorProvider);
    ref.invalidate(situationFeelingsProvider);
    ref.invalidate(selectedSubject);
    ref.invalidate(babySituationAlarmSignsProvider);
    ref.invalidate(motherSituationAlarmSignsProvider);
    ref.invalidate(affectationDegreeProvider);
    ref.invalidate(newSituationIndexProvider);
  }

  bool _validateForm2(WidgetRef ref, AppLocalizations? appLocalizations) {
    if (ref.read(newSituationForm2Key).currentState?.validate() == true) {
      if (ref.read(situationFeelingsProvider).isNotEmpty) {
        return true;
      } else {
        AppDialogs.showCustomSnackBar(
          '${appLocalizations?.youMustChooseAtLeastOne} ${appLocalizations?.feeling.toLowerCase()}.',
          color: FigmaColors.danger_700,
          icon: Icons.warning_rounded,
        );
      }
    }
    return false;
  }

  bool _validateForm3(WidgetRef ref, AppLocalizations? appLocalizations) {
    ref.invalidate(alarmSignProvider);
    if (ref.read(motherSituationAlarmSignsProvider).isNotEmpty) {
      return true;
    } else {
      AppDialogs.showCustomSnackBar(
        '${appLocalizations?.youMustChooseAtLeastOne} ${appLocalizations?.motherAlarmSign.toLowerCase()}.',
        color: FigmaColors.danger_700,
        icon: Icons.warning_rounded,
      );
    }
    return false;
  }

  bool _validateForm4(WidgetRef ref, AppLocalizations? appLocalizations) {
    ref.invalidate(alarmSignProvider);
    if (ref.read(babySituationAlarmSignsProvider).isNotEmpty) {
      return true;
    } else {
      AppDialogs.showCustomSnackBar(
        '${appLocalizations?.youMustChooseAtLeastOne} ${appLocalizations?.motherAlarmSign.toLowerCase()}.',
        color: FigmaColors.danger_700,
        icon: Icons.warning_rounded,
      );
    }
    return false;
  }
}
