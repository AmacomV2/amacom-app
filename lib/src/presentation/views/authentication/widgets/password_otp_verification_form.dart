import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/data/repositories/password_recovering_repository.dart';
import 'package:amacom_app/src/presentation/state/authentication/code_validation_provider.dart';
import 'package:amacom_app/src/presentation/state/authentication/password_recovering_providers.dart';
import 'package:amacom_app/src/presentation/views/authentication/widgets/authentication_widgets.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Password OTP verification form
///
/// Verifies OPT sent by email
class PasswordOTPVerificationForm extends ConsumerWidget {
  /// Constructor
  const PasswordOTPVerificationForm({
    super.key,
    required this.onSuccess,
  });

  /// Callback on page operation success
  final VoidCallback onSuccess;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context);
    return ScrollColumnExpandable(
      padding: EdgeInsets.zero,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        OTPVerificationMessage(
          destination: ref.watch(passRecoveringEmailProvider),
        ),
        const SafeSpacer(
          height: 40,
        ),
        const OTPVerificationForm(),
        const SafeSpacer(
          height: 40,
        ),
        const Spacer(),
        OTPButtons(
          enableNext: (ref.watch(codeValidationProvider) ?? '').length == 4,
          send: () async {
            final resp =
                await ref.read(passwordRecoveringRepoProvider).verifyCode(
                      email: ref.read(passRecoveringEmailProvider) ?? '',
                      code: ref.watch(codeValidationProvider) ?? '',
                    );
            if (resp?.ok == true) {
              AppDialogs.showCustomSnackBar(
                appLocalizations?.codeValidated ?? '',
                icon: Icons.check_circle_outline_rounded,
              );
              onSuccess.call();
            } else {
              AppDialogs.genericConfirmationDialog(
                title: appLocalizations?.codeValidationError ?? '',
              );
            }
          },
          reSend: () async {
            final resp = await ref
                .read(passwordRecoveringRepoProvider)
                .sendCode(ref.read(passRecoveringEmailProvider) ?? '');
            if (resp?.ok == true) {
              AppDialogs.showCustomSnackBar(
                appLocalizations?.codeSent ?? '',
                icon: Icons.check_circle_outline_rounded,
              );
            } else {
              AppDialogs.genericConfirmationDialog(
                title: appLocalizations?.codeSendingError ?? '',
              );
            }
          },
        ),
        const BottomSpacer(),
      ],
    );
  }
}
