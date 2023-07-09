import 'package:flutter/material.dart';
import 'package:amacom_app/src/presentation/views/petRegistration/widgets/custom_painter.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

/// Specie selection card
///
/// Uses a custom painter to perform its weird form
class SpecieSelectionCard extends StatelessWidget {
  /// Constructor
  const SpecieSelectionCard({
    super.key,
    required this.onTap,
    required this.imagePath,
    this.borderColor,
    this.backgroundColor,
    required this.selected,
    required this.name,
  });

  /// Callback function
  final VoidCallback onTap;

  /// Network image image path
  final String imagePath;

  /// Network image image path
  final String name;

  /// Optional border color
  final Color? borderColor;

  /// Optional item background color
  final Color? backgroundColor;

  /// To show item as selected
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final responsiveD = GlobalLocator.responsiveDesign;
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomPaint(
            size: Size(
              responsiveD.maxWidthValue(181),
              responsiveD.maxHeightValue(148),
            ),
            painter: WeirdShapePainter(
              borderColor: borderColor ?? theme.colorScheme.primary,
              borderWidth: selected ? 3 : 0.2,
            ),
          ),
          Text(
            name,
            style: theme.textTheme.headlineSmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
