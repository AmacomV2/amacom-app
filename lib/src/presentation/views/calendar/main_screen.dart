import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/views/calendar/widgets.dart/widgets.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/global_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// The hove page which hosts the calendar
class CalendarScreen extends ConsumerWidget {
  /// Creates the home page to display teh calendar widget.
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = GlobalLocator.responsiveDesign;
    final appLocalizations = AppLocalizations.of(context);

    return CustomScaffold(
      body: SizedBox(
        height: responsive.screenHeight,
        child: ColumnWithPadding(
          padding: responsive.horizontalPadding(10),
          children: [
            CustomAppBar(
              includeBackArrow: false,
              title: appLocalizations?.agenda,
              centerTitle: true,
              titleIcon: const ImageIcon(
                AssetImage(
                  'assets/icon/calendar.png',
                ),
                size: 22,
              ),
            ),
            const Expanded(
              child: Column(
                children: [
                  Expanded(child: Calendar()),
                  BottomNavBarSpacer(),
                ],
              ),
            ),
          ],
        ),
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
    final dynamic meeting = appointments![index];
    late final Event meetingData;
    if (meeting is Event) {
      meetingData = meeting;
    }

    return meetingData;
  }
}
