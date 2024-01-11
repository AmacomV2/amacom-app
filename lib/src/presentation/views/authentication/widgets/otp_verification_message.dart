import 'package:amacom_app/src/config/settings.dart';
import 'package:flutter/material.dart';

/// Widget to show OTP verification message on OTP verification screen
class OTPVerificationMessage extends StatelessWidget {
  /// Widget constructor
  const OTPVerificationMessage({
    super.key,
    this.destination,
  });

  /// Email direction
  final String? destination;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w500,
    );
    final appLocalizations = AppLocalizations.of(context);

    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        children: [
          TextSpan(
            text: appLocalizations?.enterCodeText ?? '',
            style: textStyle,
          ),
          TextSpan(
            text: (destination),
            style: textStyle?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
