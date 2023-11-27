import 'package:amacom_app/src/data/repositories/user_repository.dart';
import 'package:amacom_app/src/domain/dtos/user_register_dto.dart';
import 'package:amacom_app/src/presentation/state/authentication/registration_form_providers.dart';
import 'package:amacom_app/src/presentation/state/registration/registration_providers.dart';
import 'package:amacom_app/src/presentation/views/authentication/widgets/authentication_widgets.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class RegistrationFormPages extends ConsumerStatefulWidget {
  ///
  const RegistrationFormPages({
    super.key,
    required this.pageController,
  });

  ///
  final PageController pageController;

  @override
  ConsumerState<RegistrationFormPages> createState() =>
      _RegistrationFormPagesState();
}

class _RegistrationFormPagesState extends ConsumerState<RegistrationFormPages> {
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  @override
  void initState() {
    widget.pageController.addListener(() {
      ref
          .read(registrationIndexProvider.notifier)
          .update((state) => widget.pageController.page?.toInt() ?? 0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            allowImplicitScrolling: true,
            physics: const NeverScrollableScrollPhysics(),
            controller: widget.pageController,
            children: [
              RegistrationForm(
                formKey: formKey1,
              ),
              RegistrationForm2(
                formKey: formKey2,
              ),
            ],
          ),
        ),
        CustomButtonWithState(
          height: GlobalLocator.responsiveDesign.maxHeightValue(70),
          width: 230,
          adaptiveTextColor: true,
          enabled: ref.watch(registrationIndexProvider) == 0 ||
              ref.watch(regTermsAndConditionsProvider),
          text: ref.watch(registrationIndexProvider) == 0
              ? 'Siguiente'
              : 'Registrarme',
          onTap: () async {
            if (ref.watch(registrationIndexProvider) == 0 &&
                (formKey1.currentState?.validate() ?? false)) {
              widget.pageController.animateToPage(
                1,
                duration: AppDurations.animation,
                curve: Curves.easeInOut,
              );
            } else if (formKey2.currentState?.validate() ?? false) {
              try {
                await ref.read(userRepository).userRegister(
                      UserRegisterDTO(
                        email: ref.read(regEmailProvider) ?? '',
                        lastName: ref.read(regLastNameProvider) ?? '',
                        firstName: ref.read(regNameProvider) ?? '',
                        password: ref.read(regPasswordProvider) ?? '',
                      ),
                    );
                Navigation.goTo(
                  CustomAppRouter.emailVerification,
                  extra: {
                    'email': ref.read(regEmailProvider),
                  },
                  removeUntil: true,
                );
              } catch (e) {
                AppDialogs.genericConfirmationDialog(title: e.toString());
              }
            }
          },
        ),
      ],
    );
  }
}
