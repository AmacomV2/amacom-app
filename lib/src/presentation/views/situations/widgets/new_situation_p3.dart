import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';

///
class NewSituationPart3 extends StatelessWidget {
  ///
  const NewSituationPart3({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final responsive = GlobalLocator.responsiveDesign;
    return SingleChildScrollView(
      child: ColumnWithPadding(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selecciona los signos de alarma que identificas en el bebe ',
            style: theme.textTheme.bodyLarge?.copyWith(),
            textAlign: TextAlign.justify,
          ),
          const SafeSpacer(
            height: 8,
          ),
          GenericRoundedButton(
            onTap: () {},
            border: true,
            padding: EdgeInsets.symmetric(
              vertical: responsive.maxHeightValue(14),
              horizontal: responsive.maxWidthValue(12),
            ),
            textColor: FigmaColors.secondary_500,
            borderColor: FigmaColors.secondary_300,
            adaptiveTextColor: false,
            text: 'Seleccionar',
            suffix: const Icon(
              Icons.add_circle_outline_rounded,
              size: 20,
            ),
          ),
          const SafeSpacer(),
          Text(
            'Selecciona los signos de alarma que identificas en la madre ',
            style: theme.textTheme.bodyLarge?.copyWith(),
            textAlign: TextAlign.justify,
          ),
          const SafeSpacer(
            height: 8,
          ),
          GenericRoundedButton(
            onTap: () {},
            border: true,
            padding: EdgeInsets.symmetric(
              vertical: responsive.maxHeightValue(14),
              horizontal: responsive.maxWidthValue(12),
            ),
            textColor: FigmaColors.secondary_500,
            borderColor: FigmaColors.secondary_300,
            adaptiveTextColor: false,
            text: 'Seleccionar',
            suffix: const Icon(
              Icons.add_circle_outline_rounded,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
