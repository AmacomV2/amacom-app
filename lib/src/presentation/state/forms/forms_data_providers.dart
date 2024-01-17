import 'package:amacom_app/src/data/repositories/forms_data_repository.dart';
import 'package:amacom_app/src/domain/entities/generic_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Document types list provider
final documentTypesProvider =
    FutureProvider.autoDispose<List<GenericData>>((ref) async {
  return await ref.read(formsDataRepository).documentTypes();
});

/// Genders list provider
final gendersProvider =
    FutureProvider.autoDispose<List<GenericData>>((ref) async {
  return await ref.read(formsDataRepository).genders();
});

/// Civil statuses list provider
final civilStatusesProvider =
    FutureProvider.autoDispose<List<GenericData>>((ref) async {
  return await ref.read(formsDataRepository).civilStatuses();
});

/// Event types list provider
final eventTypesProvider =
    FutureProvider.autoDispose<List<GenericData>>((ref) async {
  return await ref.read(formsDataRepository).eventTypes();
});
