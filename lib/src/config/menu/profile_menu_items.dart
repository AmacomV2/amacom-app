import 'package:amacom_app/src/presentation/widgets/custom_asset_icon.dart';

import 'package:amacom_app/src/utils/utils/utils.dart';

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
  const ProfileMenuItem({
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
  const ProfileMenuItem(
    title: 'Datos personales',
    link: CustomAppRouter.personalData,
    icon: CustomAssetIcon(
      path: 'assets/svg/icons/person.svg',
      height: 24,
      width: 24,
    ),
  ),

  /// The menu item for changing the password.
  const ProfileMenuItem(
    title: 'Cambiar contraseña',
    link: CustomAppRouter.changePassword,
    icon: CustomAssetIcon(
      path: 'assets/svg/icons/lock.svg',
      height: 24,
      width: 24,
    ),
  ),

  /// The menu item for notifications.
  const ProfileMenuItem(
    title: 'Notificaciones',
    link: CustomAppRouter.notifications,
    icon: CustomAssetIcon(
      path: 'assets/svg/icons/notifications.svg',
      height: 24,
      width: 24,
    ),
  ),

  /// The menu item for support.
  const ProfileMenuItem(
    title: 'Soporte',
    link: CustomAppRouter.support,
    icon: CustomAssetIcon(
      path: 'assets/svg/icons/support.svg',
      height: 18,
      width: 18,
    ),
  ),

  /// The menu item for privacy policy.
  const ProfileMenuItem(
    title: 'Política de privacidad',
    link: CustomAppRouter.privacyPolitics,
    icon: CustomAssetIcon(
      path: 'assets/svg/icons/privacy.svg',
      height: 24,
      width: 24,
    ),
  ),
];
