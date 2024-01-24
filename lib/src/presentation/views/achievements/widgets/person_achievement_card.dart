import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class PersonAchievementCard extends ConsumerStatefulWidget {
  ///
  const PersonAchievementCard({
    super.key,
    this.data,
    required this.onScoreUpdate,
  });

  ///
  final PersonAchievement? data;

  ///
  final Function(int) onScoreUpdate;

  @override
  ConsumerState<PersonAchievementCard> createState() =>
      _PersonAchievementCardState();
}

class _PersonAchievementCardState extends ConsumerState<PersonAchievementCard> {
  bool expanded = false;
  String? parentId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.only(
        top: 2,
        bottom: 3,
        right: 6,
        left: 6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.data?.achievement.name ?? '',
            style: theme.textTheme.bodyLarge,
          ),
          const SafeSpacer(
            height: 8,
          ),
          Text(
            widget.data?.achievement.description ?? '',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 15,
            ),
            maxLines: 4,
          ),
          const SafeSpacer(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(AppConstants.cardRadius),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${appLocalizations?.currentScore}: ',
                    style: theme.textTheme.bodyLarge,
                    maxLines: 4,
                  ),
                ),
                DegreeSelectorReverse(
                  onChanged: widget.onScoreUpdate,
                  initialValue: widget.data?.getScore() ?? 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
