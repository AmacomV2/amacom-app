import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

/// Given a [DateTime] shows it as text in a cool looking way
class CoolDateToText extends StatelessWidget {
  ///
  const CoolDateToText({super.key, required this.date});

  ///
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '${date.day} ',
            style: textTheme.headlineMedium?.copyWith(
              color: theme.primaryColor,
              fontSize: 30,
            ),
          ),
          TextSpan(
            text: date.monthText(
              appLocalizations?.localeName ?? '',
            ),
            style: textTheme.bodyLarge?.copyWith(
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: ', ${date.year}',
            style: textTheme.bodyLarge?.copyWith(
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: ', ${date.timeToText()}',
            style: textTheme.bodyLarge?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
