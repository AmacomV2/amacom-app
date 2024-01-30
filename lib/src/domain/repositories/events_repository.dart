import 'package:amacom_app/src/domain/dtos/event_dto.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';

/// Events repository interface
abstract class IEventsRepository {
  /// Perform Events search and fetch
  Future<List<Event>> getEvents({
    required DateTime from,
    required DateTime to,
  });

  /// Perform Event creation
  Future<Event> createEvent(EventDto eventData);

  /// Perform Event updating
  Future<Event> updateEvent(Event eventData);

  /// Perform Event delete
  Future<bool> deleteEvent(String id);
}
