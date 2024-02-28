import 'package:amacom_app/src/data/repositories/situation_repository.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Situation selected by user provider
final selectedSituationProvider =
    StateProvider<SituationEntity?>((ref) => null);

/// Situation selected by user provider
final selectedSituationAllDataProvider =
    FutureProvider.autoDispose<SituationEntity?>((ref) async {
  return await ref
      .read(situationsRepository)
      .getData(id: ref.read(selectedSituationProvider)?.id ?? '');
});

/// Situation selected by user provider
final selectedSituationDataIndexProvider =
    StateProvider.autoDispose<int>((ref) => 0);
