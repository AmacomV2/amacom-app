import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart' hide ContextExtensions;

import 'package:amacom_app/src/utils/utils/utils.dart';
export 'package:amacom_app/src/config/routes.dart';
export 'package:amacom_app/src/config/router/router.dart';

/// Perform non async navigation task
class Navigation {
  /// Go to Home
  static goHome({
    bool removeUntil = true,
  }) {
    final showTutorial = getBoolAsync('show_tutorial', defaultValue: true);
    String route = CustomAppRouter.home;
    if (showTutorial) {
      route = CustomAppRouter.welcome;
    }
    if (removeUntil) {
      goTo(
        route,
        removeUntil: true,
      );
    } else {
      goTo(
        route,
        replacement: true,
      );
    }
  }

  /// Navigator.pop custom implementation
  static goBack({VoidCallback? callback}) {
    final context = GlobalLocator.appNavigator.currentContext;
    callback?.call();
    if (context?.canPop() ?? false) {
      context?.pop();
    }
  }

  /// Go to verification code screen
  static goVerificationCodeScreen() {
    goTo(
      CustomAppRouter.verificationCode,
    );
  }

  /// Go to named route
  static goTo(
    String route, {
    bool removeUntil = false,
    bool replacement = false,
    Map<String, dynamic> extra = const {},
  }) {
    final context = GlobalLocator.appNavigator.currentContext;
    Future.delayed(Duration.zero, () {
      if (removeUntil) {
        if (context?.canPop() ?? false) {
          context?.pop();
        }
        context?.replace(
          route,
          // queryParameters: arguments,
          extra: extra,
        );
      } else if (replacement) {
        context?.pushReplacementNamed(
          route,
          extra: extra,
        );
      } else {
        context?.pushNamed(
          route,
          extra: extra,
        );
      }
    });
  }
}
