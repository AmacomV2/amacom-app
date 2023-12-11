import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/forms/forms_data_providers.dart';
import 'package:amacom_app/src/presentation/state/registration/registration_form_providers.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Registration form
class RegistrationForm extends ConsumerWidget {
  ///
  const RegistrationForm({
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
          CustomTextFormField(
            onChanged: (value) => ref.read(regNameProvider.notifier).update(
                  (state) => state = value,
                ),
            hintText:
                '${appLocalizations?.writeHereYour}${appLocalizations?.name.toLowerCase()}',
            labelText: appLocalizations?.name ?? '',
            showRequiredIndicator: true,
            validator: AppValidations.notEmptyFieldValidation,
          ),
          inputsSeparator,
          CustomTextFormField(
            onChanged: (value) => ref.read(regLastNameProvider.notifier).update(
                  (state) => state = value,
                ),
            hintText:
                '${appLocalizations?.writeHereYour}${appLocalizations?.lastName.toLowerCase()}',
            labelText: appLocalizations?.lastName ?? '',
            showRequiredIndicator: true,
            validator: AppValidations.notEmptyFieldValidation,
          ),
          inputsSeparator,
          ref.watch(documentTypesProvider).when(
                data: (data) {
                  return CustomDropDownFrom(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    validator: AppValidations.notEmptyFieldValidation,
                    hintText:
                        '${appLocalizations?.selectA}${appLocalizations?.documentType.toLowerCase()}',
                    labelText: appLocalizations?.documentType ?? '',
                    showRequiredIndicator: true,
                    items: data
                        .map(
                          (e) => DropdownMenuItem(
                            value: e.id,
                            child: Text(e.description ?? e.name),
                          ),
                        )
                        .toList(),
                    onChanged: (value) => ref
                        .read(regDocumentTypeProvider.notifier)
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
            onChanged: (value) =>
                ref.read(regDocumentNoProvider.notifier).update(
                      (state) => state = value,
                    ),
            hintText:
                '${appLocalizations?.writeHereYour}${appLocalizations?.document.toLowerCase()}',
            labelText: appLocalizations?.document ?? '',
            showRequiredIndicator: true,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.number,
            validator: AppValidations.notEmptyFieldValidation,
          ),
          inputsSeparator,
          ref.watch(gendersProvider).when(
                data: (data) {
                  return CustomDropDownFrom(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText:
                        '${appLocalizations?.selectA}${appLocalizations?.gender.toLowerCase()}',
                    labelText: appLocalizations?.gender ?? '',
                    showRequiredIndicator: true,
                    items: data
                        .map(
                          (e) => DropdownMenuItem(
                            value: e.id,
                            child: Text(e.description ?? e.name),
                          ),
                        )
                        .toList(),
                    onChanged: (value) => ref
                        .read(regGenderProvider.notifier)
                        .update((state) => value),
                    validator: AppValidations.notEmptyFieldValidation,
                  );
                },
                error: (error, stackTrace) {
                  GlobalLocator.appLogger.e(error);
                  return CustomErrorWidget(error: error);
                },
                loading: () => const SizedCustomProgressIndicator2(),
              ),
          const SafeSpacer(),
        ],
      ),
    );
  }
}
