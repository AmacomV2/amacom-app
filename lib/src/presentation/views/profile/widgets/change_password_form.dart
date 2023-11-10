import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/changePassword/change_password_providers.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Change password form
class ChangePasswordForm extends ConsumerWidget {
  ///
  const ChangePasswordForm({
    super.key,
    required this.formKey,
  });

  /// Form validation key
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context);
    return Form(
      key: formKey,
      child: ScrollColumnExpandable(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SafeSpacer(
            height: 10,
          ),
          CustomPasswordFormField(
            onChanged: (value) {
              ref
                  .read(oldPasswordProvider.notifier)
                  .update((state) => value ?? '');
            },
            labelText: appLocalizations?.currentPassword,
            validator: (value) {
              return AppValidations.notEmptyFieldValidation(
                value,
                message: appLocalizations?.fieldRequired,
              );
            },
            hintText:
                '${appLocalizations?.writeHereYour}${appLocalizations?.currentPassword.toLowerCase()}',
          ),
          const SafeSpacer(
            height: 16,
          ),
          CustomPasswordFormField(
            labelText: appLocalizations?.newPassword,
            onChanged: (value) {
              ref
                  .read(newPasswordProvider.notifier)
                  .update((state) => value ?? '');
            },
            validator: (value) {
              return AppValidations.validatePassword(
                value,
                appLocalizations: appLocalizations,
              );
            },
            hintText:
                '${appLocalizations?.writeHereYour}${appLocalizations?.newPassword.toLowerCase()}',
          ),
          const SafeSpacer(
            height: 16,
          ),
          Builder(
            builder: (context) {
              final newPassword = ref.watch(newPasswordProvider);

              return CustomPasswordFormField(
                labelText: appLocalizations?.confirmPassword,
                validator: (value) {
                  if (value != newPassword) {
                    return appLocalizations?.passwordNotEqual;
                  }
                  return null;
                },
                hintText: '${appLocalizations?.passwordHintVar}',
              );
            },
          ),
          const SafeSpacer(
            height: 16,
          ),
        ],
      ),
    );
  }
}
