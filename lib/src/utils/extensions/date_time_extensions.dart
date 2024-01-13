import 'package:amacom_app/src/utils/extensions/extensions.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

/// Custom dateTime extensions
extension DateOnlyCompare on DateTime {
  /// Compare two datesTimes only date
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  /// Compare two datesTimes with >= condition
  bool isAfterDay(DateTime other) {
    return year >= other.year && month >= other.month && day >= other.day;
  }

  /// Compare two datesTimes with >= condition
  bool isAfterOrSameDay(DateTime other) {
    return year >= other.year && month >= other.month && day > other.day;
  }

  /// Compare two datesTimes with < condition
  bool isBeforeDay(DateTime other) {
    return year <= other.year && month <= other.month && day < other.day;
  }

  /// Compare two datesTimes with <= condition
  bool isBeforeOrSameDay(DateTime other) {
    return year <= other.year && month <= other.month && day <= other.day;
  }

  /// check if dateBefore<=date<dateAfter,
  bool isBetWeen(DateTime before, DateTime after) {
    return isAfterDay(
          before,
        ) &&
        isBeforeDay(
          after,
        );
  }

  /// check if dateBefore<=date<dateAfter,
  bool isBetWeenDateTime(DateTime before, DateTime after) {
    if (isSameDay(before) && isSameDay(after)) {
      if (hour >= before.hour && hour <= after.hour) {
        return true;
      }
    }
    return false;
  }

  /// check if dateBefore<=date<dateAfter,
  bool isBetWeenDates(DateTime before, DateTime after) {
    return isAfterDay(
          before,
        ) &&
        isBeforeOrSameDay(
          after,
        );
  }
}

/// Custom dateTime extensions
extension DateToText on DateTime {
  /// get date converted into String
  String asText(String locale) {
    final formatter = DateFormat('yMMMMEEEEd', locale);
    return formatter.format(this).capitalizeEachWord().replaceAll('De', 'de');
  }

  ///
  String monthText(String locale) {
    final formatter = DateFormat('MMMM', locale);
    return formatter.format(this).capitalize();
  }

  ///
  String monthTextShort(String locale) {
    final formatter = DateFormat('MMM', locale);
    return formatter.format(this).capitalize();
  }

  ///
  String timeToText() {
    final formatter = DateFormat('jm');
    return formatter.format(this).capitalize();
  }

  ///
  String onlyDate() {
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(this).capitalize();
  }
}
