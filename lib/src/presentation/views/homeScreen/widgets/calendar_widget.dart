import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/presentation/state/events/calendar_view.dart';
import 'package:amacom_app/src/presentation/views/homeScreen/widgets/events_list.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Stores H-list widget
class Stores extends ConsumerStatefulWidget {
  ///
  const Stores({
    super.key,
  });

  @override
  ConsumerState<Stores> createState() => _StoresState();
}

class _StoresState extends ConsumerState<Stores> {
  @override
  void initState() {
    final date = DateTime.now();
    Future.delayed(Duration.zero, () {
      ref.read(calendarStartDateProvider.notifier).update((state) => date);
      ref
          .read(calendarEndDateProvider.notifier)
          .update((state) => date.add(const Duration(days: 1)));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CalendarTimeline(
          initialDate: ref.watch(calendarStartDateProvider),
          firstDate: DateTime.now().subtract(const Duration(days: 30)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date) {
            ref
                .read(calendarStartDateProvider.notifier)
                .update((state) => date);
            ref
                .read(calendarEndDateProvider.notifier)
                .update((state) => date.add(const Duration(days: 1)));
          },
          leftMargin: 20,
          showYears: false,
          dayColor: FigmaColors.primary_200,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: FigmaColors.primary_50,
          dotsColor: FigmaColors.primary_100,
          // selectableDayPredicate: (date) => date.day != 23,
        ),
        const SafeSpacer(),
        ref.watch(calendarEventsFProvider).when(
              data: (data) {
                if (data.isEmpty) {
                  return const SizedBox();
                }
                return EventsListHome(events: data);
              },
              error: (error, stackTrace) => Container(),
              loading: () => const SizedCustomProgressIndicator2(),
            ),
        const SafeSpacer(),
        const Text(
          'Novedades',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SafeSpacer(),
      ],
    );
  }
}
