import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amacom_app/src/presentation/state/pet_registration/pet_form_providers.dart';
import 'package:amacom_app/src/presentation/views/petRegistration/widgets/pet_image.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';

/// Pet information form
///
/// Catch information about user's pet
class PetInformationForm extends ConsumerWidget {
  /// Widget Constructor
  const PetInformationForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return ScrollColumnExpandable(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Registra los datos básicos de tu mascota',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SafeSpacer(
          height: 32,
        ),
        const PetRegistrationImage(),
        const SafeSpacer(),
        const CustomTextFormField(
          labelText: 'Nombre',
          hintText: 'Escribe el nombre de tu mascota',
        ),
        const SafeSpacer(
          height: 16,
        ),
        CustomDropDownFrom(
          labelText: 'Raza',
          hintText: 'Seleccionar',
          value: ref.watch(petRegistrationBreedProvider),
          items: [
            DropdownMenuItem(
              value: 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Seleccionar',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const DropdownMenuItem(
              value: 'PA',
              child: Text('Pastor Alemán'),
            ),
            const DropdownMenuItem(
              value: 'DO',
              child: Text('Doberman'),
            ),
            const DropdownMenuItem(
              value: 'ME',
              child: Text('Mestiza'),
            ),
            const DropdownMenuItem(
              value: 'AK',
              child: Text('Akita'),
            ),
          ],
          onChanged: (value) {
            final provider = ref.read(petRegistrationBreedProvider.notifier);
            if (value == 0) {
              provider.update((state) => state = null);
              return;
            }
            provider.update((state) => state = state = value);
          },
        ),
        const SafeSpacer(
          height: 16,
        ),
        const CustomTextFormField(
          labelText: 'Edad',
          hintText: 'Escribe la edad de tu mascota en años',
          keyboardType: TextInputType.number,
        ),
        const SafeSpacer(
          height: 16,
        ),
        const CustomTextFormField(
          labelText: 'Peso',
          hintText: 'En kilogramos ',
          keyboardType: TextInputType.number,
        ),
        const SafeSpacer(
          height: 16,
        ),
        CustomDropDownFrom(
          labelText: 'Género',
          hintText: 'Seleccionar',
          value: ref.watch(petRegistrationGenderProvider),
          items: [
            DropdownMenuItem(
              value: 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Seleccionar',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const DropdownMenuItem(
              value: 'F',
              child: Text('Hembra'),
            ),
            const DropdownMenuItem(
              value: 'M',
              child: Text('Macho'),
            ),
          ],
          onChanged: (value) {
            final provider = ref.read(petRegistrationGenderProvider.notifier);
            if (value == 0) {
              provider.update((state) => state = null);
              return;
            }
            provider.update((state) => state = state = value);
          },
        ),
      ],
    );
  }
}
