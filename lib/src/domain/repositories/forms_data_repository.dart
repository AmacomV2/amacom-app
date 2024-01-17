import 'package:amacom_app/src/domain/entities/generic_data.dart';

/// Logbooks repository interface
abstract class IFormsDataRepository {
  /// Get document types
  Future<List<GenericData>> documentTypes();

  /// Get civil statuses
  Future<List<GenericData>> civilStatuses();

  /// Get civil statuses
  Future<List<GenericData>> genders();

  /// Get civil statuses
  Future<List<GenericData>> eventTypes();
}
