import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/events/calendar_view.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/extensions/extensions.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class EventsListHome extends ConsumerWidget {
  ////
  const EventsListHome({super.key, required this.events});

  ///
  final List<Event> events;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = GlobalLocator.responsiveDesign;

    final textTheme = Theme.of(context).textTheme;
    final now = ref.read(calendarHomeStartDateProvider).copyWith(
          hour: DateTime.now().hour,
        );
    return Column(
      children: [
        ...events.map((e) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: e.background,
              borderRadius: BorderRadius.circular(AppConstants.cardRadius),
            ),
            margin: EdgeInsets.only(
              bottom: responsive.maxHeightValue(10),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 7,
            ),
            child: Row(
              children: [
                if (now.isBetWeenDateTime(e.from, e.to) &&
                    now.isSameDay(DateTime.now()))
                  Row(
                    children: [
                      Icon(
                        Icons.play_arrow_rounded,
                        color: FigmaColors.getFontColorForBackground(
                          e.background,
                        ),
                      ),
                      const HorizontalSpacer(
                        width: 5,
                      ),
                    ],
                  ),
                Expanded(
                  child: Text(
                    e.eventName,
                    maxLines: 2,
                    style: textTheme.bodyLarge?.copyWith(
                      color: FigmaColors.getFontColorForBackground(
                        e.background,
                      ),
                    ),
                  ),
                ),
                const HorizontalSpacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      e.from.onlyDate(),
                      style: textTheme.bodyLarge?.copyWith(
                        color:
                            FigmaColors.getFontColorForBackground(e.background),
                      ),
                    ),
                    Text(
                      '${e.from.timeToText().replaceAll("am", "").replaceAll("pm", "")}- ${e.to.timeToText()}',
                      style: textTheme.bodyLarge?.copyWith(
                        color:
                            FigmaColors.getFontColorForBackground(e.background),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
