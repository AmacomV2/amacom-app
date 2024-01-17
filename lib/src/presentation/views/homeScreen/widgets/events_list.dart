import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/extensions/extensions.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';

///
class EventsListHome extends StatelessWidget {
  ////
  const EventsListHome({super.key, required this.events});

  ///
  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final responsive = GlobalLocator.responsiveDesign;

    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        ...events.map((e) {
          if (e.from.isAfter(now.subtract(const Duration(hours: 1)))) {
            if (e.to.isBefore(now.add(const Duration(hours: 5)))) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: e.background,
                  borderRadius: BorderRadius.circular(AppConstants.cardRadius),
                ),
                margin: EdgeInsets.only(
                  bottom: responsive.maxHeightValue(14),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    if (now.isBetWeenDateTime(e.from, e.to))
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
                    Text(
                      '${e.from.timeToText().replaceAll("am", "").replaceAll("pm", "")}- ${e.to.timeToText()}',
                      style: textTheme.bodyLarge?.copyWith(
                        color:
                            FigmaColors.getFontColorForBackground(e.background),
                      ),
                    ),
                  ],
                ),
              );
            }
          }
          return Container();
        }).toList(),
      ],
    );
  }
}
