import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/views/authentication/widgets/authentication_widgets.dart';
import 'package:amacom_app/src/presentation/views/authentication/widgets/login_form.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';

/// Users login screen
class LoginScreen extends StatefulWidget {
  /// Widget constructor
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return CustomScaffold(
      body: ColumnWithPadding(
        children: [
          const HeaderSpacer(
            height: 32,
          ),
          Image.asset(
            'assets/images/login.png',
            height: GlobalLocator.responsiveDesign.maxHeightValue(
              260,
            ),
          ),
          const SafeSpacer(
            height: 4,
          ),
          CustomAppBar2(
            title: appLocalizations?.logIn ?? '',
            subtitle: appLocalizations?.logInText ?? '',
            prefix: const SizedBox(),
            onTop: false,
          ),
          const Expanded(child: LoginForm()),
          const GoToRegistration(),
          const SafeBottomSpacer(),
        ],
      ),
    );
  }
}
