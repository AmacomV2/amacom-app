import 'package:flutter/material.dart';
import 'package:amacom_app/src/presentation/views/authentication/widgets/authentication_widgets.dart';
import 'package:amacom_app/src/presentation/views/authentication/widgets/login_form.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';

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
    return const Scaffold(
      body: ColumnWithPadding(
        children: [
          Spacer(
            flex: 1,
          ),
          AuthHeader(
            title: 'Iniciar sesión',
          ),
          SafeSpacer(),
          Expanded(flex: 8, child: LoginForm()),
          GoToRegistration(),
          SafeBottomSpacer(),
        ],
      ),
    );
  }
}
