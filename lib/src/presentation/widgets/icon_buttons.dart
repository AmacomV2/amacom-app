import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';

/// Generic back arrow button with customizable color and size
class BackArrowButton extends StatelessWidget {
  /// Widget constructor
  const BackArrowButton({
    super.key,
    this.size = 15,
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
        width: 28,
        height: 28,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(4),
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

/// Generic add button with customizable color and size
class AddIconButton extends StatelessWidget {
  /// Widget constructor
  const AddIconButton({
    super.key,
    this.size = 24,
    this.borderColor,
    this.color,
    this.onTap,
  });

  /// Icons size
  final double size;

  /// Icon color
  final Color? color;

  /// Background color
  final Color? borderColor;

  /// Button callback
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        child: Container(
          padding: const EdgeInsets.all(2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor ?? FigmaColors.primary_200,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            Icons.add,
            color: color ?? FigmaColors.primary_200,
            size: size,
          ),
        ),
      ),
    );
  }
}

/// Generic Refresh button with customizable color and size
class RefreshIconButton extends StatelessWidget {
  /// Widget constructor
  const RefreshIconButton({
    super.key,
    this.size = 24,
    this.borderColor,
    this.color,
    this.onTap,
  });

  /// Icons size
  final double size;

  /// Icon color
  final Color? color;

  /// Background color
  final Color? borderColor;

  /// Button callback
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        child: Container(
          padding: const EdgeInsets.all(2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor ?? FigmaColors.primary_200,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            Icons.refresh_rounded,
            color: color ?? FigmaColors.primary_200,
            size: size,
          ),
        ),
      ),
    );
  }
}

/// Generic Custom button with customizable color and size
class CustomIconButton extends StatelessWidget {
  /// Widget constructor
  const CustomIconButton({
    super.key,
    this.size = 30,
    this.borderColor,
    this.color,
    this.onTap,
    required this.icon,
  });

  /// Icons size
  final double size;

  /// Icon color
  final Color? color;

  /// Background color
  final Color? borderColor;

  /// Button callback
  final VoidCallback? onTap;

  ///
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor ?? FigmaColors.primary_200,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.all(3),
          child: Icon(
            icon,
            color: color ?? FigmaColors.primary_200,
            size: size,
          ),
        ),
      ),
    );
  }
}
