import 'package:amacom_app/src/data/repositories/password_recovering_repository.dart';
import 'package:amacom_app/src/presentation/state/authentication/code_validation_provider.dart';
import 'package:amacom_app/src/presentation/state/authentication/password_recovering_providers.dart';
import 'package:amacom_app/src/presentation/views/authentication/widgets/authentication_widgets.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/app_messages.dart';
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
    return ScrollColumnExpandable(
      padding: EdgeInsets.zero,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        OTPVerificationMessage(
          sms: false,
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
                AppMessages.verificationCodeVerified,
                icon: Icons.check_circle_outline_rounded,
              );
              onSuccess.call();
            } else {
              AppDialogs.genericConfirmationDialog(
                title: resp?.message ?? AppMessages.verificationCodeError,
              );
            }
          },
          reSend: () async {
            final resp = await ref
                .read(passwordRecoveringRepoProvider)
                .sendCode(ref.read(passRecoveringEmailProvider) ?? '');
            if (resp?.ok == true) {
              AppDialogs.showCustomSnackBar(
                AppMessages.verificationCodeSent,
                icon: Icons.check_circle_outline_rounded,
              );
            } else {
              AppDialogs.genericConfirmationDialog(
                title: resp?.message ?? AppMessages.verificationCodeError,
              );
            }
          },
        ),
        const BottomSpacer(),
      ],
    );
  }
}
