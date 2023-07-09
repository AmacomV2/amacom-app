import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/presentation/state/home/navigation_bar_provider.dart';
import 'package:amacom_app/src/presentation/views/profile/widgets/user_image.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

/// Home App navigation bar
class CustomBottomNavigationBar extends StatelessWidget {
  ///
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = GlobalLocator.responsiveDesign;
    return SizedBox(
      height: responsive.safeBottomHeight(AppSizes.navBarHeight),
      width: responsive.screenHeight,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: responsive.safeBottomHeight(85),
              width: responsive.screenHeight,
              margin: EdgeInsets.only(
                top: responsive.maxHeightValue(AppSizes.navBarHeight - 85),
              ),
              child: Container(
                decoration: const BoxDecoration(color: Color(0xff3377FF)),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                bottom: responsive.safeBottomHeight(16),
              ),
              width: responsive.screenWidth,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _OptionItem(
                    option: NavigationBarSelection.FINANCES,
                  ),
                  _OptionItem(
                    option: NavigationBarSelection.DAILY,
                  ),
                  _OptionItem(
                    option: NavigationBarSelection.HOME,
                  ),
                  _OptionItem(
                    option: NavigationBarSelection.STORES,
                  ),
                  _OptionItem(
                    option: NavigationBarSelection.PROFILE,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _OptionItem extends ConsumerWidget {
  const _OptionItem({
    required this.option,
  });

  final NavigationBarSelection option;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSelection = ref.watch(navigationBarProvider);
    String iconPath;
    String label;
    bool isSelected = option == currentSelection;
    bool showUserImage = false;
    switch (option) {
      case NavigationBarSelection.HOME:
        iconPath = 'assets/svg/icons/home.svg';
        label = 'Inicio';
        break;
      case NavigationBarSelection.PROFILE:
        iconPath = 'assets/svg/icons/stores.svg';
        label = 'Mi perfil';
        showUserImage = true;
        break;
      case NavigationBarSelection.DAILY:
        iconPath = 'assets/svg/icons/daily.svg';
        label = 'Día a día';
        break;
      case NavigationBarSelection.FINANCES:
        iconPath = 'assets/svg/icons/finances.svg';
        label = 'Finanzas';
        break;
      case NavigationBarSelection.STORES:
        iconPath = 'assets/svg/icons/stores.svg';
        label = 'Comercios';
        break;
    }
    final responsive = GlobalLocator.responsiveDesign;
    return GestureDetector(
      onTap: () {
        ref
            .read(navigationBarProvider.notifier)
            .update((state) => state = option);
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.all(0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (isSelected)
              showUserImage
                  ? UserImage(
                      height: responsive.maxHeightValue(70),
                      width: responsive.maxHeightValue(70),
                    )
                  : Container(
                      width: responsive.maxHeightValue(70),
                      height: responsive.maxHeightValue(70),
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: const Color(0xff3377FF), width: 2),
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                          responsive.maxHeightValue(4),
                        ),
                        child: SvgPicture.asset(
                          iconPath,
                          // ignore: deprecated_member_use
                          color: Theme.of(context).colorScheme.primary,
                          height: responsive.maxHeightValue(40),
                          width: responsive.maxHeightValue(40),
                        ),
                      ),
                    ),
            if (!isSelected)
              showUserImage
                  ? UserImage(
                      height: responsive.maxHeightValue(26),
                      width: responsive.maxHeightValue(26),
                    )
                  : SvgPicture.asset(
                      iconPath,
                      // ignore: deprecated_member_use
                      color: isSelected ? Colors.white : FigmaColors.primary_200,
                      height: responsive.maxHeightValue(26),
                      width: responsive.maxHeightValue(26),
                    ),
            SafeSpacer(
              height: isSelected ? 6 : 4,
            ),
            Text(
              label,
              style: TextStyle(
                color: (isSelected) ? Colors.white : FigmaColors.primary_200,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
