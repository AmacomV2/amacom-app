import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/registration/registration_form_providers.dart';
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
    final appLocalizations = AppLocalizations.of(context);

    return WillPopScope(
      onWillPop: () async {
        return _goBack(
          context: context,
          pageController: pageController,
          ref: ref,
        );
      },
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar2(
              title: appLocalizations?.signUp ?? '',
              subtitle: appLocalizations?.singUpText ?? '',
              padding: true,
              onBack: () => _goBack(
                context: context,
                pageController: pageController,
                ref: ref,
              ),
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
      ),
    );
  }

  bool _goBack({
    required PageController pageController,
    required BuildContext context,
    required WidgetRef ref,
    bool navigate = true,
  }) {
    if (pageController.page?.toInt() == 0) {
      if (navigate) {
        ref.invalidate(registrationIndexProvider);
        ref.invalidate(regAddressProvider);
        ref.invalidate(regBirthDateProvider);
        ref.invalidate(regCivilStatusProvider);
        ref.invalidate(regDocumentNoProvider);
        ref.invalidate(regDocumentTypeProvider);
        ref.invalidate(regEmailProvider);
        ref.invalidate(regGenderProvider);
        ref.invalidate(regLastNameProvider);
        ref.invalidate(regNameProvider);
        ref.invalidate(regOccupationProvider);
        ref.invalidate(regPasswordProvider);
        ref.invalidate(regTermsAndConditionsProvider);
        ref.invalidate(regUsernameProvider);
        if (context.canPop()) {
          Navigation.goBack();
        } else {
          Navigation.goTo(
            CustomAppRouter.login,
            replacement: true,
          );
        }
      } else {
        return true;
      }
    } else {
      if (pageController.hasClients) {
        pageController.animateToPage(
          (pageController.page?.toInt() ?? 1) - 1,
          duration: AppDurations.animation,
          curve: Curves.easeInOut,
        );
        ref.read(registrationIndexProvider.notifier).update((state) => 0);
      }
    }

    return false;
  }
}
