import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:amacom_app/src/presentation/views/screens.dart';

/// Class to manage app routes.
class Routes {
  /// Return app routes
  static Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      onBoarding: (BuildContext context) =>
          getBoolAsync('show_onboarding', defaultValue: true)
              ? const OnBoardingScreen()
              : Container(),
      root: (BuildContext context) => LoadingScreen(),
      registration: (BuildContext context) => const RegistrationScreen(),
      login: (BuildContext context) => const LoginScreen(),
      otpVerification: (BuildContext context) => const EmailVerificationScreen(),
      netWorkResource: (BuildContext context) => const NetworkResourceView(),
      passwordRecoverForm: (BuildContext context) => PasswordRecoverScreen(),
      personalData: (BuildContext context) => const PersonalDataScreen(),
    };
  }

  /// OnBoarding route
  static String onBoarding = '/onBoarding';

  /// OnBoarding route
  static String welcome = '/welcome';

  /// OnBoarding route
  static String root = '/';

  /// Login screen route
  static String login = '/login';

  /// Password recover route
  static String passwordRecoverForm = '/passwordRecover';

  /// User registration screen route
  static String registration = '/registration';

  /// Forget password form screen
  static String forgetPassword = '/forgetPassword';

  /// OTP verification form screen
  static String otpVerification = '/otpScreen';

  /// Change password form screen
  static String changePassword = '/changePassword';

  /// OTP verification screen
  static String verificationCode = '/verificationCode';

  /// Pet registration screen
  static String petRegistration = '/petRegistration';

  /// Home screen route
  static String home = '/home';

  /// Tutorial screen route
  static String tutorial = '/tutorial';

  /// Us screen route
  static String us = '/us';

  /// Us screen route
  static String netWorkResource = '/networkResource';

  /// Personal information screen route
  static String personalInformation = '/personalInformation';

  /// Personal data
  static String personalData = '/personalData';
}
