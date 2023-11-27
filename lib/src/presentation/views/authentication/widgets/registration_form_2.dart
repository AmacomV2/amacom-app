import 'package:amacom_app/src/presentation/state/authentication/registration_form_providers.dart';
import 'package:amacom_app/src/presentation/views/authentication/widgets/terms_and_conditions.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Registration form
class RegistrationForm2 extends ConsumerWidget {
  ///
  const RegistrationForm2({
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
    return Form(
      key: formKey,
      child: ScrollColumnExpandable(
        padding: EdgeInsets.zero,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SafeSpacer(
            height: 16,
          ),
          CustomTextFormField(
            onChanged: (value) => ref.read(regEmailProvider.notifier).update(
                  (state) => state = value,
                ),
            hintText: 'Escribe tu correo electrónico',
            labelText: 'Correo electrónico',
            textCapitalization: TextCapitalization.none,
            showRequiredIndicator: true,
            validator: AppValidations.validateEmail,
          ),
          inputsSeparator,
          CustomPasswordFormField(
            onChanged: (value) => ref.read(regPasswordProvider.notifier).update(
                  (state) => state = value,
                ),
            hintText: 'Escribe tu contraseña',
            labelText: 'Contraseña',
            showRequiredIndicator: true,
            validator: AppValidations.validatePassword,
          ),
          inputsSeparator,
          CustomPasswordFormField(
            hintText: 'Escribe de nuevo tu contraseña',
            labelText: 'Confirma tu contraseña',
            showRequiredIndicator: true,
            validator: (value) {
              if (value != ref.read(regPasswordProvider)) {
                return 'Las contraseñas no coinciden';
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
