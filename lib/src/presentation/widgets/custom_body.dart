import 'package:flutter/material.dart';
import 'package:amacom_app/src/utils/constant/sizes.dart';

/// Custom Body widget
///
/// Custom container with height and width,
/// top borders are rounded
class CustomBody extends StatelessWidget {
  ///
  const CustomBody({
    super.key,
    this.backgroundColor = Colors.white,
    this.width = double.infinity,
    this.height = double.infinity,
    required this.child,
    this.padding,
  });

  /// Background color to apply
  final Color backgroundColor;

  /// Widget width
  final double width;

  /// Widget height
  final double height;

  /// Widget child
  final Widget child;

  /// Widget optional padding
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSizes.bodyContainersRadius),
          topRight: Radius.circular(AppSizes.bodyContainersRadius),
        ),
      ),
      child: child,
    );
  }
}
