import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// New situation subjects provider
final selectedSubject =
    StateProvider.autoDispose<SubjectEntity?>((ref) => null);
