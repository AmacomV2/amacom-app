import 'package:flutter/material.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';

/// Buttons used to control form pages transition
class BottomButtons extends StatelessWidget {
  /// Widget constructor
  const BottomButtons({
    super.key,
    required this.next,
    required this.back,
    this.backButtonText,
  });

  /// Back button optional text
  final String? backButtonText;

  /// Callback called on next button
  final VoidCallback next;

  /// Callback called on re-next button
  final VoidCallback back;
  

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Expanded(
          child: CustomButtonWithState(
            border: true,
            color: colorScheme.inversePrimary,
            onTap: back,
            text: backButtonText ?? 'Atrás',
          ),
        ),
        const HorizontalSpacer(
          width: 8,
        ),
        Expanded(
          child: CustomButtonWithState(
            onTap: next,
            text: 'Continuar',
          ),
        ),
      ],
    );
  }
}
