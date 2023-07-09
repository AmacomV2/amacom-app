import 'package:flutter/material.dart';

//// Class to access app different durations
class AppDurations {
  /// Commonly used animation duration
  static const animation = Duration(milliseconds: 100);

  /// Commonly used animation duration
  static const longAnimation = Duration(milliseconds: 1000);

  /// Commonly used animation duration
  static const midAnimation = Duration(milliseconds: 500);

  /// Commonly used animation duration
  static const retryDelay = Duration(milliseconds: 1000);

  /// Commonly used animation duration
  static const timeout = Duration(milliseconds: 5000);

  /// Commonly used on button state change duration
  static const buttonStateChange = Duration(milliseconds: 1000);

  /// Commonly used on button state change duration
  static const buttonStateChangeLonger = Duration(milliseconds: 1500);

  /// Commonly used on button state change duration
  static const favoriteLoadingDelay = Duration(milliseconds: 2300);

  /// Commonly used on button state change duration
  static const longerDelay = Duration(milliseconds: 3000);

  /// Commonly used on timeouts
  static const timeoutLonger = Duration(milliseconds: 8000);

  /// Commonly used on page build duration
  static const pageBuild = Duration(milliseconds: 1000);

  /// Commonly used on long message popups
  static const longMessagePopUp = Duration(milliseconds: 4000);

  /// Retry delay future
  static Future<void> retryDelayFuture({VoidCallback? action}) async {
    await Future.delayed(retryDelay, action);
  }

  /// Page navigation with delay
  static Future<void> pageNavigationDelay({VoidCallback? action}) async {
    await Future.delayed(const Duration(seconds: 30), action);
  }
}
