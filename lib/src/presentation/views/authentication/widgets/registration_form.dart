import 'package:amacom_app/src/presentation/state/authentication/registration_form_providers.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Registration form
class RegistrationForm extends ConsumerWidget {
  ///
  const RegistrationForm({
    super.key,
    required this.formKey,
  });

  /// Form key
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
            onChanged: (value) => ref.read(regNameProvider.notifier).update(
                  (state) => state = value,
                ),
            hintText: 'Escribe aquí',
            labelText: 'Nombres',
            showRequiredIndicator: true,
            validator: AppValidations.notEmptyFieldValidation,
          ),
          inputsSeparator,
          CustomTextFormField(
            onChanged: (value) => ref.read(regLastNameProvider.notifier).update(
                  (state) => state = value,
                ),
            hintText: 'Escribe aquí',
            labelText: 'Apellidos',
            showRequiredIndicator: true,
            validator: AppValidations.notEmptyFieldValidation,
          ),
          inputsSeparator,
          CustomDropDownFrom(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: 'Tipo de documento',
            showRequiredIndicator: true,
            hintText: 'Selecciona un tipo de documento',
            items: const [],
            onChanged: (value) {},
            // validator: AppValidations.notEmptyFieldValidation,
          ),
          inputsSeparator,
          CustomTextFormField(
            onChanged: (value) => ref.read(regEmailProvider.notifier).update(
                  (state) => state = value,
                ),
            hintText: 'Ingresa tu documento',
            labelText: 'Documento ',
            showRequiredIndicator: true,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            validator: AppValidations.notEmptyFieldValidation,
          ),
          inputsSeparator,
          CustomTextFormField(
            onChanged: (value) => ref.read(regEmailProvider.notifier).update(
                  (state) => state = value,
                ),
            hintText: 'Ingresa tu dirección',
            labelText: 'Dirección',
            textCapitalization: TextCapitalization.none,
          ),
          inputsSeparator,
          CustomTextFormField(
            onChanged: (value) => ref.read(regEmailProvider.notifier).update(
                  (state) => state = value,
                ),
            hintText: 'Ingresa tu ocupación',
            labelText: 'Ocupación',
            textCapitalization: TextCapitalization.none,
          ),
          inputsSeparator,
          const SafeSpacer(),
        ],
      ),
    );
  }
}
