import 'package:amacom_app/src/data/repositories/events_repository.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Used to ask for calendar dates from.
final calendarStartDateProvider = StateProvider.autoDispose<DateTime>(
  (ref) => DateTime.now(),
);

/// Used to ask for calendar last visible date.
final calendarEndDateProvider = StateProvider.autoDispose<DateTime>(
  (ref) => DateTime.now(),
);

/// Used to store current calendar events.
final calendarEventsProvider = StateProvider.autoDispose<List<Event>>(
  (ref) => [],
);

/// Used to store current calendar events.
final calendarEventsFProvider = FutureProvider.autoDispose<List<Event>>(
  (ref) async {
    return await ref.read(eventsRepository).getEvents(
          from: ref.read(calendarStartDateProvider),
          to: ref.watch(calendarEndDateProvider),
        );
  },
);
