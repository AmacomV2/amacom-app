import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
final selectedEventProvider = StateProvider.autoDispose<Event?>((ref) => null);
