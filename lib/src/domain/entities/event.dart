import 'package:amacom_app/src/utils/extensions/extensions.dart';
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
    required this.eventTypeId,
    required this.isAllDay,
  });

  ///
  factory Event.fromJson(Map json) => Event(
        id: json['id'],
        isAllDay: json['allDay'],
        eventName: json['name'],
        description: json['description'],
        eventTypeId: json['eventTypeId'],
        to: DateTime.parse(json['end']),
        from: DateTime.parse(json['start']),
        background: HexColor.fromHex(json['eventColor']),
      );

  /// Event name which is equivalent to subject property of [Event].
  String eventName;

  /// Event description which is equivalent to subject property of [Event].
  String? description;

  /// Event description which is equivalent to subject property of [Event].
  String eventTypeId;

  /// Event id which is equivalent to subject property of [Event].
  String id;

  /// From which is equivalent to start time property of [Event].
  DateTime from;

  /// To which is equivalent to end time property of [Event].
  DateTime to;

  /// Background which is equivalent to color property of [Event].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Event].
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

  /// Copy with method
  Event copyWith({
    String? eventName,
    DateTime? from,
    DateTime? to,
    String? description,
    String? eventTypeId,
    bool? isAllDay,
  }) {
    return Event(
      id: id,
      background: background,
      eventName: eventName ?? this.eventName,
      description: description ?? this.description,
      from: from ?? this.from,
      to: to ?? this.to,
      eventTypeId: eventTypeId ?? this.eventTypeId,
      isAllDay: isAllDay ?? this.isAllDay,
    );
  }

  /// Parse a [EventDto] object into a Map
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': eventName.capitalize(),
        'description': description?.capitalize(),
        'eventTypeId': eventTypeId,
        'start': from.toYMDHMS(),
        'end': to.toYMDHMS(),
      };

  /// Validate dto information
  bool validate() {
    if (eventName.isNotEmpty && from.isBefore(to)) {
      return true;
    }
    return false;
  }
}
