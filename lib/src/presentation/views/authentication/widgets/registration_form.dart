import 'package:amacom_app/src/data/repositories/user_repository.dart';
import 'package:amacom_app/src/domain/dtos/user_register_dto.dart';
import 'package:amacom_app/src/presentation/state/authentication/registration_form_providers.dart';
import 'package:amacom_app/src/presentation/views/authentication/widgets/terms_and_conditions.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Registration form
class RegistrationForm extends ConsumerStatefulWidget {
  /// Constructor
  const RegistrationForm({super.key});

  @override
  ConsumerState<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends ConsumerState<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    _nameController.addListener(() {
      ref.read(regNameProvider.notifier).update(
            (state) => state = _nameController.text,
          );
    });
    _emailController.addListener(() {
      ref.read(regEmailProvider.notifier).update(
            (state) => state = _emailController.text,
          );
    });
    _lastNameController.addListener(() {
      ref.read(regLastNameProvider.notifier).update(
            (state) => state = _lastNameController.text,
          );
    });
    _phoneController.addListener(() {
      ref.read(regPhoneProvider.notifier).update(
            (state) => state = _phoneController.text,
          );
    });
    _passwordController.addListener(() {
      ref.read(regPasswordProvider.notifier).update(
            (state) => state = _passwordController.text,
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const inputsSeparator = SafeSpacer(
      height: 20,
    );
    ref.watch(regPasswordProvider);
    return Form(
      key: _formKey,
      child: ScrollColumnExpandable(
        padding: EdgeInsets.zero,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SafeSpacer(
            height: 16,
          ),
          CustomTextFormField(
            controller: _nameController,
            hintText: 'Escribe aquí',
            labelText: 'Nombres',
            showRequiredIndicator: true,
            validator: (value) {
              if ((value ?? '').isEmpty) return 'Este campo es requerido';
              return null;
            },
          ),
          inputsSeparator,
          CustomTextFormField(
            controller: _lastNameController,
            hintText: 'Escribe aquí',
            labelText: 'Apellidos',
            showRequiredIndicator: true,
            validator: (value) {
              if ((value ?? '').isEmpty) return 'Este campo es requerido';
              return null;
            },
          ),
          inputsSeparator,
          CustomTextFormField(
            controller: _emailController,
            hintText: 'Escribe tu correo electrónico',
            labelText: 'Correo electrónico',
            textCapitalization: TextCapitalization.none,
            showRequiredIndicator: true,
            validator: AppValidations.validateEmail,
          ),
          inputsSeparator,
          CustomPasswordFormField(
            controller: _passwordController,
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
              if (value != _passwordController.text) {
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
          CustomButtonWithState(
            height: GlobalLocator.responsiveDesign.maxHeightValue(70),
            width: 230,
            adaptiveTextColor: true,
            enabled: ref.watch(regTermsAndConditionsProvider),
            text: 'Registrarme',
            onTap: () async {
              if (_formKey.currentState?.validate() ?? false) {
                try {
                  await ref.read(userRepository).userRegister(
                        UserRegisterDTO(
                          email: ref.read(regEmailProvider) ?? '',
                          lastName: ref.read(regLastNameProvider) ?? '',
                          firstName: ref.read(regNameProvider) ?? '',
                          password: ref.read(regPasswordProvider) ?? '',
                        ),
                      );
                  Navigation.goTo(
                    CustomAppRouter.emailVerification,
                    extra: {
                      'email': ref.read(regEmailProvider),
                    },
                    removeUntil: true,
                  );
                } catch (e) {
                  AppDialogs.genericConfirmationDialog(title: e.toString());
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
