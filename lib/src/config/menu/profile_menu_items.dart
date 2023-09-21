import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/presentation/widgets/custom_asset_icon.dart';

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
List appMenuItems = <ProfileMenuItem>[
  /// The menu item for personal data.
  ProfileMenuItem(
    title: 'Datos personales',
    link: CustomAppRouter.personalData,
    icon: SvgPicture.asset(
      'assets/svg/icons/person.svg',
      color: FigmaColors.primary_50,
      height: 24,
      width: 24,
    ),
  ),

  /// The menu item for changing the password.
  ProfileMenuItem(
    title: 'Cambiar contraseña',
    link: CustomAppRouter.changePassword,
    icon: SvgPicture.asset(
      'assets/svg/icons/lock.svg',
      color: FigmaColors.primary_50,
      height: 24,
      width: 24,
    ),
  ),

  /// The menu item for notifications.
  ProfileMenuItem(
    title: 'Notificaciones',
    link: CustomAppRouter.notifications,
    icon: SvgPicture.asset(
      'assets/svg/icons/notifications.svg',
      color: FigmaColors.primary_50,
      height: 24,
      width: 24,
    ),
  ),

  /// The menu item for support.
  ProfileMenuItem(
    title: 'Soporte',
    link: CustomAppRouter.support,
    icon: SvgPicture.asset(
      'assets/svg/icons/support.svg',
      color: FigmaColors.primary_50,
      height: 18,
      width: 18,
    ),
  ),

  /// The menu item for privacy policy.
  ProfileMenuItem(
    title: 'Política de privacidad',
    link: CustomAppRouter.privacyPolitics,
    icon: SvgPicture.asset(
      'assets/svg/icons/privacy.svg',
      color: FigmaColors.primary_50,
      height: 24,
      width: 24,
    ),
  ),
];
