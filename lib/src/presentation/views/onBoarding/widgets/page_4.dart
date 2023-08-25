import 'package:flutter/material.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

/// Page No4 on onBoarding screen
class OnBoardingPage4 extends StatelessWidget {
  /// Widget constructor
  const OnBoardingPage4({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorsScheme = Theme.of(context).colorScheme;
    final responsive = ResponsiveDesign(context);
    return ScrollColumnExpandable(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      padding: responsive.horizontalPadding(18),
      children: [
        const SafeSpacer(
          height: 66,
        ),
        Text(
          '¿Empezamos?',
          style: textTheme.headlineMedium?.copyWith(),
          textAlign: TextAlign.center,
        ),
        const SafeSpacer(
          height: 10,
        ),
        Text(
          'No te llevará más de 3 minutos registrarte',
          style: textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const SafeSpacer(
          height: 55,
        ),
        Image.asset(
          'assets/images/pregnancy.png',
          height: responsive.maxHeightValue(418),
        ),
        const SafeSpacer(
          height: 30,
        ),
        GenericRoundedButton(
          width: responsive.maxWidthValue(200),
          onTap: () {
            Navigation.goTo(
              Routes.registration,
              replacement: true,
            );
          },
          text: 'Claro que sí',
          color: colorsScheme.primary,
          padding: AppSizes.genericButtonPadding.copyWith(
            left: responsive.maxWidthValue(45),
            right: responsive.maxWidthValue(45),
          ),
        )
      ],
    );
  }
}
