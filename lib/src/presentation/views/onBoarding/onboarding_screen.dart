import 'package:flutter/material.dart';
import 'package:amacom_app/src/presentation/views/onBoarding/widgets/onboarding_widgets.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/durations.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

/// Screen shown on first time open app
class OnBoardingScreen extends StatefulWidget {
  /// Widget constructor
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final ValueNotifier<int> _currentPage = ValueNotifier(0);

  final PageController _pageController = PageController();

  @override
  void initState() {
    _pageController.addListener(() {
      _currentPage.value = _pageController.page?.round() ?? 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const OnBoardingPage1(),
      const OnBoardingPage2(),
      const OnBoardingPage3(),
      const OnBoardingPage4(),
    ];
    final responsive = GlobalLocator.responsiveDesign;

    return CustomScaffold(
      body: Column(
        children: [
          const HeaderSpacer(
            height: 16,
          ),
          Padding(
            padding: responsive.horizontalPadding(18),
            child: Row(
              children: [
                const Spacer(),
                ValueListenableBuilder(
                  valueListenable: _currentPage,
                  builder: (BuildContext context, int value, Widget? child) {
                    if (value >= pages.length - 1) {
                      return const SizedBox(
                        height: 44,
                      );
                    }
                    return GenericRoundedButton(
                      border: true,
                      onTap: () {
                        Navigation.goTo(
                          Routes.registration,
                          replacement: true,
                        );
                      },
                      text: 'Omitir',
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  itemCount: pages.length,
                  itemBuilder: (context, index) => pages[index],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: _currentPage,
                      builder:
                          (BuildContext context, int value, Widget? child) {
                        return OnBoardingProgressIndicator(
                          key: UniqueKey(),
                          pageController: _pageController,
                          totalPages: pages.length,
                          currentPage: value,
                        );
                      },
                    ),
                    const SafeBottomSpacer(),
                  ],
                ),
                InstagramLikeButtons(
                  onBack: () {
                    if (_currentPage.value > 0) {
                      _pageController.animateToPage(
                        _currentPage.value + -1,
                        duration: AppDurations.midAnimation,
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  next: () {
                    if (_currentPage.value + 1 < pages.length) {
                      _pageController.animateToPage(
                        _currentPage.value + 1,
                        duration: AppDurations.midAnimation,
                        curve: Curves.easeIn,
                      );
                    } else {
                      Navigation.goTo(
                        Routes.registration,
                        replacement: true,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
