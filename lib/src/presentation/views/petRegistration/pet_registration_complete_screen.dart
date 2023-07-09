import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';

import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

/// Pet registration complete
///
/// Screen shown on pet registration complete. Redirects to homePage
class PetRegistrationCompleteScreen extends StatelessWidget {
  /// Constructor
  const PetRegistrationCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    AppDurations.pageNavigationDelay(
      action: () => Navigation.goTo(
        CustomAppRouter.home,
        removeUntil: true,
      ),
    );
    return CustomScaffold(
      backgroundColor: theme.colorScheme.primary,
      body: GestureDetector(
        onTap: () => Navigation.goTo(
          CustomAppRouter.home,
          removeUntil: true,
        ),
        child: ScrollColumnExpandable(
          padding: EdgeInsets.zero,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/svg/bone.svg'),
                const SafeSpacer(
                  height: 87,
                ),
                Center(
                  child: Text(
                    '¡Listo!\nRegistro completado',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: FigmaColors.secondary_50,
                    ),
                  ),
                ),
              ],
            ),
            Image.asset(
              'assets/images/cat_dog.png',
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
