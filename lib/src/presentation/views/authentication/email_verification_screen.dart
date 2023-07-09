import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amacom_app/src/data/repositories/code_validation_repository.dart';
import 'package:amacom_app/src/presentation/state/authentication/code_validation_provider.dart';
import 'package:amacom_app/src/presentation/views/authentication/widgets/authentication_widgets.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';

/// OTP verification screen
///
/// Verifies OPT sent by email or sms
class EmailVerificationScreen extends ConsumerWidget {
  /// Constructor
  const EmailVerificationScreen({
    super.key,
    this.email = '',
  });

  /// email
  final String email;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ScrollColumnExpandable(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FurHeader(
            onBack: () {
              if (context.canPop) {
                Navigation.goBack();
              } else {
                Navigation.goTo(
                  CustomAppRouter.registration,
                  replacement: true,
                );
              }
            },
            showLogo: false,
            title: 'Verifica tu correo electrónico',
            includeBackArrow: true,
          ),
          const SafeSpacer(),
          OTPVerificationMessage(
            sms: false,
            destination: email,
          ),
          const SafeSpacer(
            height: 55,
          ),
          const OTPVerificationForm(),
          const Spacer(),
          OTPButtons(
            enableNext: (ref.watch(codeValidationProvider) ?? '').length == 4,
            reSend: () async {
              final res = await ref
                  .read(codeValidationRepo)
                  .reSendEmailVerificationCode();
              if (res?.error ?? false) {
                AppDialogs.genericConfirmationDialog(
                  title: res?.message ??
                      'Ha ocurrido un error al enviar un nuevo código de verificación',
                );
              } else {
                AppDialogs.genericConfirmationDialog(
                  resourcePath: 'assets/svg/check.svg',
                  title: 'Código de verificación enviado exitosamente',
                );
              }
            },
            send: () async {
              final res = await ref
                  .read(codeValidationRepo)
                  .verifyEmail(code: ref.read(codeValidationProvider) ?? '');
              if (res?.error ?? false) {
                AppDialogs.genericConfirmationDialog(
                  title: res?.message ??
                      'Ha ocurrido un error al validar tu código, inténtalo nuevamente.',
                );
              } else {
                Navigation.goTo(CustomAppRouter.registrationComplete);
              }
            },
          ),
          const SafeBottomSpacer()
        ],
      ),
    );
  }
}
