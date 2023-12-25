import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/situations/new_situation_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/select_feeling.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class NewSituationPart2 extends ConsumerWidget {
  ///
  const NewSituationPart2({super.key, required this.formKey});

  ///
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context);

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: ColumnWithPadding(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${appLocalizations?.situationFeelingMessage}',
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.justify,
            ),
            const SafeSpacer(),
            CustomTextFormField(
              minLines: 2,
              initialValue: ref.watch(situationFirstThoughtProvider),
              onChanged: (value) {
                ref
                    .read(situationFirstThoughtProvider.notifier)
                    .update((state) => value);
              },
              maxLines: 5,
              labelText: '${appLocalizations?.firstThoughtHint}',
              validator: AppValidations.notEmptyFieldValidation,
            ),
            const SafeSpacer(),
            CustomTextFormField(
              minLines: 2,
              maxLines: 5,
              initialValue: ref.watch(situationBehaviorProvider),
              onChanged: (value) {
                ref
                    .read(situationBehaviorProvider.notifier)
                    .update((state) => value);
              },
              labelText: '${appLocalizations?.behaviorHint}',
              validator: AppValidations.notEmptyFieldValidation,
            ),
            const SafeSpacer(),
            const SelectFeeling(),
            const SafeSpacer(),
          ],
        ),
      ),
    );
  }
}
