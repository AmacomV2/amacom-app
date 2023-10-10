import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// New situation header widget
class NewSituationHeader extends StatelessWidget {
  ///
  const NewSituationHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ColumnWithPadding(
      children: [
        CustomAppBar(
          title: 'NUEVA SITUACIÓN',
          centerTitle: true,
          includeBottomSpacer: false,
        ),
      ],
    );
  }
}
