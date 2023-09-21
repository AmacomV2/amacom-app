import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/presentation/widgets/custom_body.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/app_constants.dart';
import 'package:amacom_app/src/utils/constant/app_messages.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

///
class SituationsBody extends StatelessWidget {
  ///
  const SituationsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = GlobalLocator.responsiveDesign;
    final theme = Theme.of(context);

    return CustomBody(
      backgroundColor: FigmaColors.primary_200,
      child: SizedBox(
        width: responsive.screenWidth,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListTile(
                title: Text(
                  'Has realizado ( 1 ) reporte(s)',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                trailing: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () => Navigation.goTo(CustomAppRouter.newSituation),
                  child: Container(
                    alignment: Alignment.center,
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: FigmaColors.primary_400,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  top: responsive.maxHeightValue(10),
                ),
                color: Colors.white,
                child: ColumnWithPadding(
                  children: [
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          AppConstants.cardRadius,
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          top: 6,
                          bottom: 8,
                          left: 10,
                          right: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Martes 9 de Septiempre, 2023',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'En revisión',
                                      style: theme.textTheme.bodyMedium?.copyWith(
                                        color: FigmaColors.warning_600,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const HorizontalSpacer(
                                      width: 8,
                                    ),
                                    const FaIcon(
                                      FontAwesomeIcons.clock,
                                      color: FigmaColors.warning_600,
                                      size: 18,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SafeSpacer(
                              height: 8,
                            ),
                            Text(
                              AppMessages.loremIpsum,
                              style: theme.textTheme.bodyLarge,
                              maxLines: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const BottomNavBarSpacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
