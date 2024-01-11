import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/forms/forms_data_providers.dart';
import 'package:amacom_app/src/presentation/state/registration/registration_form_providers.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/extensions/date_time_extensions.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Registration form
class RegistrationForm2 extends ConsumerWidget {
  ///
  const RegistrationForm2({
    super.key,
    required this.formKey,
  });

  /// Form key
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const inputsSeparator = SafeSpacer(
      height: 20,
    );
    final appLocalizations = AppLocalizations.of(context);

    ref.watch(regPasswordProvider);
    return Form(
      key: formKey,
      child: ScrollColumnExpandable(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SafeSpacer(
            height: 16,
          ),
          GestureDetector(
            onTap: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                currentDate: ref.watch(regBirthDateProvider),
                lastDate: DateTime.now(),
                initialDatePickerMode: DatePickerMode.year,
              );
              ref
                  .read(regBirthDateProvider.notifier)
                  .update((state) => pickedDate);
            },
            child: Builder(
              builder: (context) {
                return CustomTextFormField(
                  enabled: false,
                  controller: TextEditingController(
                    text: ref
                            .watch(regBirthDateProvider)
                            ?.asText(appLocalizations?.localeName ?? 'en') ??
                        '',
                  ),
                  showRequiredIndicator: true,
                  labelText: appLocalizations?.birthDate ?? '',
                  hintText:
                      '${appLocalizations?.selectYour}${appLocalizations?.birthDate.toLowerCase()}',
                  textCapitalization: TextCapitalization.none,
                );
              },
            ),
          ),
          inputsSeparator,
          ref.watch(civilStatusesProvider).when(
                data: (data) {
                  return CustomDropDownFrom(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText:
                        '${appLocalizations?.selectA}${appLocalizations?.civilStatus.toLowerCase()}',
                    labelText: appLocalizations?.civilStatus ?? '',
                    items: data
                        .map(
                          (e) => DropdownMenuItem(
                            value: e.id,
                            child: Text(e.description ?? e.name),
                          ),
                        )
                        .toList(),
                    onChanged: (value) => ref
                        .read(regCivilStatusProvider.notifier)
                        .update((state) => value),
                    // validator: AppValidations.notEmptyFieldValidation,
                  );
                },
                error: (error, stackTrace) {
                  GlobalLocator.appLogger.e(error);
                  return CustomErrorWidget(error: error);
                },
                loading: () => const SizedCustomProgressIndicator2(),
              ),
          inputsSeparator,
          CustomTextFormField(
            onChanged: (value) => ref.read(regAddressProvider.notifier).update(
                  (state) => state = value,
                ),
            hintText:
                '${appLocalizations?.writeHere}${appLocalizations?.address.toLowerCase()}',
            labelText: appLocalizations?.address ?? '',
            textCapitalization: TextCapitalization.none,
          ),
          inputsSeparator,
          CustomTextFormField(
            onChanged: (value) =>
                ref.read(regOccupationProvider.notifier).update(
                      (state) => state = value,
                    ),
            hintText:
                '${appLocalizations?.writeHere}${appLocalizations?.occupation.toLowerCase()}',
            labelText: appLocalizations?.occupation ?? '',
            textCapitalization: TextCapitalization.none,
          ),
          inputsSeparator,
          const SafeSpacer(),
        ],
      ),
    );
  }
}
