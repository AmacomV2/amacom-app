import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';

/// App validation functions
class AppValidations {
  /// Validate if a string is an e-mail and if ends in .co or .com
  static String? validateEmail(String? email) {
    bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+\.[a-zA-Z]+",
    ).hasMatch(email ?? '');
    if (!emailValid) {
      return 'Dirección de correo electrónico no válida';
    }
    return null;
  }

  /// Validate if a string is a phone number with 10 len chars
  static String? validatePhone(String? phone) {
    if ((phone ?? '').isEmpty) return null;
    if (!isNumeric(phone) && (phone ?? '').length != 10) {
      return 'Número de teléfono no válido';
    }
    return null;
  }

  /// Check if string is numeric
  static bool isNumeric(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  /// Validate if a given string contains at least 1 letter, 1 number and len 6-8.
  static String? validatePassword(
    String? password, {
    AppLocalizations? appLocalizations,
  }) {
    if (password?.isEmpty ?? true) {
      return appLocalizations?.fieldRequired;
    } else {
      bool hasUppercase = password?.contains(RegExp(r'[A-Z]')) ?? false;
      bool hasDigits = password?.contains(RegExp(r'[0-9]')) ?? false;
      bool hasLowercase = password?.contains(RegExp(r'[a-z]')) ?? false;
      bool hasMinLength = (password?.length ?? 0) >= 6;
      if (!hasMinLength) {
        // if (!hasMinLength) {
        return appLocalizations?.passwordMinLen;
      }
      if (!hasDigits) {
        return appLocalizations?.passwordContainDigit;
      }
      if (!(hasUppercase || hasLowercase)) {
        return appLocalizations?.passwordCharsCap;
      }
    }
    return null;
  }

  /// Checks if field is not empty
  static String? notEmptyFieldValidation(Object? value, {String? message}) {
    if (value is String?) {
      if (value == null || value.isEmpty) {
        return message ?? AppMessages.fieldRequired;
      }
      return null;
    }
    // ignore: unnecessary_null_comparison
    if (value == null) {
      return message ?? AppMessages.fieldRequired;
    }
    return null;
  }
}
