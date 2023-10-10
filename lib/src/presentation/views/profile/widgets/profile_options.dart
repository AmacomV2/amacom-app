import 'package:amacom_app/src/config/menu/profile_menu_items.dart';
import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/data/repositories/user_repository.dart';
import 'package:amacom_app/src/presentation/widgets/custom_asset_icon.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Profile options
///
/// Profile options shown on [ProfileScreen]
class ProfileOptions extends StatelessWidget {
  ///
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = GlobalLocator.responsiveDesign;
    final appLocalizations = AppLocalizations.of(context);

    final items = appMenuItems(appLocalizations);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              height: responsive.maxHeightValue(30),
            );
          },
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final menuItem = items[index];
            return _CustomListTile(
              menuItem: menuItem,
              height: responsive.maxHeightValue(80),
            );
          },
        ),
        const Divider(),
        const SafeSpacer(
          height: 12,
        ),
        Consumer(
          builder: (context, ref, child) {
            return CustomButtonWithState(
              adaptiveTextColor: false,
              color: Colors.blue.shade100,
              onTap: () async {
                await ref.read(userRepository).logout();
                Navigation.goTo(
                  CustomAppRouter.login,
                  removeUntil: true,
                );
              },
              text: 'Cerrar sesión',
              // svgPicture: SvgPngToIcon(assetName: 'log_out_outline'),
              svgPicture: const CustomAssetIcon(
                path: 'assets/svg/icons/log_out_outline.svg',
                height: 48,
                width: 48,
              ),
              textColor: Colors.blue,
            );
          },
        ),
        const BottomNavBarSpacer(),
      ],
    );
  }
}

/// Custom ListTile widget for a profile menu item.
class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
    required this.height,
  });

  final ProfileMenuItem menuItem;

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListTile(
        style: Theme.of(context).listTileTheme.style,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 6,
        ),
        leading: menuItem.icon,
        trailing: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: const Color(0x0ffdde9f),
            borderRadius: BorderRadius.circular(500),
          ),
          child: const CustomIconButton(
            borderColor: Colors.white,
            size: 20,
            icon: Icons.arrow_forward_ios_rounded,
          ),
        ),
        title: Text(menuItem.title),
        onTap: () {
          Navigation.goTo(menuItem.link);
        },
      ),
    );
  }
}
