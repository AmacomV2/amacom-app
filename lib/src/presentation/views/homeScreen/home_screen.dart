import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amacom_app/src/presentation/state/authentication/user_provider.dart';
import 'package:amacom_app/src/presentation/widgets/custom_asset_icon.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:amacom_app/src/presentation/widgets/widgets.dart';

import 'package:amacom_app/src/presentation/views/homeScreen/widgets/add_pet_widget.dart';
import 'package:amacom_app/src/presentation/views/homeScreen/widgets/feels_widget.dart';
import 'package:amacom_app/src/presentation/views/homeScreen/widgets/stores_widget.dart';

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
        _CashBack(),
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
            PetFeelings(),

            /// If the person has pets hasPets variable is true else false
            BannerAddPet(
              hasPets: true,
            ),
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
                    ownerName: user.names,
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

class _CashBack extends StatelessWidget {
  const _CashBack();

  @override
  Widget build(BuildContext context) {
    final responsive = GlobalLocator.responsiveDesign;
    return Stack(
      children: [
        Container(
          height: responsive.maxHeightValue(143),
          margin: responsive.appHorizontalPadding.copyWith(
            top: responsive.maxHeightValue(20),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xff3377FF), Colors.blue.shade100],
              stops: const [0.0, 1.0],
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
          ),
        ),
        Container(
          padding: responsive.horizontalPadding(17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColumnWithPadding(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SafeSpacer(
                    height: 21,
                  ),
                  const Text(
                    'Total de Cashback',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SafeSpacer(
                    height: 28,
                  ),
                  Container(
                    height: responsive.maxHeightValue(37),
                    padding: EdgeInsets.all(
                      responsive.maxHeightValue(8),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(radiusCircular(20)),
                    ),
                    child: const Center(
                      child: Text(
                        '\$ 50.000',
                        style: TextStyle(
                          color: Color(0xff3377FF),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              // SvgPngToIcon(assetName: 'cashback').iconFromPNG
              CustomAssetIcon(
                path: 'assets/png/icons/cashback.png',
                height: responsive.maxHeightValue(143),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: responsive.maxHeightValue(140)),
          width: double.infinity,
          height: responsive.maxHeightValue(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: radiusCircular(45),
              topRight: radiusCircular(45),
            ),
          ),
        ),
      ],
    );
  }
}

class _IconNotification extends StatelessWidget {
  const _IconNotification();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(500),
          ),
          child: Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: const Color(0xffDDE9FF),
              borderRadius: BorderRadius.circular(500),
            ),
            // child: SvgPngToIcon(assetName: 'bell', padding: 3).iconFromSVG,
            child: const CustomAssetIcon(
              path: 'assets/svg/icons/bell.svg',
              height: 8,
              width: 8,
            ),
          ),
        ),
        Positioned(
          right: 7.5,
          top: 7.5,
          child: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(500),
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
    return Text(
      '''
Hola,
$ownerName''',
      style: const TextStyle(
        fontSize: 23,
        color: Color(0xff3377FF),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
