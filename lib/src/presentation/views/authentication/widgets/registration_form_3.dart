import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/registration/registration_form_providers.dart';
import 'package:amacom_app/src/presentation/views/authentication/widgets/terms_and_conditions.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Registration form
class RegistrationForm3 extends ConsumerWidget {
  ///
  const RegistrationForm3({
    super.key,
    required this.formKey,
  });

  ///
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const inputsSeparator = SafeSpacer(
      height: 20,
    );
    ref.watch(regPasswordProvider);
    final appLocalizations = AppLocalizations.of(context);

    return Form(
      key: formKey,
      child: ScrollColumnExpandable(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SafeSpacer(
            height: 16,
          ),
          CustomTextFormField(
            onChanged: (value) => ref.read(regEmailProvider.notifier).update(
                  (state) => state = value,
                ),
            hintText:
                '${appLocalizations?.writeHereYour}${appLocalizations?.email.toLowerCase()}',
            labelText: appLocalizations?.email ?? '',
            textCapitalization: TextCapitalization.none,
            showRequiredIndicator: true,
            validator: AppValidations.validateEmail,
          ),
          inputsSeparator,
          CustomTextFormField(
            onChanged: (value) => ref.read(regUsernameProvider.notifier).update(
                  (state) => state = value,
                ),
            hintText:
                '${appLocalizations?.writeHereYour}${appLocalizations?.username.toLowerCase()}',
            labelText: appLocalizations?.username ?? '',
            textCapitalization: TextCapitalization.none,
            showRequiredIndicator: true,
            validator: AppValidations.notEmptyFieldValidation,
          ),
          inputsSeparator,
          CustomPasswordFormField(
            onChanged: (value) => ref.read(regPasswordProvider.notifier).update(
                  (state) => state = value,
                ),
            hintText:
                '${appLocalizations?.writeHereYour}${appLocalizations?.password.toLowerCase()}',
            labelText: appLocalizations?.password ?? '',
            showRequiredIndicator: true,
            validator: AppValidations.validatePassword,
          ),
          inputsSeparator,
          CustomPasswordFormField(
            hintText:
                '${appLocalizations?.writeHereYour}${appLocalizations?.confirmPassword.toLowerCase()}',
            labelText: appLocalizations?.confirmPassword ?? '',
            showRequiredIndicator: true,
            validator: (value) {
              if (value != ref.read(regPasswordProvider)) {
                return appLocalizations?.passwordNotEqual;
              }
              return null;
            },
          ),
          const SafeSpacer(
            height: 16,
          ),
          TermsAndConditions(
            onChanged: (value) {
              ref.read(regTermsAndConditionsProvider.notifier).update(
                    (state) => state = value ?? false,
                  );
            },
          ),
          const SafeSpacer(
            height: 40,
          ),
          const SafeSpacer(),
        ],
      ),
    );
  }
}
