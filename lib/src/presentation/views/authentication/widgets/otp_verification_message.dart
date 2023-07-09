import 'package:flutter/material.dart';

/// Widget to show OTP verification message on OTP verification screen
class OTPVerificationMessage extends StatelessWidget {
  /// Widget constructor
  const OTPVerificationMessage({
    super.key,
    this.sms = false,
    this.destination,
  });

  /// To know if OTP verification is going thought sms
  final bool sms;

  /// Email direction
  final String? destination;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w500,
    );

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: sms
                ? 'Por favor ingresa el código de 4 dígitos enviado al siguiente número de teléfono '
                : 'Por favor ingresa el código de 4 dígitos enviado al siguiente correo electrónico ',
            style: textStyle,
          ),
          TextSpan(
            text: (destination),
            style: textStyle?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
