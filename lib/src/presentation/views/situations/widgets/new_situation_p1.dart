import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/presentation/state/situations/new_situation_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/select_subject.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

///
class NewSituationPart1 extends ConsumerWidget {
  ///
  const NewSituationPart1({super.key, required this.formKey});

  ///
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final responsive = GlobalLocator.responsiveDesign;
    final appLocalizations = AppLocalizations.of(context);

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: ColumnWithPadding(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${appLocalizations?.descriptionMessage}',
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.justify,
            ),
            const SafeSpacer(
              height: 16,
            ),
            CustomTextFormField(
              maxLines: 5,
              minLines: 3,
              initialValue: ref.watch(situationDescriptionProvider),
              labelText: '${appLocalizations?.descriptionHint}',
              validator: AppValidations.notEmptyFieldValidation,
              onChanged: (value) {
                ref
                    .read(situationDescriptionProvider.notifier)
                    .update((state) => value);
              },
            ),
            const SafeSpacer(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${appLocalizations?.affectationDegreeMessage}',
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Tooltip(
                  message:
                      '${appLocalizations?.affectationDegreeMessageToolTip}',
                  triggerMode: TooltipTriggerMode.tap,
                  textStyle: theme.textTheme.bodyLarge?.copyWith(),
                  showDuration: AppDurations.longMessagePopUp,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius:
                        BorderRadius.circular(AppSizes.genericBorderRadius),
                  ),
                  margin: responsive.appHorizontalPadding,
                  child: const FaIcon(
                    FontAwesomeIcons.solidCircleQuestion,
                    size: 20,
                    color: FigmaColors.secondary_200,
                  ),
                ),
              ],
            ),
            const SafeSpacer(
              height: 8,
            ),
            DegreeSelector(
              stateProvider: affectationDegreeProvider,
            ),
            const SafeSpacer(),
            const SelectSubject(),
            const SafeSpacer(),
          ],
        ),
      ),
    );
  }
}
