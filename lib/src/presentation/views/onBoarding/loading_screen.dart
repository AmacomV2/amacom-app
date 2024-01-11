import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/domain/entities/person.dart';
import 'package:amacom_app/src/presentation/state/authentication/user_provider.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Loading screen
class LoadingScreen extends ConsumerWidget {
  /// Widget Constructor
  LoadingScreen({super.key});

  final ValueNotifier<double> _zoom = ValueNotifier(2.0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = ResponsiveDesign(context);
    final colors = Theme.of(context).colorScheme;
    final screen = Scaffold(
      backgroundColor: colors.primary,
      body: OverflowBox(
        maxHeight: 9999,
        maxWidth: 9999,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            ValueListenableBuilder(
              valueListenable: _zoom,
              builder: (BuildContext context, double value, Widget? child) {
                return FutureBuilder(
                  future: Future.delayed(AppDurations.longAnimation),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      Future.delayed(Duration.zero, () {
                        if (_zoom.value <= 2) {
                          _zoom.value = _zoom.value + 1;
                        } else if (_zoom.value <= 3) {
                          _zoom.value = _zoom.value * 6;
                        }
                      });
                    }
                    return UnconstrainedBox(
                      child: AnimatedContainer(
                        curve: Curves.bounceOut,
                        duration: AppDurations.longAnimation,
                        height: value * responsive.maxHeightValue(200),
                        width: value * responsive.maxHeightValue(200),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20000),
                          color: FigmaColors.background,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/logos/hands.png',
                height: responsive.maxHeightValue(120),
              ),
            ),
          ],
        ),
      ),
    );
    return ref.watch(userProvider).when(
      data: (Person data) {
        Future.delayed(
          Duration.zero,
          () {
            Navigation.goTo(CustomAppRouter.home, removeUntil: true);
          },
        );
        return screen;
      },
      loading: () {
        return screen;
      },
      error: (error, stackTrace) {
        ref.invalidate(userProvider);
        Future.delayed(
          Duration.zero,
          () => Navigation.goTo(
            CustomAppRouter.onBoarding,
            removeUntil: true,
          ),
        );
        return screen;
      },
    );
  }
}
