import 'package:amacom_app/src/presentation/views/screens.dart';
import 'package:amacom_app/src/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A custom implementation of GoRouter that uses a [navKey].
class CustomAppRouter {
  /// Creates a CustomAppRouter with the specified [navKey].
  CustomAppRouter({required this.navKey});

  /// The navigator key used for routing.
  final GlobalKey<NavigatorState> navKey;

  // Route paths
  /// Represents the route path for the welcome screen.
  static const String welcome = '/welcome';

  /// Represents the route path for the password recovery form screen.
  static const String passwordRecoverForm = '/passwordRecover';

  /// Represents the route path for the user registration screen.
  static const String registration = '/registration';

  /// Represents the route path for the forget password screen.
  static const String forgetPassword = '/forgetPassword';

  /// Represents the route path for the change password screen.
  static const String changePassword = '/changePassword';

  /// Represents the route path for the OTP verification screen.
  static const String verificationCode = '/verificationCode';

  /// Represents the route path for the home screen.
  static const String home = '/home';

  /// Represents the route path for the tutorial screen.
  static const String tutorial = '/tutorial';

  /// Represents the route path for the new situation screen.
  static const String newSituation = '/newSituation';

  /// Represents the route path for the personal information screen.
  static const String personalInformation = '/personalInformation';

  /// Represents the route path for the login screen.
  static const String login = '/login';

  /// Represents the route path for the OTP screen.
  /// Need to specify if
  static const String emailVerification = '/emailVerification';

  /// Represents the route path for the network resource screen.
  static const String networkResource = '/networkResource';

  /// Represents the route path for the password recovery screen.
  static const String recoveryPassword = '/recoveryPassword';

  /// Represents the route path for the pet registration screen.
  static const String petRegistration = '/petRegistration';

  /// Represents the route path for the main profile screen.
  static const String mainProfile = '/mainProfile';

  /// Represents the route path for the personal data screen.
  static const String personalData = '/personalData';

  /// Represents the route path for the pet data screen.
  static const String petData = '/petData';

  /// Represents the route path for the settings screen.
  static const String settings = '/settings';

  /// Represents the route path for the support screen.
  static const String support = '/support';

  /// Represents the route path for the privacy policy screen.
  static const String privacyPolitics = '/privacyPolitics';

  /// Represents the route path for the onboarding screen.
  static const String onBoarding = '/onBoarding';

  /// Represents the route name for the registration complete screen.
  static const String registrationComplete = 'registrationComplete';

  /// Represents the route name for logbooks screen.
  static const String logbooks = '/logbooks';

  /// Represents the route name for resourceDetail screen.
  static const String resourceDetail = '/resourceDetail';

  /// Represents the route name for logbook creation screen.
  static const String logbookCreation = '/logbookCreation';

  /// Represents the route name for logbook detail screen.
  static const String logbookDetail = '/logbookDetail';

  /// Creates a GoRouter instance with defined routes and their corresponding builders.
  GoRouter get appRouter => GoRouter(
        navigatorKey: navKey,
        initialLocation: '/',
        routes: [
          GoRoute(
            path: '/onBoarding',
            name: '/onBoarding',
            builder: (context, state) => const OnBoardingScreen(),
          ),
          GoRoute(
            path: '/registration',
            name: '/registration',
            builder: (context, state) => const RegistrationScreen(),
          ),
          GoRoute(
            path: resourceDetail,
            name: resourceDetail,
            builder: (context, state) => const ResourceFilesScreen(),
          ),
          GoRoute(
            path: '/login',
            name: '/login',
            builder: (context, state) => const LoginScreen(),
          ),
          GoRoute(
            path: logbooks,
            name: logbooks,
            builder: (context, state) => const LogbooksScreen(),
          ),
          GoRoute(
            path: logbookCreation,
            name: logbookCreation,
            builder: (context, state) => const LogbookCreationScreen(),
          ),
          GoRoute(
            path: logbookDetail,
            name: logbookDetail,
            builder: (context, state) => const LogbookDetailScreen(),
          ),
          GoRoute(
            path: newSituation,
            name: newSituation,
            builder: (context, state) => const NewSituationScreen(),
          ),
          GoRoute(
            path: '/emailVerification',
            name: emailVerification,
            builder: (context, state) {
              String email = '';
              try {
                email = (state.extra as Map)['email'];
              } catch (_) {}
              return EmailVerificationScreen(
                email: email,
              );
            },
          ),
          GoRoute(
            path: '/networkResource',
            name: networkResource,
            builder: (context, state) {
              String url = '';
              String? title;
              String? subtitle;
              try {
                url = (state.extra as Map)['url'];
                title = (state.extra as Map)['title'];
                subtitle = (state.extra as Map)['subtitle'];
              } catch (_) {}
              return NetworkResourceView(
                url: url,
                title: title,
                subtitle: subtitle,
              );
            },
          ),
          GoRoute(
            path: '/recoveryPassword',
            name: passwordRecoverForm,
            builder: (context, state) => const PasswordRecoverScreen(),
          ),
          GoRoute(
            path: '/mainProfile',
            name: '/mainProfile',
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            path: '/home',
            name: '/home',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: '/personalData',
            name: '/personalData',
            builder: (context, state) => const PersonalDataScreen(),
          ),
          GoRoute(
            path: '/changePassword',
            name: '/changePassword',
            builder: (context, state) => const ChangePasswordByForm(),
          ),
          GoRoute(
            path: '/settings',
            name: '/settings',
            builder: (context, state) => const SettingsForm(),
          ),
          GoRoute(
            path: '/support',
            name: '/support',
            builder: (context, state) => const Support(),
          ),
          GoRoute(
            path: '/privacyPolitics',
            name: privacyPolitics,
            builder: (context, state) => const PrivacyPolitics(),
          ),
          GoRoute(
            path: '/',
            name: '/',
            builder: (context, state) => LoadingScreen(),
          ),
          GoRoute(
            path: '/registrationComplete',
            name: registrationComplete,
            builder: (context, state) => const RegistrationCompleteScreen(),
          ),
          GoRoute(
            path: '/customMenu',
            name: '/customMenu',
            builder: (context, state) => const CustomBottomNavigationBar(),
          ),
        ],
      );
}
