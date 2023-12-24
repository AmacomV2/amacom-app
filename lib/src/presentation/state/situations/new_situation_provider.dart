import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// New situation page index provider
final newSituationIndexProvider = StateProvider.autoDispose<int>((ref) => 0);

/// New situation page index provider
final affectationDegreeProvider = StateProvider<int?>((ref) => null);

/// New situation subjects provider
final situationSubjectsProvider =
    StateProvider<List<SubjectEntity>>((ref) => []);

/// New situation feelings provider
final situationFeelingsProvider = StateProvider<List<GenericData>>((ref) => []);
