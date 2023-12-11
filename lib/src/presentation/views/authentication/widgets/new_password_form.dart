import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/data/repositories/password_recovering_repository.dart';
import 'package:amacom_app/src/presentation/state/authentication/code_validation_provider.dart';
import 'package:amacom_app/src/presentation/state/authentication/password_recovering_providers.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
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
    final appLocalizations = AppLocalizations.of(context);

    return Form(
      key: _formKey,
      child: ScrollColumnExpandable(
        padding: EdgeInsets.zero,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomPasswordFormField(
            controller: _passwordController,
            hintText: appLocalizations?.passwordHint ?? '',
            labelText: appLocalizations?.password ?? '',
            validator: AppValidations.notEmptyFieldValidation,
          ),
          const SafeSpacer(
            height: 20,
          ),
          CustomPasswordFormField(
            hintText: appLocalizations?.confirmPassword ?? '',
            labelText: appLocalizations?.passwordHintVar ?? '',
            validator: (value) {
              if (value != _passwordController.text) {
                return appLocalizations?.passwordNotEqual ?? '';
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
            text: appLocalizations?.resetPassword ?? '',
            onTap: () async {
              if (_formKey.currentState?.validate() ?? false) {
                final resp = await ref
                    .read(passwordRecoveringRepoProvider)
                    .setNewPassword(
                      email: ref.read(passRecoveringEmailProvider) ?? '',
                      password: ref.read(passRecoveringPasswordProvider) ?? '',
                      code: ref.read(codeValidationProvider) ?? '',
                    );
                if (resp?.ok == true) {
                  AppDialogs.showCustomSnackBar(
                    appLocalizations?.passwordChanged ?? '',
                    icon: Icons.check_circle_outline_rounded,
                  );
                  widget.onSuccess.call();
                } else {
                  AppDialogs.genericConfirmationDialog(
                    title: appLocalizations?.passwordChangeError ?? '',
                  );
                }
              }
            },
          ),
          const SafeSpacer(),
        ],
      ),
    );
  }
}
