import 'package:amacom_app/src/presentation/views/authentication/widgets/authentication_widgets.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Person registration screen
///
/// Perform person form validations and more
class RegistrationScreen extends StatelessWidget {
  /// Constructor
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColumnWithPadding(
        children: [
          CustomAppBar2(
            title: 'Crea una cuenta',
            subtitle: 'Por favor llena los campos de texto requeridos',
            onBack: () {
              if (context.canPop()) {
                Navigation.goBack();
              } else {
                Navigation.goTo(
                  CustomAppRouter.login,
                  replacement: true,
                );
              }
            },
          ),
          const Expanded(
            child: RegistrationForm(),
          ),
          const GoToLogin(),
          const SafeBottomSpacer(),
        ],
      ),
    );
  }
}
