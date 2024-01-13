import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';

/// Empty list widget
class EmptyListWidget extends StatelessWidget {
  ///
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = GlobalLocator.responsiveDesign;
    final textTheme = Theme.of(context).textTheme;
    final appLocalizations = AppLocalizations.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SafeSpacer(
          height: 16,
        ),
        Image.asset(
          'assets/images/not-found.png',
          width: responsive.maxWidthValue(70),
          cacheWidth: responsive.maxWidthValue(160).toInt(),
        ),
        const SafeSpacer(
          height: 16,
        ),
        Text(
          appLocalizations?.noElementsFound ?? '',
          style: textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SafeSpacer(
          height: 24,
        ),
      ],
    );
  }
}
