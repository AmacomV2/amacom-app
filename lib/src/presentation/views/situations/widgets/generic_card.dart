import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/utils/constant/app_constants.dart';
import 'package:flutter/material.dart';

///
class GenericDismissibleCard extends StatelessWidget {
  ///
  const GenericDismissibleCard({
    super.key,
    required this.text,
    required this.onTap,
  });

  ///
  final String text;

  ///
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (_) {
        onTap.call();
      },
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          margin: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.cardRadius),
            side: const BorderSide(
              color: FigmaColors.primary_100,
              width: 0.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              8,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    maxLines: 3,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                Icon(
                  Icons.close_rounded,
                  size: 19,
                  color: theme.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
