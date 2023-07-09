import 'package:flutter/material.dart';

/// Manage app constant values like radius values, and more
class AppConstants {
  /// card border radius value
  static const double cardRadius = 8;

  /// BLur to apply on images
  static const double imageBlur = 8;

  /// Default app animations curve
  static Curve defaultCurve = Curves.bounceIn;

  /// App Scroll physics
  static const scrollPhysics = BouncingScrollPhysics();

}
