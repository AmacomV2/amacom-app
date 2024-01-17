import 'package:amacom_app/src/utils/extensions/extensions.dart';

/// Required data to create an Event on server.
class EventDto {
  /// Creates a meeting class with required details.
  EventDto({
    required this.eventName,
    required this.from,
    this.to,
    this.description,
    this.eventTypeId,
    required this.isAllDay,
  });

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// Event description which is equivalent to subject property of [Appointment].
  String? description;

  /// Event id which is equivalent to subject property of [Appointment].
  String? eventTypeId;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime? to;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;

  /// Parse a [LogbookDTO] object into a Map
  Map<String, dynamic> toJson() => {
        'name': eventName.capitalize(),
        'description': description?.capitalize(),
        'eventTypeId': eventTypeId,
        'start': from.toYMDHMS(),
        'end': to?.toYMDHMS(),
      };

  /// Copy with method
  EventDto copyWith({
    String? eventName,
    DateTime? from,
    DateTime? to,
    String? id,
    String? description,
    String? eventTypeId,
    bool? isAllDay,
  }) {
    return EventDto(
      eventName: eventName ?? this.eventName,
      from: from ?? this.from,
      to: to ?? this.to,
      eventTypeId: eventTypeId ?? this.eventTypeId,
      isAllDay: isAllDay ?? this.isAllDay,
    );
  }

  /// Validate dto information
  bool validate() {
    if (to == null) {
      return false;
    }
    if (eventName.isNotEmpty && from.isBefore(to!) && eventTypeId != null) {
      return true;
    }
    return false;
  }
}
