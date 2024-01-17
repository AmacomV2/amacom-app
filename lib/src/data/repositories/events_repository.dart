import 'package:amacom_app/src/data/dataSources/api_data_source.dart';
import 'package:amacom_app/src/domain/dtos/event_dto.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/domain/repositories/events_repository.dart';
import 'package:amacom_app/src/utils/extensions/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Events repo
class EventsRepository implements IEventsRepository {
  /// Repository constructor
  EventsRepository({required this.api});

  /// APiDataSource object
  final ApiDataSource api;

  @override
  Future<List<Event>> getEvents({
    required DateTime from,
    required DateTime to,
  }) async {
    final requestData = RequestData(
      path: '/event/personEvents',
      method: Method.get,
      queryParameters: {
        'from': from.onlyDate(),
        'to': to.onlyDate(),
        'query': '',
      },
    );
    final result = await api.request(
      requestData: requestData,
      withAuthToken: true,
    );
    BaseResponse data;
    try {
      data = BaseResponse.fromJson(result, (json) => Event.fromJsonList(json));
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
  Future<Event> createEvent(EventDto eventData) async {
    final requestData = RequestData(
      path: '/event/create',
      method: Method.post,
      body: eventData.toJson(),
    );
    final result = await api.request(
      requestData: requestData,
      withAuthToken: true,
    );
    BaseResponse data;
    try {
      data =
          BaseResponse.fromJson(result, (json) => Event.fromJson(json as Map));
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
  Future<bool> deleteEvent(String id) {
    // TODO: implement deleteEvent
    throw UnimplementedError();
  }

  @override
  Future<Event> updateEvent(EventDto eventData) {
    // TODO: implement updateEvent
    throw UnimplementedError();
  }
}

/// Events repository riverpod instance
final eventsRepository = Provider.autoDispose<IEventsRepository>(
  (ref) => EventsRepository(api: ref.read(apiProvider)),
);
