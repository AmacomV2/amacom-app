import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amacom_app/src/config/theme/figma_colors.dart';

/// Custom Scaffold
///
/// Its a normal scaffold who sets [SystemUIOverlayStyle] based on
/// background color of itself

class CustomScaffold extends StatelessWidget {
  /// Widget constructor
  const CustomScaffold({
    super.key,
    this.appBar,
    this.body,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.drawer,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.resizeToAvoidBottomInset,
    this.extendBody = false,
  });

  /// Scaffold appBar
  final PreferredSizeWidget? appBar;

  /// Scaffold body
  final Widget? body;

  /// Scaffold backgroundColor
  final Color? backgroundColor;

  /// Scaffold bottomNavigationBar
  final Widget? bottomNavigationBar;

  /// Scaffold bottomSheet
  final Widget? bottomSheet;

  /// Scaffold element
  final Widget? drawer;

  /// Scaffold element
  final Widget? floatingActionButton;

  /// Scaffold element
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Scaffold element
  final bool? resizeToAvoidBottomInset;

  final bool extendBody;
  @override
  Widget build(BuildContext context) {
    final scaffoldBackground = Theme.of(context).scaffoldBackgroundColor;
    SystemChrome.setSystemUIOverlayStyle(
      (FigmaColors.isDarkColor(backgroundColor ?? scaffoldBackground))
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
    );
    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor,
      extendBody: extendBody,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      drawer: drawer,
      bottomSheet: bottomSheet,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}
