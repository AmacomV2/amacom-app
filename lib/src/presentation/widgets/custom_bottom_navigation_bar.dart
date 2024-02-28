import 'package:amacom_app/src/presentation/widgets/mobile_nav_bar.dart';
import 'package:amacom_app/src/presentation/widgets/web_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

/// Home App navigation bar
class CustomBottomNavigationBar extends StatelessWidget {
  ///
  const CustomBottomNavigationBar({super.key, this.web = false});

  ///
  final bool web;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: const MobileNavBar(),
      web: const WebNavBar(),
    );
  }
}
