import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/domain/entities/logbook.dart';
import 'package:amacom_app/src/presentation/widgets/spacers.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/extensions/extensions.dart';
import 'package:amacom_app/src/utils/utils/global_locator.dart';
import 'package:flutter/material.dart';

/// Logbook card
///
/// Show summarized information about a Logbook
class LogbookCard extends StatelessWidget {
  ///
  const LogbookCard({super.key, this.data, required this.index, this.onTap});

  /// Logbook data to show
  final Logbook? data;

  ///
  final int index;

  ///
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final responsive = GlobalLocator.responsiveDesign;
    final appLocalizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.genericBorderRadius),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: responsive.maxHeightValue(10),
            horizontal: responsive.maxWidthValue(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${data?.createdAt.day} ',
                            style: textTheme.headlineSmall?.copyWith(
                              color: theme.primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: data?.createdAt.monthTextShort(
                              appLocalizations?.localeName ?? '',
                            ),
                            style: textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.air_rounded,
                      color: theme.primaryColor,
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                width: 1,
                color: Colors.black54,
                margin: EdgeInsets.symmetric(
                  horizontal: responsive.maxWidthValue(8),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (data?.name ?? '').capitalize(),
                      maxLines: 1,
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SafeSpacer(
                      height: 6,
                    ),
                    Text(
                      (data?.description ?? '').capitalize(),
                      style: textTheme.bodyLarge?.copyWith(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
