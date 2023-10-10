import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';

///
class AddSituationsButton extends StatelessWidget {
  ///
  const AddSituationsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = GlobalLocator.responsiveDesign;
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () => Navigation.goTo(CustomAppRouter.newSituation),
      child: Container(
        margin: EdgeInsets.only(
          bottom: responsive.maxHeightValue(AppSizes.navBarHeight - 20),
        ),
        alignment: Alignment.center,
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: FigmaColors.primary_400,
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
