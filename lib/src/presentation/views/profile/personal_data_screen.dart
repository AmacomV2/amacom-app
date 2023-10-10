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
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppBar(
            title: 'Datos personales',
            centerTitle: true,
            padding: true,
            includeBottomSpacer: false,
          ),
          const SafeSpacer(
            height: 19,
          ),
          UserImage(
            height: responsive.maxHeightValue(124),
            width: responsive.maxHeightValue(124),
            showEditIcon: true,
          ),
          const SafeSpacer(
            height: 35,
          ),
          Expanded(
            child: Padding(
              padding: responsive.appHInnerPadding,
              child: const CustomBody(
                child: PersonalDataForm(),
              ),
            ),
          ),
          CustomButtonWithState(
            onTap: () {},
            text: 'Editar perfil',
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
