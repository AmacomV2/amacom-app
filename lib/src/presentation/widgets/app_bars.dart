import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// AppBar used commonly on app screens
class CustomAppBar extends StatelessWidget {
  /// Constructor
  const CustomAppBar({
    super.key,
    this.action,
    this.onBack,
    this.title,
    this.centerTitle = false,
    this.padding = false,
    this.includeBottomSpacer = true,
    this.titleIcon,
    this.prefix,
    this.includeBackArrow = true,
  });

  /// AppBar actions
  final Widget? action;

  /// AppBar actions
  final Widget? titleIcon;

  /// AppBar actions
  final Widget? prefix;

  /// Callback on back
  final VoidCallback? onBack;

  /// AppBar tittle
  final String? title;

  /// Center title on appBar
  final bool centerTitle;

  /// Include back arrow or not
  final bool includeBackArrow;

  /// include bottom SafeSpacer
  final bool includeBottomSpacer;

  /// To add or not app horizontal padding
  final bool padding;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark,
    );
    final theme = Theme.of(context);
    final children = [
      const HeaderSpacer(),
      Row(
        mainAxisAlignment: centerTitle
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        children: [
          prefix ??
              (includeBackArrow
                  ? CustomIconButton(
                      size: 24,
                      icon: Icons.arrow_back_rounded,
                      onTap: onBack ?? () => Navigation.goBack(),
                    )
                  : const SizedBox(
                      width: 28,
                    )),
          if (!centerTitle)
            const HorizontalSpacer(
              width: 4,
            ),
          Row(
            children: [
              if (titleIcon != null) titleIcon!,
              if (titleIcon != null)
                const HorizontalSpacer(
                  width: 8,
                ),
              if (title != null)
                Text(
                  title!.toUpperCase(),
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontSize: 26,
                  ),
                ),
            ],
          ),
          if (action != null) action!,
          if (centerTitle && action == null)
            const SizedBox(
              width: 28,
            ),
        ],
      ),
      if (includeBottomSpacer)
        const SafeSpacer(
          height: 16,
        ),
    ];
    if (padding) return ColumnWithPadding(children: children);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
