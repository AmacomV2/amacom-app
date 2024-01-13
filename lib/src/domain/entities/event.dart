import 'package:amacom_app/src/utils/extensions/color_hex_extension.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Event {
  /// Creates a meeting class with required details.
  Event({
    required this.eventName,
    required this.from,
    required this.to,
    required this.id,
    this.description,
    required this.background,
    required this.isAllDay,
  });

  ///
  factory Event.fromJson(Map json) => Event(
        id: json['id'],
        isAllDay: json['allDay'],
        eventName: json['name'],
        description: json['description'],
        to: DateTime.parse(json['end']),
        from: DateTime.parse(json['start']),
        background: HexColor.fromHex(json['eventColor']),
      );

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// Event description which is equivalent to subject property of [Appointment].
  String? description;

  /// Event id which is equivalent to subject property of [Appointment].
  String id;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;

  /// Parse a list of entities from a Json List<Map>
  static List<Event> fromJsonList(dynamic data) {
    final List<Event> result = [];

    try {
      for (var element in (data as List)) {
        try {
          result.add(Event.fromJson(element as Map));
        } catch (e) {
          GlobalLocator.appLogger.e(e);
        }
      }
    } catch (e) {
      GlobalLocator.appLogger.e(e);
    }

    return result;
  }
}
