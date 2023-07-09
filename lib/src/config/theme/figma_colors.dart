import 'package:flutter/material.dart';

/// Class to get directly app Colors used on design
class FigmaColors {
  /// Background color
  static const Color background = Color(0xffededf4);

  /// Secondary color variant
  static const Color secondary_50 = Color(0xfffbfbfb);

  /// Secondary color variant

  static const Color secondary_100 = Color(0xffdbdbdb);

  /// Secondary color variant

  static const Color secondary_200 = Color(0xffbbbbbb);

  /// Secondary color variant

  static const Color secondary_300 = Color(0xff989898);

  /// Secondary color

  static const Color secondary_500 = Color(0xff323231);

  /// Primary color variant
  static const Color primary_50 = Color(0xffebf1ff);

  /// Primary color variant
  static const Color primary_100 = Color(0xffdde9ff);

  /// Primary color variant
  static const Color primary_200 = Color(0xff95bcff);

  /// Primary color variant
  static const Color primary_300 = Color(0xff3377ff);

  /// Primary color
  static const Color primary_400 = Color(0xff1c418c);

  /// Primary color variant
  static const Color information_50 = Color(0xfff2f7fe);

  /// Information color variant
  static const Color information_100 = Color(0xffd6e5fd);

  /// Information color variant

  static const Color information_500 = Color(0xff7cabf9);

  /// Information color

  static const Color information_800 = Color(0xff445e89);

  /// Danger color variant

  static const Color danger_50 = Color(0xfffdecec);

  /// Danger color variant

  static const Color danger_100 = Color(0xfffac5c5);

  /// Danger color variant

  static const Color danger_400 = Color(0xfff26969);

  /// Danger color

  static const Color danger_700 = Color(0xffaa3030);

  /// Success color variant

  static const Color success_50 = Color(0xffe7f7f5);

  /// Success color variant

  static const Color success_100 = Color(0xffb5e7e0);

  /// Success color variant

  static const Color success_400 = Color(0xff41c1af);

  /// Success color

  static const Color success_600 = Color(0xff0fa18d);

  /// Warning color variant

  static const Color warning_50 = Color(0xfffff7eb);

  /// Warning color variant

  static const Color warning_100 = Color(0xffffe6c0);

  /// Warning color variant

  static const Color warning_200 = Color(0xffffd9a1);

  /// Warning color

  static const Color warning_600 = Color(0xffe89d2e);

  /// Given a background color, determines which font color
  /// to use
  static Color getFontColorForBackground(
    Color background, {
    double luminanceThreshold = 0.55,
    Color? lightColor,
    Color? darkColor,
  }) {
    final luminance = background.computeLuminance();
    return (luminance > luminanceThreshold)
        ? (darkColor ?? primary_300)
        : (lightColor ?? secondary_50);
  }

  /// Check if color is dark or light
  static bool isDarkColor(Color color, {double luminanceThreshold = 0.55}) {
    final luminance = color.computeLuminance();
    return !(luminance > luminanceThreshold);
  }

  /// Evaluate if color is dark
  static bool darkBackground(Color background) {
    return (background.computeLuminance() < 0.5);
  }
}
