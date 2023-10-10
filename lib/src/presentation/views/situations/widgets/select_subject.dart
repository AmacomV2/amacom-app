import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/presentation/widgets/buttons.dart';
import 'package:amacom_app/src/presentation/widgets/spacers.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';

///
class SelectSubject extends StatelessWidget {
  ///
  const SelectSubject({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final responsive = GlobalLocator.responsiveDesign;

    return Column(
      children: [
        Text(
          'Escoge un tema con el que asocies tu situación ',
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
    );
  }
}
