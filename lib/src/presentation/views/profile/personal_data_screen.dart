import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/data/repositories/user_repository.dart';
import 'package:amacom_app/src/presentation/state/authentication/user_provider.dart';
import 'package:amacom_app/src/presentation/state/profile/personal_data_providers.dart';
import 'package:amacom_app/src/presentation/views/profile/widgets/personal_data_form.dart';
import 'package:amacom_app/src/presentation/views/profile/widgets/user_image.dart';
import 'package:amacom_app/src/presentation/widgets/custom_body.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Pet information form
///
/// Catch information about user's pet
class PersonalDataScreen extends ConsumerWidget {
  /// Widget Constructor
  const PersonalDataScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            onTap: () async {
              if (!ref.read(editEnabledPersonalDataProvider)) {
                ref
                    .read(editEnabledPersonalDataProvider.notifier)
                    .update((state) => true);
              } else {
                final result = await ref
                    .read(userRepository)
                    .updateUserData(ref.read(personalDataDTOProvider)!);
                if (result ?? false) {
                  AppDialogs.showCustomSnackBar(
                    appLocalizations?.changesSaved ?? '',
                  );
                  ref.invalidate(userProvider);
                  Navigation.goBack();
                } else {
                  AppDialogs.genericConfirmationDialog(
                    title: appLocalizations?.error ?? '',
                  );
                }
              }
            },
            text: (!ref.watch(editEnabledPersonalDataProvider)
                    ? appLocalizations?.edit
                    : appLocalizations?.save) ??
                '',
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
