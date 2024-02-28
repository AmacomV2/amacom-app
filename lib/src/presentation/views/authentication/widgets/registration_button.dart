import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/data/repositories/user_repository.dart';
import 'package:amacom_app/src/domain/dtos/user_register_dto.dart';
import 'package:amacom_app/src/presentation/state/registration/registration_form_providers.dart';
import 'package:amacom_app/src/presentation/state/registration/registration_providers.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/extensions/extensions.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class RegistrationButton extends ConsumerWidget {
  ///
  const RegistrationButton({
    super.key,
    required this.pageController,
    required this.formKey1,
    required this.formKey2,
    required this.formKey3,
  });

  ///
  final GlobalKey<FormState> formKey1;

  ///
  final GlobalKey<FormState> formKey2;

  ///
  final GlobalKey<FormState> formKey3;

  ///
  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context);

    return CustomButtonWithState(
      height: GlobalLocator.responsiveDesign.buttonsHeight(),
      width: AppSizes.buttonsWidth,
      adaptiveTextColor: true,
      enabled: ref.watch(registrationIndexProvider) != 2 ||
          ref.watch(regTermsAndConditionsProvider),
      text: ref.watch(registrationIndexProvider) != 2
          ? appLocalizations?.next ?? ''
          : appLocalizations?.signUp.capitalize() ?? '',
      onTap: () async {
        final currentIndex = ref.read(registrationIndexProvider);
        if (currentIndex == 0 && (formKey1.currentState?.validate() ?? false)) {
          await pageController.animateToPage(
            1,
            duration: AppDurations.midAnimation,
            curve: Curves.easeInOut,
          );
        } else if (currentIndex == 1 &&
            (formKey2.currentState?.validate() ?? false)) {
          await pageController.animateToPage(
            2,
            duration: AppDurations.midAnimation,
            curve: Curves.easeInOut,
          );
        } else if (currentIndex == 2 &&
            (formKey3.currentState?.validate() ?? false)) {
          try {
            await ref.read(userRepository).userRegister(
                  UserRegisterDTO(
                    email: ref.read(regEmailProvider) ?? '',
                    username: ref.read(regUsernameProvider) ?? '',
                    address: ref.read(regAddressProvider) ?? '',
                    occupation: ref.read(regOccupationProvider) ?? '',
                    genderId: ref.read(regGenderProvider) ?? '',
                    document: ref.read(regDocumentNoProvider) ?? '',
                    documentTypeId: ref.read(regDocumentTypeProvider) ?? '',
                    civilStatusId: ref.read(regCivilStatusProvider) ?? '',
                    birthDate: ref.read(regBirthDateProvider),
                    lastName: ref.read(regLastNameProvider) ?? '',
                    name: ref.read(regNameProvider) ?? '',
                    password: ref.read(regPasswordProvider) ?? '',
                  ),
                );
            Navigation.goTo(
              CustomAppRouter.home,
              removeUntil: true,
            );
          } catch (e) {
            AppDialogs.genericConfirmationDialog(title: e.toString());
          }
        }
      },
    );
  }
}
