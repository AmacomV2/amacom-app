import 'package:amacom_app/src/presentation/views/authentication/widgets/authentication_widgets.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';

/// Password recover screen
///
/// Ask for email and send a recover OTP
class PasswordRecoverScreen extends StatelessWidget {
  /// Constructor
  PasswordRecoverScreen({super.key});

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final pages = [
      RecoverPasswordForm(
        onSuccess: () {
          _pageController.animateToPage(
            1,
            duration: AppDurations.animation,
            curve: AppConstants.defaultCurve,
          );
        },
      ),
      PasswordOTPVerificationForm(
        onSuccess: () {
          _pageController.animateToPage(
            2,
            duration: AppDurations.animation,
            curve: AppConstants.defaultCurve,
          );
        },
      ),
      NewPasswordForm(
        onSuccess: () {
          Navigation.goBack();
        },
      ),
    ];
    return Scaffold(
      body: ColumnWithPadding(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomAppBar2(
            title: 'Recuperar contraseña',
            subtitle: 'Completa los pasos para recuperar tu contraseña.',
          ),
          Expanded(
            child: PageView.builder(
              clipBehavior: Clip.none,
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return pages[index];
              },
            ),
          ),
          const SafeSpacer(),
        ],
      ),
    );
  }
}
