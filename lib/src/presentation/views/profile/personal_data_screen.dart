import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/views/profile/widgets/personal_data_form.dart';
import 'package:amacom_app/src/presentation/views/profile/widgets/user_image.dart';
import 'package:amacom_app/src/presentation/widgets/custom_body.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';

/// Pet information form
///
/// Catch information about user's pet
class PersonalDataScreen extends StatelessWidget {
  /// Widget Constructor
  const PersonalDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = GlobalLocator.responsiveDesign;
    final appLocalizations = AppLocalizations.of(context);
    return CustomScaffold(
      body: ColumnWithPadding(
        children: [
          CustomAppBar2(
            title: appLocalizations?.personalData ?? '',
            subtitle: appLocalizations?.personalDataText ?? '',
          ),
          UserImage(
            height: responsive.maxHeightValue(140),
            width: responsive.maxHeightValue(140),
            showEditIcon: true,
          ),
          const SafeSpacer(),
          const Expanded(
            child: CustomBody(
              padding: EdgeInsets.zero,
              child: PersonalDataForm(),
            ),
          ),
          CustomButtonWithState(
            onTap: () {},
            text: appLocalizations?.edit ?? '',
            margin: responsive.appHorizontalPadding.copyWith(
              top: responsive.maxHeightValue(16),
            ),
          ),
          const BottomSpacer(),
        ],
      ),
    );
  }
}
