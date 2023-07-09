import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:logger/logger.dart';

import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  final getIt = GetIt.instance;
  getIt.registerLazySingleton<Logger>(
    () => Logger(),
  );
  getIt.registerLazySingleton<GlobalKey<NavigatorState>>(
    () => GlobalKey<NavigatorState>(),
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

/// My App initial page
class MyApp extends StatelessWidget {
  /// Constructor
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.instance;
    if (!getIt.isRegistered<ResponsiveDesign>()) {
      getIt.registerLazySingleton<ResponsiveDesign>(
        () => ResponsiveDesign(context),
      );
    }
    if (!getIt.isRegistered<GoRouter>()) {
      getIt.registerLazySingleton<GoRouter>(
        () => CustomAppRouter(navKey: getIt.get<GlobalKey<NavigatorState>>())
            .appRouter,
      );
    }
    debugInvertOversizedImages = true;
    // final routes = Routes.getRoutes();
    return MaterialApp.router(
      routerConfig: getIt.get<GoRouter>(),
      title: 'AmacomApp',
      debugShowCheckedModeBanner: false,
      theme: globalTheme(),
    );
  }
}
