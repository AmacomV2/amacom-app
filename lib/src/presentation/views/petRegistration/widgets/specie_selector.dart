import 'package:flutter/material.dart';
import 'package:amacom_app/src/presentation/views/petRegistration/widgets/specie_card.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';

/// Get a list of species from API and shows them
/// allowing user to select one
class SpecieSelector extends StatefulWidget {
  /// Widget constructor
  const SpecieSelector({super.key});

  @override
  State<SpecieSelector> createState() => _SpecieSelectorState();
}

class _SpecieSelectorState extends State<SpecieSelector> {
  final ValueNotifier<int> _selection = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScrollColumnExpandable(
      padding: EdgeInsets.zero,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '¿No tienes mascotas? No te preocupes puedes omitir este registro',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SafeSpacer(
          height: 170,
        ),
        ValueListenableBuilder(
          valueListenable: _selection,
          builder: (BuildContext context, int value, Widget? child) {
            return Wrap(
              children: [
                SpecieSelectionCard(
                  key: UniqueKey(),
                  name: 'Perro',
                  onTap: () {
                    _selection.value = 2;
                  },
                  imagePath: '',
                  selected: value == 2,
                ),
                const HorizontalSpacer(
                  width: 8,
                ),
                SpecieSelectionCard(
                  key: UniqueKey(),
                  name: 'Gato',
                  onTap: () {
                    _selection.value = 1;
                  },
                  imagePath: '',
                  selected: value == 1,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
