
import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:flutter/material.dart';

/// Manage such things like situations text, colors and more
class SituationStatusUtils{

  /// Situation 
  static String situationStatusText(AppLocalizations appLocalizations, int state){
    switch (state) {
      case 0:
        return appLocalizations.pending;
      case 1:
        
        return appLocalizations.inReview;
      case 2:
        
        return appLocalizations.completed;
      default:
      return 'N.A';
    }
  }
  /// Situation 
  static Color situationStatusColor(int state){
    switch (state) {
      case 0:
        return FigmaColors.danger_400;
      case 1:
        
        return FigmaColors.warning_600;
      case 2:
        
        return FigmaColors.success_400;
      default:
      return Colors.grey;
    }
  }

}