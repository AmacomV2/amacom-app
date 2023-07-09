import 'package:flutter/material.dart';
import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/presentation/widgets/column_with_padding.dart';
import 'package:amacom_app/src/presentation/widgets/scroll_column_expandable.dart';
import 'package:amacom_app/src/presentation/widgets/spacers.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

/// Page No3 on onBoarding screen
class OnBoardingPage3 extends StatelessWidget {
  /// Widget constructor
  const OnBoardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final responsive = ResponsiveDesign(context);
    return ScrollColumnExpandable(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        ColumnWithPadding(
          children: [
            const SafeSpacer(
              height: 60,
            ),
            Text(
              'Todo lo que necesitas en una sola app',
              style: textTheme.headlineMedium?.copyWith(
                color: FigmaColors.primary_300,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            const Spacer(),
            Image.asset(
              'assets/images/onboarding_phone2.png',
              width: responsive.maxWidthValue(372),
            ),
          ],
        )
      ],
    );
  }
}
