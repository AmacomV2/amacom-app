import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';

/// Pet information form
///
/// Catch information about user's pet
class ChangePasswordByForm extends StatelessWidget {
  /// Widget Constructor
  const ChangePasswordByForm({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = GlobalLocator.responsiveDesign;
    final appLocalizations = AppLocalizations.of(context);
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomAppBar2(
            title: appLocalizations?.changePassword,
            subtitle: appLocalizations?.changePasswordText,
            padding: true,
          ),
          Expanded(
            child: ScrollColumnExpandable(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SafeSpacer(
                  height: 10,
                ),
                CustomPasswordFormField(
                  labelText: appLocalizations?.currentPassword,
                  hintText:
                      '${appLocalizations?.writeHereYour}${appLocalizations?.currentPassword.toLowerCase()}',
                ),
                const SafeSpacer(
                  height: 16,
                ),
                CustomPasswordFormField(
                  labelText: appLocalizations?.newPassword,
                  hintText:
                      '${appLocalizations?.writeHereYour}${appLocalizations?.newPassword.toLowerCase()}',
                ),
                const SafeSpacer(
                  height: 16,
                ),
                CustomPasswordFormField(
                  labelText: appLocalizations?.confirmPassword,
                  hintText: '${appLocalizations?.passwordHintVar}',
                ),
                const SafeSpacer(
                  height: 16,
                ),
              ],
            ),
          ),
          const SafeSpacer(
            height: 16,
          ),
          CustomButtonWithState(
            onTap: () {},
            text: appLocalizations?.save ?? '',
            margin: responsive.appHorizontalPadding,
          ),
          const BottomSpacer(),
        ],
      ),
    );
  }
}
