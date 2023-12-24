import 'package:amacom_app/src/presentation/views/situations/widgets/select_feeling.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

///
class NewSituationPart2 extends StatelessWidget {
  ///
  const NewSituationPart2({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: ColumnWithPadding(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Describe como te sentiste ante la situación.',
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SafeSpacer(),
          const CustomTextFormField(
            minLines: 2,
            maxLines: 5,
            labelText: 'Describe tu primer pensamiento',
          ),
          const SafeSpacer(),
          const CustomTextFormField(
            minLines: 2,
            maxLines: 5,
            labelText: 'Describe el comportamiento tomado',
          ),
          const SafeSpacer(),
          const SelectFeeling(),
        ],
      ),
    );
  }
}
