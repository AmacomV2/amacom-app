import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/durations.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Registration complete screen
///
/// Screen shown on user registration complete, shows a message and
/// redirect to pet registration screen
///
class RegistrationCompleteScreen extends StatelessWidget {
  /// Constructor
  const RegistrationCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final responsive = GlobalLocator.responsiveDesign;
    AppDurations.pageNavigationDelay(
      action: () {
        Navigation.goTo(
          CustomAppRouter.petRegistration,
          removeUntil: true,
        );
      },
    );
    return CustomScaffold(
      backgroundColor: theme.colorScheme.primary,
      body: GestureDetector(
        onTap: () {
          Navigation.goTo(
            CustomAppRouter.petRegistration,
            removeUntil: true,
          );
        },
        child: ScrollColumnExpandable(
          mainAxisAlignment: MainAxisAlignment.center,
          padding: responsive.horizontalPadding(4),
          children: [
            const HeaderSpacer(
              height: 44,
            ),
            SvgPicture.asset(
              'assets/logos/logo_white.svg',
              semanticsLabel: 'AmacomApp Logo',
              height: responsive.maxHeightValue(53.25),
            ),
            const SafeSpacer(
              height: 86,
            ),
            Text(
              '¡Todo listo! Ahora cuéntanos un poco más sobre tu mascota',
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: FigmaColors.secondary_50,
              ),
            ),
            const SafeSpacer(
              height: 16,
            ),
            Image.asset(
              'assets/images/fur_dog.png',
              width: responsive.maxWidthValue(337),
              height: responsive.maxHeightValue(580),
            ),
          ],
        ),
      ),
    );
  }
}
