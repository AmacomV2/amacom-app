// ignore_for_file: deprecated_member_use

import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Represents a menu item in the user profile.
class ProfileMenuItem {
  /// Creates a [ProfileMenuItem] with the specified properties.
  ///
  /// The [title] is the main title of the menu item.
  ///
  /// The [subTitle] is an optional subtitle for the menu item.
  ///
  /// The [link] is the route or link associated with the menu item.
  ///
  /// The [icon] is the icon displayed for the menu item.
  ProfileMenuItem({
    required this.title,
    this.subTitle,
    required this.link,
    required this.icon,
  });

  /// The main title of the menu item.
  final String title;

  /// An optional subtitle for the menu item.
  final String? subTitle;

  /// The route or link associated with the menu item.
  final String link;

  /// The icon displayed for the menu item.
  final dynamic icon;
}

/// A list of predefined menu items for the user profile.
List<ProfileMenuItem> appMenuItems(AppLocalizations? appLocalizations) {
  return [
    /// The menu item for personal data.
    ProfileMenuItem(
      title: appLocalizations?.personalData ?? '',
      link: CustomAppRouter.personalData,
      icon: SvgPicture.asset(
        'assets/svg/icons/person.svg',
        color: FigmaColors.primary_50,
        height: 24,
        width: 24,
      ),
    ),

    /// The menu item for privacy policy.
    ProfileMenuItem(
      title: appLocalizations?.logbook ?? 'Mi diario',
      link: CustomAppRouter.privacyPolitics,
      icon: SvgPicture.asset(
        'assets/svg/icons/privacy.svg',
        color: FigmaColors.primary_50,
        height: 24,
        width: 24,
      ),
    ),

    /// The menu item for changing the password.
    ProfileMenuItem(
      title: appLocalizations?.changePassword ?? 'Cambiar contraseña',
      link: CustomAppRouter.changePassword,
      icon: SvgPicture.asset(
        'assets/svg/icons/lock.svg',
        color: FigmaColors.primary_50,
        height: 24,
        width: 24,
      ),
    ),

    /// The menu item for support.
    ProfileMenuItem(
      title: appLocalizations?.support ?? 'Soporte',
      link: CustomAppRouter.support,
      icon: SvgPicture.asset(
        'assets/svg/icons/support.svg',
        color: FigmaColors.primary_50,
        height: 18,
        width: 18,
      ),
    ),
  ];
}
