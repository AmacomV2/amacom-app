import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/presentation/state/situations/new_situation_provider.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/global_locator.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

///
class NewSituationStepper extends ConsumerWidget {
  ///
  const NewSituationStepper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = GlobalLocator.responsiveDesign;
    final activeStep = ref.watch(newSituationIndexProvider);
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final appLocalizations = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: EasyStepper(
        activeStep: activeStep,
        stepShape: StepShape.circle,
        enableStepTapping: false,
        borderThickness: 2,
        padding: EdgeInsets.symmetric(
          horizontal: responsive.maxWidthValue(AppSizes.bodyDefaultHPadding),
          vertical: responsive.maxHeightValue(20),
        ),
        stepRadius: responsive.maxWidthValue(18),
        finishedStepBorderColor: FigmaColors.primary_200,
        finishedStepTextColor: FigmaColors.primary_200,
        finishedStepBackgroundColor: FigmaColors.primary_200,
        activeStepIconColor: FigmaColors.primary_200,
        showLoadingAnimation: false,
        internalPadding: responsive.maxWidthValue(80),
        steps: [
          EasyStep(
            customStep: Opacity(
              opacity: activeStep >= 0 ? 1 : 0.3,
              child: FaIcon(
                activeStep > 0
                    ? FontAwesomeIcons.check
                    : FontAwesomeIcons.personBooth,
                size: activeStep == 0 ? 16 : 15,
                color: activeStep == 0 ? colors.primary : Colors.white,
              ),
            ),
            customTitle: Text(
              '${appLocalizations?.situationDescriptionStepper}',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: activeStep == 0 ? 16 : 15,
                color: activeStep == 0 ? colors.primary : null,
              ),
            ),
          ),
          EasyStep(
            customStep: Opacity(
              opacity: activeStep >= 0 ? 1 : 0.3,
              child: FaIcon(
                activeStep > 1
                    ? FontAwesomeIcons.check
                    : FontAwesomeIcons.faceMeh,
                size: activeStep == 1 ? 16 : 15,
                color: activeStep == 1
                    ? colors.primary
                    : activeStep < 1
                        ? colors.secondary.withOpacity(0.5)
                        : Colors.white,
              ),
            ),
            customTitle: Text(
              '${appLocalizations?.howDoYouFeelStepper}',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: activeStep == 1 ? 16 : 15,
                color: activeStep == 1 ? colors.primary : null,
              ),
            ),
          ),
          EasyStep(
            customStep: Opacity(
              opacity: activeStep >= 0 ? 1 : 0.3,
              child: FaIcon(
                activeStep > 2
                    ? FontAwesomeIcons.check
                    : FontAwesomeIcons.personCircleExclamation,
                size: activeStep == 2 ? 16 : 15,
                color: activeStep == 2
                    ? colors.primary
                    : activeStep < 2
                        ? colors.secondary.withOpacity(0.5)
                        : Colors.white,
              ),
            ),
            customTitle: Text(
              '${appLocalizations?.alarmSignsStepper}',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: activeStep == 2 ? 16 : 15,
                color: activeStep == 2 ? colors.primary : null,
              ),
            ),
          ),
          EasyStep(
            customStep: Opacity(
              opacity: activeStep >= 0 ? 1 : 0.3,
              child: FaIcon(
                activeStep > 3
                    ? FontAwesomeIcons.check
                    : FontAwesomeIcons.babyCarriage,
                size: activeStep == 3 ? 16 : 15,
                color: activeStep == 3
                    ? colors.primary
                    : activeStep < 3
                        ? colors.secondary.withOpacity(0.5)
                        : Colors.white,
              ),
            ),
            customTitle: Text(
              '${appLocalizations?.alarmSignsStepper}',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: activeStep == 3 ? 16 : 15,
                color: activeStep == 3 ? colors.primary : null,
              ),
            ),
          ),
          EasyStep(
            customStep: Opacity(
              opacity: activeStep >= 0 ? 1 : 0.3,
              child: FaIcon(
                activeStep > 4
                    ? FontAwesomeIcons.check
                    : FontAwesomeIcons.paperPlane,
                size: activeStep == 4 ? 16 : 15,
                color: activeStep == 4
                    ? colors.primary
                    : activeStep < 4
                        ? colors.secondary.withOpacity(0.5)
                        : Colors.white,
              ),
            ),
            customTitle: Text(
              '${appLocalizations?.reportYourSituationStepper}',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontSize: activeStep == 4 ? 16 : 15,
                color: activeStep == 4 ? colors.primary : null,
              ),
            ),
          ),
        ],
        onStepReached: (index) => ref
            .read(newSituationIndexProvider.notifier)
            .update((state) => index),
      ),
    );
  }
}
