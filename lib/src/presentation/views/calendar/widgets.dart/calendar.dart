import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/data/repositories/events_repository.dart';
import 'package:amacom_app/src/domain/dtos/event_dto.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/events/calendar_view.dart';
import 'package:amacom_app/src/presentation/state/events/new_event.dart';
import 'package:amacom_app/src/presentation/state/events/selected_event.dart';
import 'package:amacom_app/src/presentation/views/calendar/widgets.dart/edit_event.dart';
import 'package:amacom_app/src/presentation/views/calendar/widgets.dart/new_event.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// Calendar with its events
class Calendar extends ConsumerStatefulWidget {
  ///
  const Calendar({super.key});

  @override
  ConsumerState<Calendar> createState() => _CalendarState();
}

class _CalendarState extends ConsumerState<Calendar> {
  final responsive = GlobalLocator.responsiveDesign;
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    final eventsList = ref.watch(calendarEventsProvider);
    final textTheme = Theme.of(context).textTheme;
    ref.watch(selectedEventProvider);
    return SizedBox(
      height: double.infinity,
      child: SfCalendar(
        allowDragAndDrop: true,
        view: kIsWeb ? CalendarView.week : CalendarView.day,
        todayTextStyle: textTheme.bodyMedium?.copyWith(
          color: Colors.white,
        ),
        headerStyle: CalendarHeaderStyle(
          textStyle: textTheme.bodyLarge?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        dataSource: EventDataSource(eventsList),
        // by default the month appointment display mode set as Indicator, we can
        // change the display mode as appointment using the appointment display
        // mode property
        monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
        ),
        showDatePickerButton: true,

        onTap: (calendarTapDetails) async {
          if (calendarTapDetails.appointments?.isNotEmpty ?? false) {
            await _editEvent(
              appLocalizations: appLocalizations,
              event: calendarTapDetails.appointments?.first,
            );
          } else {
            await _newEvent(calendarTapDetails.date!, appLocalizations);
          }
        },
        onViewChanged: (viewDetails) async {
          final events = await ref.read(eventsRepository).getEvents(
                from: viewDetails.visibleDates.first,
                to: viewDetails.visibleDates.last.add(const Duration(days: 1)),
              );
          ref.read(calendarEventsProvider.notifier).update((state) => events);
        },
        allowedViews: const [
          if (!kIsWeb) CalendarView.day,
          CalendarView.week,
          CalendarView.month,
        ],
      ),
    );
  }

  Future<void> _newEvent(
    DateTime from,
    AppLocalizations? appLocalizations,
  ) async {
    ref.read(eventCreationProvider.notifier).update(
          (state) => EventDto(
            eventName: '',
            from: from,
            eventTypeId: null,
            isAllDay: false,
          ),
        );
    await AppDialogs.genericDialog(
      buttonText: appLocalizations?.save ?? '',
      padding: EdgeInsets.zero,
      includeButton: false,
      widget: const NewEvent(),
    );
  }

  Future<void> _editEvent({
    required AppLocalizations? appLocalizations,
    required Event event,
  }) async {
    ref.read(selectedEventProvider.notifier).update(
          (state) => event,
        );
    await AppDialogs.genericDialog(
      buttonText: appLocalizations?.save ?? '',
      padding: EdgeInsets.zero,
      includeButton: false,
      widget: const EditEvent(),
    );
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class EventDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  EventDataSource(List<Event> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getEventData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getEventData(index).to;
  }

  @override
  String getSubject(int index) {
    return '${_getEventData(index).eventName}\n${_getEventData(index).description ?? ""}';
  }

  @override
  Color getColor(int index) {
    return _getEventData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getEventData(index).isAllDay;
  }

  Event _getEventData(int index) {
    final Event meeting = appointments![index];

    return meeting;
  }
}
