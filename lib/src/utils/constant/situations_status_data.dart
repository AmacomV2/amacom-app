import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:flutter/material.dart';

/// Situations data
///
/// Class to manage situations data like images, text and colors.
class AppSituationsData {
  /// Constant messages per category
  static String statusMessage({
    required String? status,
    required AppLocalizations appLocalizations,
  }) {
    switch (status) {
      case 'COMPLETED':
        return appLocalizations.completed;
      case 'IN_PROGRESS':
        return appLocalizations.inProgress;
      case 'PENDING':
        return appLocalizations.pending;
      default:
        return appLocalizations.received;
    }
  }

  /// Constant messages per category
  static String statusMessageFilter({
    required String? status,
    required AppLocalizations appLocalizations,
  }) {
    switch (status) {
      case 'COMPLETED':
        return appLocalizations.completed;
      case 'IN_PROGRESS':
        return appLocalizations.inProgress;
      case 'PENDING':
        return appLocalizations.pending;
      default:
        return appLocalizations.all;
    }
  }

  /// Constant messages per category
  static String alertMessageFilter({
    required String? status,
    required AppLocalizations appLocalizations,
  }) {
    switch (status) {
      case 'INFORMATION':
        return appLocalizations.information;
      case 'TO_REVIEW':
        return appLocalizations.toReview;
      case 'URGENT':
        return appLocalizations.urgent;
      default:
        return appLocalizations.all;
    }
  }

  ///
  static List<String?> statuses = ['COMPLETED', 'IN_PROGRESS', 'PENDING', null];

  ///
  static List<String?> alerts = ['INFORMATION', 'TO_REVIEW', 'URGENT', null];

  /// Constant messages per category
  static String statusImage(
    String? status,
  ) {
    switch (status) {
      case 'COMPLETED':
        return 'assets/images/approved.png';
      case 'IN_PROGRESS':
        return 'assets/images/working.png';
      case 'PENDING':
        return 'assets/images/mail_viewed.png';
      default:
        return 'assets/images/mail_sent.png';
    }
  }

  /// Color to each category
  static Map<dynamic, Color> categoriesColor = const {
    'COMPLETED': FigmaColors.success_600,
    'IN_PROGRESS': FigmaColors.warning_600,
    'PENDING': FigmaColors.danger_700,
    '': FigmaColors.danger_700,
    null: FigmaColors.danger_700,
  };
}
