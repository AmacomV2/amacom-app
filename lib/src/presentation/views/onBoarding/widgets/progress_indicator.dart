import 'package:flutter/material.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:get_it/get_it.dart';

/// Onboarding page progress indicator
class OnBoardingProgressIndicator extends StatelessWidget {
  /// Widget constructor
  const OnBoardingProgressIndicator({
    super.key,
    required this.pageController,
    required this.totalPages,
    required this.currentPage,
  });

  /// Total No of pages
  final int totalPages;

  /// Page view controller
  final PageController pageController;

  /// Current page
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    final responsive = GetIt.instance.get<ResponsiveDesign>();
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.width(18)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          totalPages,
          (index) {
            return AnimatedContainer(
              duration: AppDurations.animation,
              margin: EdgeInsets.only(
                right: (index < totalPages - 1) ? 12 : 0,
              ),
              padding: EdgeInsets.all(responsive.maxHeightValue(4)),
              width: responsive.maxHeightValue(index == currentPage ? 18 : 12),
              height: responsive.maxHeightValue(index == currentPage ? 18 : 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: index <= currentPage
                    ? colors.primaryContainer
                    : colors.onPrimaryContainer,
              ),
              child: (index == currentPage)
                  ? Container(
                      width: responsive.maxHeightValue(9),
                      height: responsive.maxHeightValue(9),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                    )
                  : null,
            );
          },
        ),
      ),
    );
  }
}
