import 'package:amacom_app/src/utils/constant/app_messages.dart';
import 'package:flutter/material.dart';
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
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final responsive = ResponsiveDesign(context);
    return ScrollColumnExpandable(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      padding: responsive.horizontalPadding(40),
      children: [
        const SafeSpacer(
          height: 50,
        ),
        Text(
          'Ask for help',
          style: textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
        const SafeSpacer(
          height: 52,
        ),
        SizedBox(
          height: responsive.maxHeightValue(320),
          width: double.infinity,
          child: Image.asset('assets/images/doctor.png'),
        ),
        const SafeSpacer(
          height: 16,
        ),
        ColumnWithPadding(
          padding: responsive.horizontalPadding(10),
          children: [
            const SafeSpacer(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppMessages.loremIpsum,
                style: textTheme.bodyLarge,
                textAlign: TextAlign.justify,
                maxLines: 4,

              ),
            ),
          ],
        ),
      ],
    );
  }
}
