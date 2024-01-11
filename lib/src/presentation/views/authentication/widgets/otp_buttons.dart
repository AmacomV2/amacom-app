import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// Buttons used on OTP screen
class OTPButtons extends StatelessWidget {
  /// Widget constructor
  const OTPButtons({
    super.key,
    required this.send,
    this.enableNext = true,
    required this.reSend,
  });

  /// Callback called on send button
  final VoidCallback send;

  /// Callback called on re-send button
  final VoidCallback reSend;

  /// Callback called on re-send button
  final bool enableNext;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appLocalizations = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: CustomButtonWithState(
            border: true,
            color: colorScheme.inversePrimary,
            onTap: reSend,
            text: appLocalizations?.reSendCode ?? '',
          ),
        ),
        const HorizontalSpacer(
          width: 8,
        ),
        Expanded(
          child: CustomButtonWithState(
            enabled: enableNext,
            onTap: send,
            text: appLocalizations?.send ?? '',
          ),
        ),
      ],
    );
  }
}
