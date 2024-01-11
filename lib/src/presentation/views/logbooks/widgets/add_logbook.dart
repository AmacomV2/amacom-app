import 'package:amacom_app/src/utils/utils/navigation.dart';
import 'package:flutter/material.dart';

/// Add logbook button shown on logbooks main screen
class AddLogbook extends StatelessWidget {
  ///
  const AddLogbook({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigation.goTo(CustomAppRouter.logbookCreation);
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(999),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
