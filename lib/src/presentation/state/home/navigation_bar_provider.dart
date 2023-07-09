
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amacom_app/src/domain/entities/navigation_bar_selection.dart';
export 'package:amacom_app/src/domain/entities/navigation_bar_selection.dart';


/// Home navigation state
final navigationBarProvider = StateProvider<NavigationBarSelection>(
  (ref) => NavigationBarSelection.HOME,
);