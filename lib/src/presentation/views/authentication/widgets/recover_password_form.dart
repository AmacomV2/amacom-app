import 'package:amacom_app/src/data/repositories/password_recovering_repository.dart';
import 'package:amacom_app/src/presentation/state/authentication/password_recovering_providers.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/app_messages.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// User password recovering form
class RecoverPasswordForm extends ConsumerStatefulWidget {
  /// Constructor
  const RecoverPasswordForm({
    super.key,
    required this.onSuccess,
  });

  /// Callback on page operation success
  final VoidCallback onSuccess;

  @override
  ConsumerState<RecoverPasswordForm> createState() =>
      _RecoverPasswordFormState();
}

class _RecoverPasswordFormState extends ConsumerState<RecoverPasswordForm> {
  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController.addListener(() {
      ref.read(passRecoveringEmailProvider.notifier).update(
            (state) => _emailController.text,
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Form(
      key: _formKey,
      child: ScrollColumnExpandable(
        padding: EdgeInsets.zero,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Te enviaremos un código para restablecer tu contraseña',
            textAlign: TextAlign.left,
            style: textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SafeSpacer(),
          CustomTextFormField(
            controller: _emailController,
            prefixIcon: const Icon(Icons.mail_outline_rounded),
            hintText: 'Escribe tu correo electrónico',
            labelText: 'Correo electrónico',
            textCapitalization: TextCapitalization.none,
            validator: AppValidations.validateEmail,
          ),
          const SafeSpacer(
            height: 32,
          ),
          const Spacer(),
          CustomButtonWithState(
            enabled: (ref.watch(passRecoveringEmailProvider) ?? '').isNotEmpty,
            adaptiveTextColor: true,
            text: 'Restablecer contraseña',
            onTap: () async {
              if (_formKey.currentState?.validate() ?? false) {
                Focus.of(context).unfocus();
                final resp = await ref
                    .read(passwordRecoveringRepoProvider)
                    .sendCode(ref.read(passRecoveringEmailProvider) ?? '');
                if (resp?.error == false) {
                  AppDialogs.showCustomSnackBar(
                    AppMessages.verificationCodeSent,
                    icon: Icons.check_circle_outline_rounded,
                  );
                  widget.onSuccess.call();
                } else {
                  AppDialogs.genericConfirmationDialog(
                    title: resp?.message ?? AppMessages.verificationCodeError,
                  );
                }
              }
            },
          ),
          const BottomSpacer(),
        ],
      ),
    );
  }
}
