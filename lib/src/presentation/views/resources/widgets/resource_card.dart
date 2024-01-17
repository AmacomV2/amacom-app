import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/utils/utils/global_locator.dart';
import 'package:flutter/material.dart';

///
class ResourceCard extends StatelessWidget {
  ///
  const ResourceCard({
    super.key,
    required this.data,
    required this.index,
    required this.onTap,
  });

  /// Situation basic data
  final GenericData? data;

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
                child: Text(
                  data?.name ?? '',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
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
