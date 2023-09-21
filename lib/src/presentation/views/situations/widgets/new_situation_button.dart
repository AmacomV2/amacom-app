import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';

/// New situation form button
class NewSituationButton extends StatelessWidget {
  ///
  const NewSituationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = GlobalLocator.responsiveDesign;
    return CustomButtonWithState(
      onTap: () {},
      text: 'Siguiente',
      margin: responsive.appHorizontalPadding.copyWith(
        top: responsive.maxHeightValue(16),
      ),
    );
  }
}
