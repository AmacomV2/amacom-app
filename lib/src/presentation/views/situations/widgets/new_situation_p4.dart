import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/alarm_sign_body.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

///
class NewSituationPart4 extends StatelessWidget {
  ///
  const NewSituationPart4({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context);
    return ColumnWithPadding(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${appLocalizations?.babyAlarmSignsMessage}',
          style: theme.textTheme.bodyLarge?.copyWith(),
          textAlign: TextAlign.justify,
        ),
        const SafeSpacer(
          height: 8,
        ),
        const Expanded(
          child: AlarmSignsBody(
            type: AlarmSignType.BABY,
          ),
        ),
      ],
    );
  }
}
