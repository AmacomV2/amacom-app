import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/data/repositories/password_recovering_repository.dart';
import 'package:amacom_app/src/presentation/state/authentication/password_recovering_providers.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// User password recovering form
class RecoverPasswordForm extends ConsumerStatefulWidget {
  /// Constructor
  const RecoverPasswordForm({
    super.key,
    required this.onSuccess,
  });

  /// Callback on page operation success
  final VoidCallback onSuccess;

  @override
  ConsumerState<RecoverPasswordForm> createState() =>
      _RecoverPasswordFormState();
}

class _RecoverPasswordFormState extends ConsumerState<RecoverPasswordForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final appLocalizations = AppLocalizations.of(context);

    return Form(
      key: _formKey,
      child: ScrollColumnExpandable(
        padding: EdgeInsets.zero,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            appLocalizations?.sendCodeText ?? '',
            textAlign: TextAlign.left,
            style: textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SafeSpacer(),
          CustomTextFormField(
            prefixIcon: const Icon(Icons.mail_outline_rounded),
            onChanged: (value) =>
                ref.read(passRecoveringEmailProvider.notifier).update(
                      (state) => value,
                    ),
            hintText: appLocalizations?.email ?? '',
            labelText: appLocalizations?.emailHint ?? '',
            textCapitalization: TextCapitalization.none,
            validator: AppValidations.validateEmail,
          ),
          const SafeSpacer(
            height: 32,
          ),
          const Spacer(),
          CustomButtonWithState(
            enabled: (ref.watch(passRecoveringEmailProvider) ?? '').isNotEmpty,
            adaptiveTextColor: true,
            text: appLocalizations?.sendCode ?? '',
            onTap: () async {
              if (_formKey.currentState?.validate() ?? false) {
                FocusScope.of(context).unfocus();

                final resp = await ref
                    .read(passwordRecoveringRepoProvider)
                    .sendCode(ref.read(passRecoveringEmailProvider) ?? '');
                if (resp?.ok == true) {
                  AppDialogs.showCustomSnackBar(
                    appLocalizations?.codeSent ?? '',
                    icon: Icons.check_circle_outline_rounded,
                  );
                  widget.onSuccess.call();
                } else {
                  AppDialogs.genericConfirmationDialog(
                    title: appLocalizations?.sendCodeError ?? '',
                  );
                }
              }
            },
          ),
          const BottomSpacer(),
        ],
      ),
    );
  }
}
