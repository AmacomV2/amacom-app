import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/global_locator.dart';
import 'package:flutter/material.dart';

///
class MainScreenSearch extends StatelessWidget {
  ///
  const MainScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = GlobalLocator.responsiveDesign;
    return Padding(
      padding: EdgeInsets.only(
        top: responsive.maxHeightValue(14),
        bottom: responsive.maxHeightValue(6),
        left: responsive.maxWidthValue(16),
        right: responsive.maxWidthValue(16),
      ),
      child: const Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              hintText: 'Buscar',
            ),
          ),
          HorizontalSpacer(),
          CustomIconButton(
            icon: Icons.search,
          ),
          HorizontalSpacer(),
          CustomIconButton(
            icon: Icons.settings,
          ),
        ],
      ),
    );
  }
}
