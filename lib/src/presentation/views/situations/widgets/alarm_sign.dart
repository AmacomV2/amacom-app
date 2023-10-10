import 'package:amacom_app/src/presentation/widgets/spacers.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/global_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
class AlarmSign extends StatelessWidget {
  ///
  const AlarmSign({
    super.key,
    required this.onTap,
  });

  final Function(bool) onTap;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> x = ValueNotifier(false);
    final responsive = GlobalLocator.responsiveDesign;
    final theme = Theme.of(context);
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(AppSizes.genericBorderRadius),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: responsive.maxWidthValue(AppSizes.bodyDefaultHPadding),
          vertical: responsive.maxHeightValue(16),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.genericBorderRadius),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                AppMessages.loremIpsum,
                maxLines: 2,
                style: theme.textTheme.bodyLarge,
              ),
            ),
            const HorizontalSpacer(),
            SizedBox(
              height: responsive.maxHeightValue(10),
              child: ValueListenableBuilder(
                valueListenable: x,
                builder: (BuildContext context, bool value, Widget? child) {
                  return CupertinoSwitch(
                    activeColor: theme.colorScheme.primary,
                    value: value,
                    onChanged: (value) {
                      x.value = value;
                      onTap.call(value);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
