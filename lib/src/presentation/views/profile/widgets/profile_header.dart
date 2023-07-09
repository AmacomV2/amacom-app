import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amacom_app/src/presentation/state/authentication/user_provider.dart';
import 'package:amacom_app/src/presentation/views/profile/widgets/user_image.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

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
    return Column(
      children: [
        const HeaderSpacer(),
        Stack(
          children: [
            Container(
              width: responsiveD.screenWidth,
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
                    height: 74.5,
                  ),
                  ref.watch(userProvider).when(
                    data: (data) {
                      return Text(
                        data.names,
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
                height: responsiveD.maxHeightValue(106),
                width: responsiveD.maxHeightValue(106),
              ),
            ),
          ],
        )
      ],
    );
  }
}
