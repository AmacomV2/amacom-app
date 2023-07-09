import 'package:flutter/material.dart';
import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/presentation/widgets/scroll_column_expandable.dart';
import 'package:amacom_app/src/presentation/widgets/spacers.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

/// Page No2 on onBoarding screen
class OnBoardingPage2 extends StatelessWidget {
  /// Widget constructor
  const OnBoardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final responsive = ResponsiveDesign(context);
    return ScrollColumnExpandable(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      padding: EdgeInsets.zero,
      children: [
        const SafeSpacer(
          height: 60,
        ),
        Padding(
          padding: responsive.appHorizontalPadding,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'En Fur plus te ayudamos ',
                  style: textTheme.headlineMedium?.copyWith(
                    color: FigmaColors.primary_200,
                    fontSize: 31,
                  ),
                ),
                TextSpan(
                  text: 'a gestionar ',
                  style: textTheme.headlineMedium?.copyWith(
                    color: FigmaColors.primary_300,
                    fontSize: 31,
                  ),
                ),
                TextSpan(
                  text: 'lo más importante para ti y ',
                  style: textTheme.headlineMedium?.copyWith(
                    color: FigmaColors.primary_200,
                    fontSize: 31,
                  ),
                ),
                TextSpan(
                  text: 'tu mascota',
                  style: textTheme.headlineMedium?.copyWith(
                    color: FigmaColors.primary_300,
                    fontSize: 31,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SafeSpacer(
          height: 8,
        ),
        Image.asset(
          'assets/images/onboarding_phone.png',
          height: responsive.maxHeightValue(515),
        ),
      ],
    );
  }
}
