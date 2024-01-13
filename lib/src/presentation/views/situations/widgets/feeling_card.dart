import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

///
class FeelingCard extends StatelessWidget {
  ///
  const FeelingCard({
    super.key,
    required this.data,
    required this.isSelected,
    required this.onTap,
  });

  ///
  final GenericData? data;

  ///
  final bool isSelected;

  ///
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(
          vertical: 4,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.cardRadius),
          side: BorderSide(
            color: isSelected ? FigmaColors.primary_200 : Colors.white,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            8,
          ),
          child: Row(
            children: [
              const HorizontalSpacer(
                width: 8,
              ),
              data?.imageUrl == null
                  ? const Icon(
                      Icons.image_not_supported_outlined,
                      size: 28,
                    )
                  : CachedNetworkImage(
                      imageUrl: data?.imageUrl ?? '',
                      height: 20,
                    ),
              const HorizontalSpacer(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${data?.name}',
                      maxLines: 3,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      data?.description ?? '',
                      maxLines: 4,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              CustomCheckBox(
                size: 18,
                selected: isSelected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
