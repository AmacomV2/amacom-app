import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/presentation/state/home/navigation_bar_provider.dart';
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
      height: responsive.safeBottomHeight(AppSizes.navBarHeight + 10),
      width: responsive.screenHeight,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: responsive.safeBottomHeight(75),
              width: responsive.screenHeight,
              margin: EdgeInsets.only(
                top: responsive.maxHeightValue(AppSizes.navBarHeight - 75),
              ),
              child: Container(
                decoration: const BoxDecoration(color: FigmaColors.primary_400),
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
                    option: NavigationBarSelection.HOME,
                  ),
                  _OptionItem(
                    option: NavigationBarSelection.RESOURCES,
                  ),
                  _OptionItem(
                    option: NavigationBarSelection.CALENDAR,
                  ),
                  _OptionItem(
                    option: NavigationBarSelection.SITUATIONS,
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
    switch (option) {
      case NavigationBarSelection.HOME:
        iconPath = 'assets/icon/home.png';
        label = 'Inicio';
        break;
      case NavigationBarSelection.PROFILE:
        iconPath = 'assets/icon/user-settings.png';
        label = 'Perfil';
        break;
      case NavigationBarSelection.CALENDAR:
        iconPath = 'assets/icon/calendar.png';
        label = 'Eventos';
        break;
      case NavigationBarSelection.RESOURCES:
        iconPath = 'assets/icon/open-folder.png';
        label = 'Recursos';
        break;
      case NavigationBarSelection.SITUATIONS:
        iconPath = 'assets/icon/report.png';
        label = 'Reportes';
        break;
    }
    final responsive = GlobalLocator.responsiveDesign;
    return GestureDetector(
      onTap: () {
        ref.read(navigationBarProvider.notifier).update((state) => state = option);
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.all(0.1),
        width: 67,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (isSelected)
              Container(
                alignment: Alignment.center,
                clipBehavior: Clip.hardEdge,
                width: responsive.maxHeightValue(60),
                height: responsive.maxHeightValue(60),
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  border: Border.all(color: FigmaColors.primary_400, width: 3),
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                ),
                child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    border: Border.all(color: FigmaColors.primary_300, width: 1.5),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                  ),
                  child: Image.asset(
                    iconPath,
                    // ignore: deprecated_member_use
                    height: responsive.maxHeightValue(30),
                    width: responsive.maxHeightValue(30),
                    color: FigmaColors.primary_400,
                  ),
                ),
              ),
            if (!isSelected)
              Image.asset(
                iconPath,
                // ignore: deprecated_member_use
                color: isSelected ? Colors.white : FigmaColors.secondary_100,
                height: responsive.maxHeightValue(20),
                width: responsive.maxHeightValue(20),
              ),
            SafeSpacer(
              height: isSelected ? 6 : 4,
            ),
            Text(
              label,
              style: TextStyle(
                color: (isSelected) ? Colors.white : FigmaColors.secondary_100,
                fontWeight: (isSelected) ? FontWeight.w700 : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
