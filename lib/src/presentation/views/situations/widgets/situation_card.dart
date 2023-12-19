import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/domain/entities/situations.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/global_locator.dart';
import 'package:flutter/material.dart';

///
class SituationCard extends StatelessWidget {
  ///
  const SituationCard({
    super.key,
    required this.data,
    required this.index,
    required this.onTap,
  });

  /// Situation basic data
  final SituationEntity? data;

  ///
  final int index;

  ///
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final responsive = GlobalLocator.responsiveDesign;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final appLocalizations = AppLocalizations.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.maxWidthValue(4),
        vertical: responsive.maxHeightValue(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: CoolDateToText(
                  date: data?.createdAt ?? DateTime.now(),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 17,
              ),
            ],
          ),
          Row(
            children: [
              Tooltip(
                message: AppSituationsData.statusMessage(
                  status: data?.currentDiagnosis?.consultationStatus,
                  appLocalizations: appLocalizations!,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppConstants.cardRadius),
                    border: Border.all(),
                  ),
                  height: 50,
                  width: 50,
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
              const HorizontalSpacer(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data?.description ?? '',
                      style: textTheme.bodyLarge?.copyWith(
                        fontSize: 15,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
