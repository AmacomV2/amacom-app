import 'package:flutter/material.dart';
import 'package:amacom_app/src/presentation/widgets/menu_back_arrow.dart';

import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/presentation/views/petRegistration/widgets/pet_image.dart';

/// Pet information form
///
/// Catch information about user's pet
class PetDataForm extends StatelessWidget {
  /// Widget Constructor
  const PetDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const MenuBackArrowButton(),
        elevation: 0,
        backgroundColor: const Color(0xffededf4),
        toolbarHeight: 261,
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              'Perfil de mi mascota',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff3377FF),
              ),
            ),
            SafeSpacer(),
            PetRegistrationImage(), //TODO change by person image
          ],
        ),
      ),
      body: SafeArea(
        child: CustomContainerBordersUp(
          topPadding: 0,
          child: ScrollColumnExpandable(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SafeSpacer(
                height: 8,
              ),
              const SafeSpacer(),
              const CustomTextFormField(
                labelText: 'Nombres',
                hintText: 'Donatello',
              ),
              const SafeSpacer(
                height: 16,
              ),
              CustomDropDownFrom(
                labelText: 'Raza',
                hintText: 'Seleccionar',
                // value: ref.watch(petRegistrationBreedProvider),
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
                  // final provider = ref.read(petRegistrationBreedProvider.notifier);
                  // if (value == 0) {
                  //   provider.update((state) => state = null);
                  //   return;
                  // }
                  // provider.update((state) => state = state = value);
                },
              ),
              const SafeSpacer(
                height: 16,
              ),
              const CustomTextFormField(
                labelText: 'Edad',
                hintText: '10',
                keyboardType: TextInputType.number,
              ),
              const SafeSpacer(
                height: 16,
              ),
              const CustomTextFormField(
                labelText: 'Peso',
                hintText: '23',
                keyboardType: TextInputType.number,
              ),
              const SafeSpacer(
                height: 16,
              ),
              CustomDropDownFrom(
                labelText: 'Genero',
                hintText: 'Seleccionar',
                // value: ref.watch(petRegistrationGenderProvider),
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
                  // print('value');
                  // print(value);
                  // final provider = ref.read(petRegistrationGenderProvider.notifier);
                  // if (value == 0) {
                  //   provider.update((state) => state = null);
                  //   return;
                  // }
                  // provider.update((state) => state = state = value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
