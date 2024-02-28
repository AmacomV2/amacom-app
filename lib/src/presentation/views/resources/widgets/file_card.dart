import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/utils/constant/app_constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

///
class ResourceFileCard extends StatelessWidget {
  ///
  const ResourceFileCard({
    super.key,
    required this.data,
    required this.onTap,
  });

  /// Situation basic data
  final SupportMaterialFile? data;

  ///
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final responsive = GlobalLocator.responsiveDesign;
    final theme = Theme.of(context);
    final type = ResourceTypeHelper.getResourceType(data?.path ?? '');
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: Colors.grey[350],
          borderRadius: BorderRadius.circular(AppConstants.cardRadius),
        ),
        height: responsive.maxHeightValue(125),
        clipBehavior: Clip.hardEdge,
        width: responsive.maxWidthValue(170),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            if (type == ResourceType.IMAGE && kIsWeb)
              Image.network(
                data?.path ?? '',
                height: responsive.maxHeightValue(125),
              ).paddingBottom(25),
            if (type == ResourceType.IMAGE && !kIsWeb)
              CachedNetworkImage(
                imageUrl: data?.path ?? '',
                height: responsive.maxHeightValue(125),
              ).paddingBottom(25),
            if (type != ResourceType.IMAGE)
              Image.asset(
                ResourceTypeHelper.getTypeImage(type),
                height: responsive.maxHeightValue(125),
              ).paddingOnly(
                top: 4,
                bottom: 40,
              ),
            Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: FigmaColors.information_500,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: responsive.maxWidthValue(8),
                vertical: responsive.maxHeightValue(2),
              ),
              height: responsive.maxHeightValue(50),
              width: responsive.maxWidthValue(170),
              child: Text(
                '${data?.name ?? ''}.'.replaceAll('..', '.'),
                maxLines: 2,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: FigmaColors.getFontColorForBackground(
                    FigmaColors.information_800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
