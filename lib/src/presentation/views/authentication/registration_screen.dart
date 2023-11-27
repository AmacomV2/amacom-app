import 'package:amacom_app/src/presentation/state/registration/registration_providers.dart';
import 'package:amacom_app/src/presentation/views/authentication/widgets/authentication_widgets.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Person registration screen
///
/// Perform person form validations and more
class RegistrationScreen extends ConsumerWidget {
  /// Constructor
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = PageController();

    return Scaffold(
      body: ColumnWithPadding(
        children: [
          CustomAppBar2(
            title: 'Crea una cuenta',
            subtitle: 'Por favor llena los campos de texto requeridos',
            onBack: () {
              if (pageController.page?.toInt() == 0) {
                if (context.canPop()) {
                  Navigation.goBack();
                } else {
                  Navigation.goTo(
                    CustomAppRouter.login,
                    replacement: true,
                  );
                }
              } else {
                if (pageController.hasClients) {
                  pageController.animateToPage(
                    0,
                    duration: AppDurations.animation,
                    curve: Curves.easeInOut,
                  );
                  ref
                      .read(registrationIndexProvider.notifier)
                      .update((state) => 0);
                }
              }
            },
          ),
          Expanded(
            child: RegistrationFormPages(
              pageController: pageController,
            ),
          ),
          const SafeSpacer(),
          const GoToLogin(),
          const SafeBottomSpacer(),
        ],
      ),
    );
  }
}
