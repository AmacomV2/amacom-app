import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/widgets/spacers.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/global_locator.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

///
class SituationConsultationStatusFilter extends StatefulWidget {
  ///
  const SituationConsultationStatusFilter({
    super.key,
    required this.onSelection,
    this.currentSelection,
  });

  ///
  final Function(String?) onSelection;

  /// Current selection
  final String? currentSelection;

  @override
  State<SituationConsultationStatusFilter> createState() =>
      _SituationConsultationStatusFilterState();
}

class _SituationConsultationStatusFilterState
    extends State<SituationConsultationStatusFilter> {
  final responsive = GlobalLocator.responsiveDesign;
  String? status;
  @override
  void initState() {
    status = widget.currentSelection;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final appLocalizations = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${appLocalizations?.consultationStatus}:',
          style: textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SafeSpacer(
          height: 8,
        ),
        Wrap(
          children: AppSituationsData.statuses
              .map(
                (e) => ChoiceChip(
                  padding: responsive.appHInnerPadding.copyWith(
                    top: 5,
                    bottom: 5,
                  ),
                  selected: e == status,
                  onSelected: (_) {
                    setState(() {
                      status = e;
                    });
                    widget.onSelection.call(e);
                  },
                  avatar: Image.asset(
                    AppSituationsData.statusImage(e),
                  ),
                  label: Text(
                    AppSituationsData.statusMessageFilter(
                      status: e,
                      appLocalizations: appLocalizations!,
                    ),
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ).paddingRight(10),
              )
              .toList(),
        ),
      ],
    );
  }
}
