import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/data/repositories/user_repository.dart';
import 'package:amacom_app/src/domain/dtos/user_login_dto.dart';
import 'package:amacom_app/src/presentation/state/authentication/user_login_form_providers.dart';
import 'package:amacom_app/src/presentation/views/authentication/widgets/forget_password.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final responsive = GlobalLocator.responsiveDesign;
    final appLocalizations = AppLocalizations.of(context);

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
            prefixIcon: const Icon(Icons.person_outline_rounded),
            textCapitalization: TextCapitalization.none,
            controller: _emailController,
            hintText: appLocalizations?.username ?? '',
            labelText: appLocalizations?.usernameHint ?? '',
            validator: AppValidations.notEmptyFieldValidation,
            fillColor: Colors.white,
          ),
          const SafeSpacer(
            height: 20,
          ),
          CustomPasswordFormField(
            controller: _passwordController,
            labelText: appLocalizations?.password ?? '',
            hintText: appLocalizations?.passwordHint ?? '',
            validator: AppValidations.validatePassword,
            fillColor: Colors.white,
          ),
          const SafeSpacer(
            height: 20,
          ),
          CustomButtonWithState(
            height: responsive.maxHeightValue(70),
            width: 230,
            adaptiveTextColor: true,
            enabled: (ref.watch(loginEmailProvider) ?? '').isNotEmpty &&
                (ref.watch(loginPasswordProvider) ?? '').isNotEmpty,
            text: appLocalizations?.logIn ?? '',
            onTap: () async {
              if (_formKey.currentState?.validate() ?? false) {
                try {
                  await ref.read(userRepository).userLogin(
                        UserLoginDTO(
                          username: ref.read(loginEmailProvider) ??
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
                    title: appLocalizations?.wrongCredentials ?? '',
                    message: appLocalizations?.wrongLogin ?? '',
                    buttonText: appLocalizations?.accept ?? '',
                    onTap: () {
                      GlobalLocator.appNavigator.currentState?.pop();
                    },
                  );
                }
              }
            },
          ),
          const SafeSpacer(
            height: 16,
          ),
          const ForgetPassword(),
        ],
      ),
    );
  }
}
