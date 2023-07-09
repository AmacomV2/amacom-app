import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amacom_app/src/data/repositories/user_repository.dart';
import 'package:amacom_app/src/domain/dtos/user_login_dto.dart';
import 'package:amacom_app/src/presentation/state/authentication/user_login_form_providers.dart';
import 'package:amacom_app/src/presentation/views/authentication/widgets/forget_password.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

/// User login form
class LoginForm extends ConsumerStatefulWidget {
  /// Constructor
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    _passwordController.addListener(() {
      ref.read(loginPasswordProvider.notifier).update(
            (state) => state = _passwordController.text,
          );
    });
    _emailController.addListener(() {
      ref.read(loginEmailProvider.notifier).update(
            (state) => state = _emailController.text,
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
          const SafeSpacer(
            height: 6,
          ),
          CustomTextFormField(
            textCapitalization: TextCapitalization.none,
            controller: _emailController,
            hintText: 'Escribe tu correo electrónico',
            labelText: 'Correo electrónico',
            validator: AppValidations.validateEmail,
          ),
          const SafeSpacer(
            height: 20,
          ),
          CustomPasswordFormField(
            controller: _passwordController,
            labelText: 'Contraseña',
            hintText: 'Escribe tu contraseña',
            validator: AppValidations.validatePassword,
          ),
          const SafeSpacer(
            height: 24,
          ),
          const ForgetPassword(),
          const SafeSpacer(
            height: 32,
          ),
          CustomButtonWithState(
            adaptiveTextColor: true,
            enabled: (ref.watch(loginEmailProvider) ?? '').isNotEmpty &&
                (ref.watch(loginPasswordProvider) ?? '').isNotEmpty,
            text: 'Continuar',
            onTap: () async {
              if (_formKey.currentState?.validate() ?? false) {
                try {
                  await ref.read(userRepository).userLogin(
                        UserLoginDTO(
                          email: ref.read(loginEmailProvider) ??
                              _emailController.text,
                          password: ref.read(loginPasswordProvider) ??
                              _passwordController.text,
                        ),
                      );
                  Navigation.goTo(
                    CustomAppRouter.home,
                    removeUntil: true,
                  );
                } catch (e) {
                  AppDialogs.genericConfirmationDialog(
                    title: 'Error de credenciales',
                    message:
                        'Tu correo o contraseña son incorrectas, inténtalo de nuevo.',
                    buttonText: 'Continuar',
                    onTap: () {
                      GlobalLocator.appNavigator.currentState?.pop();
                    },
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
