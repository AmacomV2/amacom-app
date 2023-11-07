import 'package:amacom_app/src/data/repositories/password_recovering_repository.dart';
import 'package:amacom_app/src/presentation/state/authentication/password_recovering_providers.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// User new password from recovering form
class NewPasswordForm extends ConsumerStatefulWidget {
  /// Constructor
  const NewPasswordForm({
    super.key,
    required this.onSuccess,
  });

  /// Callback on page operation success
  final VoidCallback onSuccess;

  @override
  ConsumerState<NewPasswordForm> createState() => _NewPasswordFormState();
}

class _NewPasswordFormState extends ConsumerState<NewPasswordForm> {
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _passwordController.addListener(() {
      ref.read(passRecoveringPasswordProvider.notifier).update(
            (state) => _passwordController.text,
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ScrollColumnExpandable(
        padding: EdgeInsets.zero,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomPasswordFormField(
            controller: _passwordController,
            hintText: 'Escribe tu contraseña',
            labelText: 'Contraseña',
            validator: AppValidations.notEmptyFieldValidation,
          ),
          const SafeSpacer(
            height: 20,
          ),
          CustomPasswordFormField(
            hintText: 'Escribe de nuevo tu contraseña',
            labelText: 'Confirma tu contraseña',
            validator: (value) {
              if (value != _passwordController.text) {
                return 'Las contraseñas no coinciden';
              }
              return null;
            },
          ),
          const SafeSpacer(
            height: 32,
          ),
          const Spacer(),
          CustomButtonWithState(
            enabled:
                (ref.watch(passRecoveringPasswordProvider) ?? '').isNotEmpty,
            adaptiveTextColor: true,
            text: 'Restablecer contraseña',
            onTap: () async {
              if (_formKey.currentState?.validate() ?? false) {
                final resp = await ref
                    .read(passwordRecoveringRepoProvider)
                    .setNewPassword(
                      email: ref.read(passRecoveringEmailProvider) ?? '',
                      password: ref.read(passRecoveringPasswordProvider) ?? '',
                    );
                if (resp?.ok == true) {
                  AppDialogs.showCustomSnackBar(
                    AppMessages.passwordChangeSuccess,
                    icon: Icons.check_circle_outline_rounded,
                  );
                  widget.onSuccess.call();
                } else {
                  AppDialogs.genericConfirmationDialog(
                    title: resp?.message ?? AppMessages.passwordChangeError,
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
