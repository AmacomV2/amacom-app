import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amacom_app/src/presentation/state/authentication/user_provider.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';

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
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    final userData = ref.read(userProvider).value;
    _nameController.text = userData?.firstName ?? '';
    _lastNameController.text = userData?.lastName ?? '';
    _emailController.text = userData?.email.email ?? '';
    _phoneController.text = userData?.phone ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollColumnExpandable(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SafeSpacer(),
        const SafeSpacer(
          height: 14,
        ),
        CustomTextFormField(
          labelText: 'Nombres',
          controller: _nameController,
          hintText: 'Escribe tu(s) nombre(s)',
        ),
        const SafeSpacer(
          height: 16,
        ),
        CustomTextFormField(
          controller: _lastNameController,
          labelText: 'Apellidos',
          hintText: 'Escribe tus apellidos',
        ),
        const SafeSpacer(
          height: 16,
        ),
        CustomTextFormField(
          controller: _emailController,
          enabled: false,
          labelText: 'Correo electrónico',
          hintText: 'Correo electrónico',
        ),
        const SafeSpacer(
          height: 16,
        ),
        CustomTextFormField(
          controller: _phoneController,
          enabled: false,
          labelText: 'Número de teléfono',
          hintText: '+57 300 0000000',
        ),
        const SafeSpacer(
          height: 16,
        ),
      ],
    );
  }
}
