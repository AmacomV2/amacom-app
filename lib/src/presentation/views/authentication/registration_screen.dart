import 'package:flutter/material.dart';
import 'package:amacom_app/src/presentation/views/authentication/widgets/authentication_widgets.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';

/// Person registration screen
///
/// Perform person form validations and more
class RegistrationScreen extends StatelessWidget {
  /// Constructor
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ColumnWithPadding(
        children: [
          AuthHeader(),
          Expanded(
            child: RegistrationForm(),
          ),
          GoToLogin(),
          SafeBottomSpacer(),
        ],
      ),
    );
  }
}
