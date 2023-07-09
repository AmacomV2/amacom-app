import 'package:flutter/material.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';

/// Pet selection header on DailyScreen
class PetSelection extends StatelessWidget {
  ///
  const PetSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScrollColumnExpandable(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        HeaderSpacer(),
      ],
    );
  }
}
