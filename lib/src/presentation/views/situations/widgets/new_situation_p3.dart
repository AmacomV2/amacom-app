import 'package:amacom_app/src/presentation/views/situations/widgets/select_alarm_sign_baby.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/select_alarm_signs_mother.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

///
class NewSituationPart3 extends StatelessWidget {
  ///
  const NewSituationPart3({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: ColumnWithPadding(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectBabyAlarmSigns(),
          SafeSpacer(),
          SelectMotherAlarmSigns(),
        ],
      ),
    );
  }
}
