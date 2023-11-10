import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/data/repositories/user_repository.dart';
import 'package:amacom_app/src/presentation/state/changePassword/change_password_providers.dart';
import 'package:amacom_app/src/presentation/views/profile/widgets/change_password_form.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

/// Pet information form
///
/// Catch information about user's pet
class ChangePasswordByForm extends ConsumerStatefulWidget {
  /// Widget Constructor
  const ChangePasswordByForm({super.key});

  @override
  ConsumerState<ChangePasswordByForm> createState() =>
      _ChangePasswordByFormState();
}

class _ChangePasswordByFormState extends ConsumerState<ChangePasswordByForm> {
  /// Form validation key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late AppLocalizations? appLocalizations;

  @override
  void dispose() {
    _invalidateProviders();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = GlobalLocator.responsiveDesign;
    appLocalizations = AppLocalizations.of(context);
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
            child: ChangePasswordForm(formKey: formKey),
          ),
          const SafeSpacer(
            height: 16,
          ),
          CustomButtonWithState(
            onTap: _changePassword,
            text: appLocalizations?.save ?? '',
            margin: responsive.appHorizontalPadding,
          ),
          const BottomSpacer(),
        ],
      ),
    );
  }

  _changePassword() async {
    if (formKey.currentState?.validate() == true) {
      try {
        final result = await ref.read(userRepository).changePassword(
              oldPassword: ref.read(oldPasswordProvider),
              newPassword: ref.read(newPasswordProvider),
            );
        if (result) {
          AppDialogs.showCustomSnackBar(
            appLocalizations?.passwordChanged ?? '',
          );
          _invalidateProviders();
          if (context.mounted) {
            context.pop();
          }
        }
      } catch (e) {
        AppDialogs.showCustomSnackBar(
          e.toString(),
          color: FigmaColors.danger_700,
          icon: Icons.error_outline_outlined,
        );
      }
    }
  }

  void _invalidateProviders() {
    try {
      if (ref.context.mounted) {
        ref.invalidate(oldPasswordProvider);
        ref.invalidate(newPasswordProvider);
      }
    } catch (e) {
      GlobalLocator.appLogger.e(e);
    }
  }
}
