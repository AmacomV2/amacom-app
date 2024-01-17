import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Resource selected by user provider
final selectedResourceProvider = StateProvider<GenericData?>((ref) => null);
