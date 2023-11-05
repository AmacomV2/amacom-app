import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/authentication/user_provider.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
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
  final _documentTypeController = TextEditingController();
  final _addressController = TextEditingController();
  final _occupationController = TextEditingController();

  @override
  void initState() {
    final userData = ref.read(userProvider).value;
    _nameController.text = userData?.name ?? '';
    _documentNoController.text = userData?.documentNo ?? '';
    _documentTypeController.text = userData?.documentType.name ?? '';
    _lastNameController.text = userData?.lastName ?? '';
    _occupationController.text = (userData?.occupation ?? '').capitalize();
    _addressController.text = (userData?.address ?? '').capitalize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return ScrollColumnExpandable(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SafeSpacer(),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                labelText: appLocalizations?.name ?? '',
                controller: _nameController,
                hintText:
                    '${appLocalizations?.writeHereYour}${appLocalizations?.name.toLowerCase()}',
              ),
            ),
            Expanded(
              child: CustomTextFormField(
                controller: _lastNameController,
                labelText: appLocalizations?.lastName ?? '',
                hintText:
                    '${appLocalizations?.writeHereYour}${appLocalizations?.lastName.toLowerCase()}',
              ),
            ),
          ],
        ),
        const SafeSpacer(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                labelText: appLocalizations?.documentType ?? '',
                controller: _documentTypeController,
                hintText:
                    '${appLocalizations?.writeHereYour}${appLocalizations?.documentType.toLowerCase()}',
              ),
            ),
            Expanded(
              child: CustomTextFormField(
                controller: _documentNoController,
                labelText: appLocalizations?.documentNo ?? '',
                hintText:
                    '${appLocalizations?.writeHereYour}${appLocalizations?.documentNo.toLowerCase()}',
              ),
            ),
          ],
        ),
        const SafeSpacer(
          height: 16,
        ),
        CustomTextFormField(
          controller: _addressController,
          enabled: false,
          labelText: appLocalizations?.address ?? '',
          hintText:
              '${appLocalizations?.writeHereYour}${appLocalizations?.address.toLowerCase()}',
        ),
        const SafeSpacer(
          height: 16,
        ),
        CustomTextFormField(
          controller: _occupationController,
          labelText: appLocalizations?.occupation ?? '',
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
