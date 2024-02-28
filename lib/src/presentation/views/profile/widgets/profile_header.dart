import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/authentication/user_provider.dart';
import 'package:amacom_app/src/presentation/views/profile/widgets/user_image.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Profile screen header
///
/// Shows user name and user avatar
class ProfileHeader extends ConsumerWidget {
  ///
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final responsiveD = GlobalLocator.responsiveDesign;
    final appLocalizations = AppLocalizations.of(context);

    return Column(
      children: [
        CustomAppBar(
          title: appLocalizations?.myProfile,
          includeBackArrow: false,
          centerTitle: true,
          titleIcon: const ImageIcon(
            AssetImage(
              'assets/icon/user-settings.png',
            ),
            size: 20,
          ),
          action: CustomIconButton(
            size: 22,
            icon: Icons.settings,
            onTap: () => Navigation.goTo(CustomAppRouter.settings),
          ),
        ),
        Stack(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: responsiveD.maxHeightValue(53)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.bodyContainersRadius),
                  topRight: Radius.circular(AppSizes.bodyContainersRadius),
                ),
              ),
              child: ColumnWithPadding(
                children: [
                  const SafeSpacer(
                    height: 85.5,
                  ),
                  ref.watch(userProvider).when(
                    data: (data) {
                      return Text(
                        data.fullName,
                        style: theme.textTheme.headlineSmall
                            ?.copyWith(color: primary),
                      );
                    },
                    error: (error, stackTrace) {
                      return const SizedCustomProgressIndicator();
                    },
                    loading: () {
                      return const SizedCustomProgressIndicator();
                    },
                  ),
                  const SafeSpacer(
                    height: 25,
                  ),
                ],
              ),
            ),
            Center(
              child: UserImage(
                height: responsiveD.maxHeightValue(120),
                width: responsiveD.maxHeightValue(120),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
