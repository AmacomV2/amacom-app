import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

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
  });

  /// AppBar actions
  final Widget? action;

  /// Callback on back
  final VoidCallback? onBack;

  /// AppBar tittle
  final String? title;

  /// Center title on appBar
  final bool centerTitle;

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
          BackArrowButton(
            size: 20,
            onTap: onBack ?? () => Navigation.goBack(),
          ),
          if (!centerTitle)
            const HorizontalSpacer(
              width: 4,
            ),
          if (title != null)
            Text(
              title!,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          if (action != null) action!,
          if (centerTitle)
            const SizedBox(
              width: 28,
            )
        ],
      ),
      if (includeBottomSpacer) const SafeSpacer(),
    ];
    if (padding) return ColumnWithPadding(children: children);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
