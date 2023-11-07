import 'package:amacom_app/src/domain/entities/logbook.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Logbook selected by user provider
final selectedLogbookProvider = StateProvider<Logbook?>((ref) => null);
