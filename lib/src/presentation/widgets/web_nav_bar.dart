import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/presentation/state/authentication/user_provider.dart';
import 'package:amacom_app/src/presentation/state/home/navigation_bar_provider.dart';
import 'package:amacom_app/src/presentation/views/profile/widgets/user_image.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/app_constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Home App navigation bar
class WebNavBar extends ConsumerWidget {
  ///
  const WebNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = GlobalLocator.responsiveDesign;
    final theme = Theme.of(context);

    return Container(
      height: responsive.screenHeight,
      width: responsive.webNabVarWidth,
      padding: responsive.horizontalPadding(6),
      decoration: const BoxDecoration(color: FigmaColors.primary_400),
      child: Column(
        children: [
          const HeaderSpacer(),
          const UserImage(
            height: 80,
            width: 80,
          ),
          ref.watch(userProvider).when(
            data: (data) {
              return Text(
                data.fullName,
                style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
              );
            },
            error: (error, stackTrace) {
              return const SizedCustomProgressIndicator();
            },
            loading: () {
              return const SizedCustomProgressIndicator();
            },
          ),
          const Divider(
            color: Colors.white,
            height: 20,
          ),
          const SafeSpacer(
            height: 10,
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
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
    final theme = Theme.of(context).textTheme;
    final appLocalizations = AppLocalizations.of(context);
    switch (option) {
      case NavigationBarSelection.HOME:
        iconPath = 'assets/icon/home.png';
        label = appLocalizations!.home;
        break;
      case NavigationBarSelection.PROFILE:
        iconPath = 'assets/icon/user-settings.png';
        label = appLocalizations!.profile;
        break;
      case NavigationBarSelection.CALENDAR:
        iconPath = 'assets/icon/calendar.png';
        label = appLocalizations!.agenda;
        break;
      case NavigationBarSelection.RESOURCES:
        iconPath = 'assets/icon/open-folder.png';
        label = appLocalizations!.resources;
        break;
      case NavigationBarSelection.SITUATIONS:
        iconPath = 'assets/icon/report.png';
        label = appLocalizations!.reports;
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
      child: Row(
        children: [
          if (isSelected)
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
              size: 18,
            ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(
                bottom: 6,
              ),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : FigmaColors.primary_400,
                borderRadius: BorderRadius.circular(AppConstants.cardRadius),
                border: Border.all(
                  color: !isSelected ? Colors.white : FigmaColors.primary_400,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    iconPath,
                    // ignore: deprecated_member_use
                    color: !isSelected ? Colors.white : FigmaColors.primary_400,
                    height: responsive.maxHeightValue(20),
                    width: responsive.maxHeightValue(20),
                  ),
                  const HorizontalSpacer(),
                  Text(
                    label,
                    style: theme.bodyLarge?.copyWith(
                      color:
                          !isSelected ? Colors.white : FigmaColors.primary_400,
                      fontWeight:
                          (isSelected) ? FontWeight.w700 : FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
