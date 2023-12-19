import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/situations/situations_list_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/situation_consultation_alert_filter.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/situation_consultation_status_filter.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/global_locator.dart';
import 'package:amacom_app/src/utils/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class SituationsFilter extends ConsumerStatefulWidget {
  ///
  const SituationsFilter({super.key});

  @override
  ConsumerState<SituationsFilter> createState() => _SituationsFilterState();
}

class _SituationsFilterState extends ConsumerState<SituationsFilter> {
  final responsive = GlobalLocator.responsiveDesign;
  String? status;
  String? alert;
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SituationConsultationStatusFilter(
            currentSelection: ref.read(situationsStatusProvider),
            onSelection: (value) {
              status = value;
            },
          ),
          const SafeSpacer(
            height: 14,
          ),
          SituationConsultationAlertFilter(
            currentSelection: ref.read(situationsAlertProvider),
            onSelection: (value) {
              alert = value;
            },
          ),
          const Spacer(),
          Center(
            child: CustomButtonWithState(
              onTap: () {
                ref
                    .read(situationsAlertProvider.notifier)
                    .update((state) => alert);
                ref
                    .read(situationsStatusProvider.notifier)
                    .update((state) => status);
                Navigation.goBack();
              },
              text: appLocalizations?.accept ?? '',
            ),
          ),
          const SafeSpacer(),
        ],
      ),
    );
  }
}
