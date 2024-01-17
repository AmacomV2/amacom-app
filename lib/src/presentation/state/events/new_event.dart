import 'package:amacom_app/src/domain/dtos/event_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Event creation provider
final eventCreationProvider = StateProvider<EventDto>(
  (ref) => EventDto(
    eventName: '',
    from: DateTime.now(),
    eventTypeId: '',
    isAllDay: false,
  ),
);
