import 'package:amacom_app/src/presentation/state/home/navigation_bar_provider.dart';
import 'package:amacom_app/src/presentation/views/calendar/main_screen.dart';
import 'package:amacom_app/src/presentation/views/screens.dart';
import 'package:amacom_app/src/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:amacom_app/src/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The home page widget of the application.
class HomePage extends ConsumerWidget {
  /// Build constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget body;
    switch (ref.watch(navigationBarProvider)) {
      case NavigationBarSelection.HOME:
        body = const HomeScreen();
        break;
      case NavigationBarSelection.PROFILE:
        body = const ProfileScreen();
        break;
      case NavigationBarSelection.CALENDAR:
        body = const CalendarScreen();
        break;
      case NavigationBarSelection.SITUATIONS:
        body = const SituationsScreen();
        break;
      case NavigationBarSelection.RESOURCES:
        body = const ProfileScreen();
        break;
    }
    return CustomScaffold(
      body: body,
      extendBody: true,
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
