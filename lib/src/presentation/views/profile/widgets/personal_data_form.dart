import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/forms/forms_data_providers.dart';
import 'package:amacom_app/src/presentation/state/profile/personal_data_providers.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Form used to display and update user data
class PersonalDataForm extends ConsumerStatefulWidget {
  ///
  const PersonalDataForm({super.key});

  @override
  ConsumerState<PersonalDataForm> createState() => _PersonalDataFormState();
}

class _PersonalDataFormState extends ConsumerState<PersonalDataForm> {
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _documentNoController = TextEditingController();
  final _addressController = TextEditingController();
  final _occupationController = TextEditingController();

  @override
  void initState() {
    final userData = ref.read(personalDataDTOProvider);
    _nameController.text = userData?.name ?? '';
    _documentNoController.text = userData?.document ?? '';
    _lastNameController.text = userData?.lastName ?? '';
    _occupationController.text = (userData?.occupation ?? '').capitalize();
    _addressController.text = (userData?.address ?? '').capitalize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    final userData = ref.watch(personalDataDTOProvider);
    final enableEdit = ref.watch(editEnabledPersonalDataProvider);
    return ScrollColumnExpandable(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SafeSpacer(),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                labelText: appLocalizations?.name ?? '',
                enabled: enableEdit,
                controller: _nameController,
                onChanged: (value) => userData?.name = value ?? '',
                hintText:
                    '${appLocalizations?.writeHereYour}${appLocalizations?.name.toLowerCase()}',
              ),
            ),
            Expanded(
              child: CustomTextFormField(
                controller: _lastNameController,
                enabled: enableEdit,
                labelText: appLocalizations?.lastName ?? '',
                onChanged: (value) => userData?.lastName = value ?? '',
                hintText:
                    '${appLocalizations?.writeHereYour}${appLocalizations?.lastName.toLowerCase()}',
              ),
            ),
          ],
        ),
        ref.watch(documentTypesProvider).when(
              data: (data) {
                return CustomDropDownFrom(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  validator: AppValidations.notEmptyFieldValidation,
                  value: userData?.documentTypeId,
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
                  onChanged: (value) => userData?.documentTypeId = value ?? '',

                  // validator: AppValidations.notEmptyFieldValidation,
                );
              },
              error: (error, stackTrace) {
                GlobalLocator.appLogger.e(error);
                return CustomErrorWidget(error: error);
              },
              loading: () => const SizedCustomProgressIndicator2(),
            ),
        CustomTextFormField(
          controller: _documentNoController,
          enabled: enableEdit,
          labelText: appLocalizations?.documentNo ?? '',
          onChanged: (value) => userData?.document = value ?? '',
          hintText:
              '${appLocalizations?.writeHereYour}${appLocalizations?.documentNo.toLowerCase()}',
        ),
        ref.watch(gendersProvider).when(
              data: (data) {
                return CustomDropDownFrom(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  validator: AppValidations.notEmptyFieldValidation,
                  value: userData?.genderId,
                  hintText:
                      '${appLocalizations?.selectA}${appLocalizations?.documentType.toLowerCase()}',
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
                  onChanged: (value) => userData?.genderId = value ?? '',

                  // validator: AppValidations.notEmptyFieldValidation,
                );
              },
              error: (error, stackTrace) {
                GlobalLocator.appLogger.e(error);
                return CustomErrorWidget(error: error);
              },
              loading: () => const SizedCustomProgressIndicator2(),
            ),
        CustomTextFormField(
          controller: _addressController,
          enabled: enableEdit,
          onChanged: (value) => userData?.address = value,
          labelText: appLocalizations?.address ?? '',
          hintText:
              '${appLocalizations?.writeHereYour}${appLocalizations?.address.toLowerCase()}',
        ),
        const SafeSpacer(
          height: 16,
        ),
        ref.watch(civilStatusesProvider).when(
              data: (data) {
                return CustomDropDownFrom(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  validator: AppValidations.notEmptyFieldValidation,
                  value: userData?.civilStatusId,
                  hintText:
                      '${appLocalizations?.selectA}${appLocalizations?.civilStatus.toLowerCase()}',
                  labelText: appLocalizations?.civilStatus ?? '',
                  showRequiredIndicator: true,
                  items: data
                      .map(
                        (e) => DropdownMenuItem(
                          value: e.id,
                          child: Text(e.description ?? e.name),
                        ),
                      )
                      .toList(),
                  onChanged: (value) => userData?.civilStatusId = value,

                  // validator: AppValidations.notEmptyFieldValidation,
                );
              },
              error: (error, stackTrace) {
                GlobalLocator.appLogger.e(error);
                return CustomErrorWidget(error: error);
              },
              loading: () => const SizedCustomProgressIndicator2(),
            ),
        CustomTextFormField(
          controller: _occupationController,
          enabled: enableEdit,
          labelText: appLocalizations?.occupation,
          onChanged: (value) => userData?.occupation = value ?? '',
          hintText:
              '${appLocalizations?.writeHereYour}${appLocalizations?.occupation.toLowerCase()}',
        ),
        const SafeSpacer(
          height: 16,
        ),
      ],
    );
  }
}
