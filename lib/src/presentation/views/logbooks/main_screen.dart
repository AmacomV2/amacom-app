import 'package:amacom_app/src/presentation/views/logbooks/widgets/widgets.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// Logbooks screen
///
/// Shows a list of user logbooks
class LogbooksScreen extends StatelessWidget {
  ///
  const LogbooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      floatingActionButton: AddLogbook(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          LogbooksHeader(),
          Expanded(child: LogbooksBody()),
        ],
      ),
    );
  }
}
