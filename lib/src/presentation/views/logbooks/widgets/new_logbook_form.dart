import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/logbooks/new_lookbook_provider.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Logbook creation form
///
/// Perform validations and create a new logbook.
class NewLogbookForm extends ConsumerWidget {
  ///
  const NewLogbookForm({super.key, required this.formKey});

  /// Form validation key
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context);
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            labelText: appLocalizations?.title ?? '',
            hintText:
                '${appLocalizations?.writeHere} ${appLocalizations?.title.toLowerCase()}',
            validator: (value) {
              return AppValidations.notEmptyFieldValidation(
                value,
                message: appLocalizations?.fieldRequired,
              );
            },
            onChanged: (value) {
              ref.read(logbookTitleProvider.notifier).update((state) => value);
            },
          ),
          const SafeSpacer(
            height: 16,
          ),
          CustomTextFormField(
            labelText: appLocalizations?.description ?? '',
            hintText:
                '${appLocalizations?.writeHere} ${appLocalizations?.description.toLowerCase()}',
            maxLines: 12,
            minLines: 4,
            validator: (value) {
              return AppValidations.notEmptyFieldValidation(
                value,
                message: appLocalizations?.fieldRequired,
              );
            },
            onChanged: (value) {
              ref
                  .read(logbookDescriptionProvider.notifier)
                  .update((state) => value);
            },
          ),
        ],
      ),
    );
  }
}
