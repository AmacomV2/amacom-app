import 'package:flutter/material.dart';

///
class CustomCheckBox extends StatelessWidget {
  ///
  const CustomCheckBox({
    super.key,
    required this.size,
    required this.selected,
    this.color,
  });

  ///
  final double size;

  ///
  final bool selected;

  ///
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colorsScheme = Theme.of(context).colorScheme;
    return Container(
      height: size,
      width: size,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        border: Border.all(
          color: color ?? colorsScheme.primary,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          color: selected ? (color ?? colorsScheme.primary) : null,
        ),
      ),
    );
  }
}
