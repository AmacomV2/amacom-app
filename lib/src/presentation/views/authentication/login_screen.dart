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
          FurHeader(
            title: 'Iniciar sesión',
          ),
          SafeSpacer(
            height: 18,
          ),
          Expanded(child: LoginForm()),
          GoToRegistration(),
          SafeBottomSpacer(),
        ],
      ),
    );
  }
}
