/// Custom string extensions
extension StringExtension on String {
  /// Capitalize string
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// know if string is url
  bool isUrl() {
    return Uri.parse(this).isAbsolute;
  }
}
