import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Situation selected by user provider
final selectedSituationProvider =
    StateProvider<SituationEntity?>((ref) => null);

/// Situation selected by user provider
final selectedSituationDataIndexProvider = StateProvider<int>((ref) => 0);
