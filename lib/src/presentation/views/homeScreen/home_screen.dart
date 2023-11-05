import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/presentation/state/authentication/user_provider.dart';
import 'package:amacom_app/src/presentation/views/homeScreen/widgets/stores_widget.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// HomeScreen
///
/// App home screen, shows current user, cashback information and
/// pets general status
class HomeScreen extends StatelessWidget {
  ///
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScrollColumnExpandable(
      padding: EdgeInsets.zero,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        HeaderSpacer(
          height: 46,
        ),
        _NameAndNotification(),
        SafeSpacer(),
        _MainContainer(),
        BottomNavBarSpacer(),
      ],
    );
  }
}

class _MainContainer extends StatelessWidget {
  const _MainContainer();

  @override
  Widget build(BuildContext context) {
    final responsive = GlobalLocator.responsiveDesign;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: responsive.appHorizontalPadding,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stores(),
            SafeSpacer(height: 120),
          ],
        ),
      ),
    );
  }
}

class _NameAndNotification extends ConsumerWidget {
  const _NameAndNotification();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = GlobalLocator.responsiveDesign;
    return Padding(
      padding: responsive.appHorizontalPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ref.watch(userProvider).when(
                data: (user) {
                  return _Greeting(
                    ownerName: user.fullName,
                  );
                },
                error: (error, stackTrace) => const _Greeting(
                  ownerName: 'User Name',
                ),
                loading: () {
                  return const SizedCustomProgressIndicator();
                },
              ),
          const _IconNotification(),
        ],
      ),
    );
  }
}

class _IconNotification extends StatelessWidget {
  const _IconNotification();
  @override
  Widget build(BuildContext context) {
    final responsive = GlobalLocator.responsiveDesign;
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(500),
          ),
          child: Badge(
            backgroundColor: FigmaColors.danger_400,
            child: SvgPicture.asset(
              'assets/svg/icons/bell.svg',
              // ignore: deprecated_member_use
              color: FigmaColors.primary_400,
              height: responsive.maxHeightValue(40),
            ),
          ),
        ),
      ],
    );
  }
}

class _Greeting extends StatelessWidget {
  const _Greeting({
    required this.ownerName,
  });

  final String ownerName;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return Text(
      '''
${appLocalizations?.hello},
$ownerName''',
      style: const TextStyle(
        fontSize: 23,
        color: FigmaColors.primary_300,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
