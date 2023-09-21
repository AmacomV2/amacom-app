import 'package:flutter/material.dart';
import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

/// Generic back arrow button with customizable color and size
class BackArrowButton extends StatelessWidget {
  /// Widget constructor
  const BackArrowButton({
    super.key,
    this.size = 17,
    this.color,
    this.onTap,
  });

  /// Icons size
  final double size;

  /// Icon color
  final Color? color;

  /// Button callback
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? Navigation.goBack(),
      borderRadius: BorderRadius.circular(100),
      child: Container(
        width: 35,
        height: 35,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          // color: FigmaColors.primary_50,
          border: Border.all(
            color: FigmaColors.primary_200,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: color ?? FigmaColors.primary_300,
          size: size,
        ),
      ),
    );
  }
}

/// Generic next arrow button with customizable color and size
class NextArrowButton extends StatelessWidget {
  /// Widget constructor
  const NextArrowButton({
    super.key,
    this.size = 18,
    this.color,
    this.onTap,
  });

  /// Icons size
  final double size;

  /// Icon color
  final Color? color;

  /// Button callback
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        width: 38,
        height: 38,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 2),
        decoration: BoxDecoration(
          border: Border.all(
            color: FigmaColors.primary_200,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          color: color ?? FigmaColors.primary_300,
          size: size,
        ),
      ),
    );
  }
}

/// Generic back arrow button with customizable color and size
class CloseIconButton extends StatelessWidget {
  /// Widget constructor
  const CloseIconButton({
    super.key,
    this.size = 22,
    this.backgroundColor,
    this.color,
    this.onTap,
  });

  /// Icons size
  final double size;

  /// Icon color
  final Color? color;

  /// Background color
  final Color? backgroundColor;

  /// Button callback
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: FigmaColors.primary_200,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          Icons.close_rounded,
          color: color ?? FigmaColors.secondary_500,
          size: size,
        ),
      ),
    );
  }
}
