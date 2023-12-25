import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/alarm_sign_body.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/selected_alarm_signs.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

////
class SelectBabyAlarmSigns extends ConsumerWidget {
  ///
  const SelectBabyAlarmSigns({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final responsive = GlobalLocator.responsiveDesign;
    final appLocalizations = AppLocalizations.of(context);

    return Column(
      children: [
        Text(
          '${appLocalizations?.babyAlarmSignsMessage}',
          style: theme.textTheme.bodyLarge?.copyWith(),
          textAlign: TextAlign.justify,
        ),
        const SafeSpacer(
          height: 8,
        ),
        const SelectedAlarmSignsBaby(),
        const SafeSpacer(
          height: 10,
        ),
        GenericRoundedButton(
          onTap: () async {
            await AppDialogs.genericBottomSheet(
              widget: const AlarmSignsBody(
                type: AlarmSignType.BABY,
              ),
            );
          },
          border: true,
          padding: EdgeInsets.symmetric(
            vertical: responsive.maxHeightValue(14),
            horizontal: responsive.maxWidthValue(12),
          ),
          textColor: FigmaColors.secondary_500,
          borderColor: FigmaColors.secondary_300,
          adaptiveTextColor: false,
          text: appLocalizations?.select ?? '',
          suffix: const Icon(
            Icons.add_circle_outline_rounded,
            size: 20,
          ),
        ),
      ],
    );
  }
}
