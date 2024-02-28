import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/domain/entities/alarm_sign.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:flutter/material.dart';

///
class AlarmSignCard extends StatelessWidget {
  ///
  const AlarmSignCard({
    super.key,
    required this.data,
    required this.isSelected,
    required this.onTap,
    this.showCheckBox = true,
  });

  ///
  final AlarmSignEntity? data;

  ///
  final bool isSelected;

  ///
  final bool showCheckBox;

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
                      '${data?.description}',
                      maxLines: 4,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              if (showCheckBox)
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
