import 'package:amacom_app/src/data/dataSources/api_data_source.dart';
import 'package:amacom_app/src/domain/entities/baseResponse/base_response.dart';
import 'package:amacom_app/src/domain/entities/generic_data.dart';
import 'package:amacom_app/src/domain/entities/request_data.dart';
import 'package:amacom_app/src/domain/repositories/forms_data_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// FormsData repo
class FormsDataRepository implements IFormsDataRepository {
  /// Repository constructor
  FormsDataRepository({required this.api});

  /// APiDataSource object
  final ApiDataSource api;

  @override
  Future<List<GenericData>> civilStatuses() async {
    final requestData = RequestData(
      path: '/civilStatus/getAll',
      method: Method.get,
    );
    final result = await api.request(
      requestData: requestData,
      withAuthToken: false,
    );
    BaseResponse data;
    try {
      data = BaseResponse.fromJson(
        result,
        (json) => GenericData.fromJsonList(json),
      );
    } catch (e) {
      data = BaseResponse.fromJson(result, (_) {});
    }
    if (!data.ok) {
      throw Exception(data.message);
    } else {
      return data.data;
    }
  }

  @override
  Future<List<GenericData>> documentTypes() async {
    final requestData = RequestData(
      path: '/documentType/getAll',
      method: Method.get,
    );
    final result = await api.request(
      requestData: requestData,
      withAuthToken: false,
    );
    BaseResponse data;
    try {
      data = BaseResponse.fromJson(
        result,
        (json) => GenericData.fromJsonList(json),
      );
    } catch (e) {
      data = BaseResponse.fromJson(result, (_) {});
    }
    if (!data.ok) {
      throw Exception(data.message);
    } else {
      return data.data;
    }
  }

  @override
  Future<List<GenericData>> genders() async {
    final requestData = RequestData(
      path: '/genders/getAll',
      method: Method.get,
    );
    final result = await api.request(
      requestData: requestData,
      withAuthToken: false,
    );
    BaseResponse data;
    try {
      data = BaseResponse.fromJson(
        result,
        (json) => GenericData.fromJsonList(json),
      );
    } catch (e) {
      data = BaseResponse.fromJson(result, (_) {});
    }
    if (!data.ok) {
      throw Exception(data.message);
    } else {
      return data.data;
    }
  }

  @override
  Future<List<GenericData>> eventTypes() async {
    final requestData = RequestData(
      path: '/eventType/getAll',
      method: Method.get,
    );
    final result = await api.request(
      requestData: requestData,
      withAuthToken: true,
    );
    BaseResponse data;
    try {
      data = BaseResponse.fromJson(
        result,
        (json) => GenericData.fromJsonList(json),
      );
    } catch (e) {
      data = BaseResponse.fromJson(result, (_) {});
    }
    if (!data.ok) {
      throw Exception(data.message);
    } else {
      return data.data;
    }
  }
}

/// Forms data repository riverpod instance
final formsDataRepository = Provider.autoDispose<IFormsDataRepository>(
  (ref) => FormsDataRepository(api: ref.read(apiProvider)),
);
