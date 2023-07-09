import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:go_router/go_router.dart';

/// Go to Recover password screen
class ForgetPassword extends ConsumerWidget {
  /// Constructor
  const ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        context.pushReplacementNamed(Routes.passwordRecoverForm);
      },
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: Text(
          '¿Has olvidado tu contraseña?',
          style: theme.textTheme.bodyLarge?.copyWith(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
