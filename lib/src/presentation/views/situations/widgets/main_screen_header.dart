import 'package:amacom_app/src/utils/utils/global_locator.dart';
import 'package:flutter/material.dart';

///
class SituationsHeader extends StatelessWidget {
  ///
  const SituationsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final responsive = GlobalLocator.responsiveDesign;
    return Padding(
      padding: responsive.appHorizontalPadding,
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Reporte de situaciones y novedades',
              style: theme.textTheme.headlineSmall,
            ),
          )
        ],
      ),
    );
  }
}
