import 'package:amacom_app/src/presentation/state/registration/registration_providers.dart';
import 'package:amacom_app/src/presentation/views/authentication/widgets/authentication_widgets.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
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
  final GlobalKey<FormState> formKey3 = GlobalKey<FormState>();

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
              RegistrationForm3(
                formKey: formKey3,
              ),
            ],
          ),
        ),
        const SafeSpacer(),
        RegistrationButton(
          pageController: widget.pageController,
          formKey1: formKey1,
          formKey2: formKey2,
          formKey3: formKey3,
        ),
        const SafeSpacer(),
        PageProgressIndicator(
          key: UniqueKey(),
          pageController: widget.pageController,
          totalPages: 3,
          currentPage: ref.watch(registrationIndexProvider),
        ),
        const SafeBottomSpacer(),
      ],
    );
  }
}
