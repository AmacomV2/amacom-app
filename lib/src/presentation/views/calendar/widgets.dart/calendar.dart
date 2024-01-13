import 'package:amacom_app/src/data/repositories/events_repository.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/events/calendar_view.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
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
    return SizedBox(
      height: responsive.maxHeightValue(800),
      child: SfCalendar(
        allowDragAndDrop: true,
        view: CalendarView.day,
        dataSource: EventDataSource(ref.watch(calendarEventsProvider)),
        // by default the month appointment display mode set as Indicator, we can
        // change the display mode as appointment using the appointment display
        // mode property
        monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
        ),
        showDatePickerButton: true,
        onSelectionChanged: (selection) {},
        onTap: (calendarTapDetails) {
          if (calendarTapDetails.appointments?.isNotEmpty ?? false) {}
        },
        onViewChanged: (viewDetails) async {
          final events = await ref.read(eventsRepository).getEvents(
                from: viewDetails.visibleDates.first,
                to: viewDetails.visibleDates.last.add(const Duration(days: 1)),
              );
          ref.read(calendarEventsProvider.notifier).update((state) => events);
        },
        allowedViews: const [
          CalendarView.day,
          CalendarView.week,
          CalendarView.month,
        ],
      ),
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
    return _getEventData(index).eventName;
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
