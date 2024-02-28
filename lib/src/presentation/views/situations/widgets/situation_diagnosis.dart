import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/situations/situation_provider.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

///
class SituationDiagnosis extends ConsumerWidget {
  ///
  const SituationDiagnosis({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context);
    return ScrollColumnExpandable(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ref.watch(selectedSituationAllDataProvider).when(
              data: (data) {
                if (data?.currentDiagnosis == null) {
                  return const Center(child: EmptyListWidget());
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: LabeledText2(
                            label: (appLocalizations?.consultationAlert ?? '')
                                .capitalizeEachWord(),
                            text: AppSituationsData.alertMessage(
                              alert: data?.currentDiagnosis?.consultationAlert,
                              appLocalizations: appLocalizations!,
                            ),
                          ),
                        ),
                        Tooltip(
                          message: AppSituationsData.alertMessage(
                            alert: data?.currentDiagnosis?.consultationAlert
                                .capitalizeEachWord(),
                            appLocalizations: appLocalizations,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppConstants.cardRadius,
                              ),
                              border: Border.all(
                                width: 0.1,
                              ),
                            ),
                            height: 55,
                            width: 55,
                            padding: const EdgeInsets.all(8),
                            child: Icon(
                              AppSituationsData.alertIcon(
                                data?.currentDiagnosis?.consultationAlert,
                              ),
                              size: 35,
                              color: AppSituationsData.categoriesColor[
                                  data?.currentDiagnosis?.consultationAlert],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SafeSpacer(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: LabeledText2(
                            label: appLocalizations.consultationStatus
                                .capitalizeEachWord(),
                            text: AppSituationsData.statusMessage(
                              status:
                                  data?.currentDiagnosis?.consultationStatus,
                              appLocalizations: appLocalizations,
                            ),
                          ),
                        ),
                        Tooltip(
                          message: AppSituationsData.statusMessage(
                            status: data?.currentDiagnosis?.consultationStatus,
                            appLocalizations: appLocalizations,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppConstants.cardRadius,
                              ),
                              border: Border.all(
                                width: 0.1,
                              ),
                            ),
                            height: 55,
                            width: 55,
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              AppSituationsData.statusImage(
                                data?.currentDiagnosis?.consultationStatus,
                              ),
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SafeSpacer(
                      height: 8,
                    ),
                    LabeledText2(
                      label: appLocalizations.consultationResult
                          .capitalizeEachWord(),
                      text:
                          '${data?.currentDiagnosis?.consultationResult.capitalizeFirstLetter()}',
                    ),
                    const SafeSpacer(),
                    GenericRoundedButton(
                      text: appLocalizations.interventions,
                      leading: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                      ),
                      border: true,
                      onTap: () {},
                    ),
                    const SafeSpacer(),
                    GenericRoundedButton(
                      text: appLocalizations.results,
                      leading: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                      ),
                      border: true,
                      onTap: () {},
                    ),
                    const BottomSpacer(),
                  ],
                );
              },
              error: (error, stackTrace) => Container(),
              loading: () => const SizedCustomProgressIndicator(),
            ),
      ],
    );
  }
}
