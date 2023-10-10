import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/app_dialogs.dart';
import 'package:flutter/material.dart';

/// Custom rounded button
///
/// Button color and text can be changed
class GenericRoundedButton extends StatelessWidget {
  /// Widget constructor
  const GenericRoundedButton({
    super.key,
    required this.onTap,
    required this.text,
    this.color,
    this.textColor,
    this.border = false,
    this.adaptiveTextColor = true,
    this.padding,
    this.width,
    this.height,
    this.leading,
    this.borderColor,
    this.suffix,
  });

  /// Button's callback
  final VoidCallback onTap;

  /// Button background color
  final Color? color;

  /// Button background color
  final Color? borderColor;

  /// Button textColor
  final Color? textColor;

  /// In button should change button color based on background
  final bool adaptiveTextColor;

  /// If button shows a border or not
  final bool border;

  /// Button Text
  final String text;

  /// Button content padding
  final EdgeInsets? padding;

  /// Button's width
  final double? width;

  /// Button's width
  final double? height;

  /// Optional button leading
  final Widget? leading;

  /// Optional button leading
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.labelMedium;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.genericBorderRadius),
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color ?? FigmaColors.background,
            borderRadius: BorderRadius.circular(AppSizes.genericBorderRadius),
            border: border
                ? Border.all(
                    color: color ?? borderColor ?? FigmaColors.primary_200,
                    width: 0.5,
                    strokeAlign: 1,
                  )
                : null,
          ),
          padding: padding ?? AppSizes.genericButtonPadding,
          child: leading == null && suffix == null
              ? Text(
                  text,
                  style: textStyle?.copyWith(
                    color: adaptiveTextColor
                        ? FigmaColors.getFontColorForBackground(
                            color ?? FigmaColors.primary_50,
                          )
                        : textColor,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (suffix != null) suffix!,
                    if (suffix != null)
                      const HorizontalSpacer(
                        width: 8,
                      ),
                    Text(
                      text,
                      style: textStyle?.copyWith(
                        color: adaptiveTextColor
                            ? FigmaColors.getFontColorForBackground(
                                color ?? FigmaColors.primary_50,
                              )
                            : textColor,
                      ),
                    ),
                    if (leading != null)
                      const HorizontalSpacer(
                        width: 8,
                      ),
                    if (leading != null) leading!,
                  ],
                ),
        ),
      ),
    );
  }
}

/// Custom button
///
/// Button color and text can be changed
class CustomButtonWithState extends StatefulWidget {
  /// Widget constructor
  const CustomButtonWithState({
    super.key,
    required this.onTap,
    required this.text,
    this.color,
    this.textColor,
    this.borderColor,
    this.adaptiveTextColor = true,
    this.padding,
    this.border = false,
    this.width,
    this.enabled = true,
    this.svgPicture,
    this.margin,
  });

  /// Button's callback
  final Function onTap;

  /// Button background color
  final Color? color;

  /// Button background color
  final Color? borderColor;

  /// Button textColor
  final Color? textColor;

  /// In button should change button color based on background
  final bool adaptiveTextColor;

  /// If button shows a border or not
  final bool border;

  /// Button Text
  final String text;

  /// Button content padding
  final EdgeInsets? padding;

  /// Button content margin
  final EdgeInsets? margin;

  /// Button's width
  final double? width;

  /// Button's width
  final bool enabled;

  /// SvgPicture
  final dynamic svgPicture;

  @override
  State<CustomButtonWithState> createState() => _CustomButtonWithStateState();
}

class _CustomButtonWithStateState extends State<CustomButtonWithState> {
  /// Buttons color, by default primary

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.labelMedium;
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () async {
          if (widget.enabled && !loading) {
            setState(() {
              loading = true;
            });
            try {
              await widget.onTap();
            } catch (e) {
              AppDialogs.genericConfirmationDialog(title: e.toString());
            }
            setState(() {
              loading = false;
            });
          }
        },
        borderRadius: BorderRadius.circular(AppSizes.genericBorderRadius),
        child: Container(
          width: widget.width ?? double.infinity,
          decoration: BoxDecoration(
            color: widget.enabled
                ? (widget.color ?? theme.colorScheme.primary)
                : FigmaColors.secondary_200,
            borderRadius: BorderRadius.circular(AppSizes.genericBorderRadius),
            border: widget.border
                ? Border.all(
                    color: widget.borderColor ?? FigmaColors.primary_200,
                    width: 1,
                    strokeAlign: 1,
                  )
                : null,
          ),
          padding: widget.padding ?? AppSizes.genericButtonPadding,
          alignment: Alignment.center,
          child: loading
              ? SizedCustomProgressIndicator(
                  size: 19,
                  color: FigmaColors.getFontColorForBackground(
                    widget.color ?? theme.colorScheme.primary,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // if (svgPicture != null) Text('svgPicture'),
                    //validate if svgPicture doesn't exist

                    // (svgPicture != null &&
                    //         svgPicture?.iconFromSVG != null &&
                    //         svgPicture?.iconFromPNG != null)
                    //     ? svgPicture?.iconFromSVG ?? false
                    //     : svgPicture?.iconFromPNG ?? false
                    //         ? svgPicture?.iconFromPNG ?? false
                    //         : null,
                    // (svgPicture != null)
                    //     ? const SizedBox(
                    //         width: 10,
                    //       )
                    //     : const SizedBox(),
                    Text(
                      widget.text,
                      style: textStyle?.copyWith(
                        color: widget.adaptiveTextColor
                            ? FigmaColors.getFontColorForBackground(
                                widget.color ?? theme.colorScheme.primary,
                              )
                            : widget.textColor,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

/// Generic transparent button
class TransparentButton extends StatelessWidget {
  /// Widget constructor
  const TransparentButton({
    super.key,
    required this.height,
    required this.width,
    this.onTap,
  });

  /// Button width
  final double width;

  /// Button's height
  final double height;

  /// Button callback
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.zero,
        color: Colors.transparent,
        height: height,
        width: width,
      ),
    );
  }
}
