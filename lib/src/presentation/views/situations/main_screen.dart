import 'package:amacom_app/src/presentation/views/situations/widgets/widgets.dart';
import 'package:amacom_app/src/presentation/widgets/column_with_padding.dart';
import 'package:amacom_app/src/presentation/widgets/custom_scaffold.dart';
import 'package:amacom_app/src/presentation/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

///
class SituationsScreen extends StatelessWidget {
  ///
  const SituationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: const CustomScaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        // floatingActionButton: AddSituationsButton(),
        body: ColumnWithPadding(
          children: [
            SituationsHeader(),
            SafeSpacer(),
            Expanded(
              child: SituationsBody(),
            ),
          ],
        ),
      ),
      web: const MainWebBody(),
    );
  }
}
