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
  bool isBetWeenDates(DateTime before, DateTime after) {
    return isAfterDay(
          before,
        ) &&
        isBeforeOrSameDay(
          after,
        );
  }
}
