import 'package:amacom_app/src/domain/entities/logbook.dart';
import 'package:amacom_app/src/domain/entities/pageable/pageable.dart';
import 'package:amacom_app/src/presentation/state/logbooks/logbook_provider.dart';
import 'package:amacom_app/src/presentation/views/logbooks/widgets/widgets.dart';
import 'package:amacom_app/src/presentation/widgets/spacers.dart';
import 'package:amacom_app/src/utils/constant/app_constants.dart';
import 'package:amacom_app/src/utils/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Logbooks list
///
/// ListView with which hace a controller with a listener to
/// fetch more logbooks on scroll end.
class LogbooksList extends ConsumerWidget {
  ///
  const LogbooksList({super.key, required this.data, required this.controller});

  ///
  final Pageable<List<Logbook>>? data;

  ///
  final ScrollController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int lastYear = data?.content?.first.createdAt.year ?? 0;
    final textTheme = Theme.of(context).textTheme;
    return ListView.separated(
      padding: const EdgeInsets.only(
        bottom: 90,
      ),
      controller: controller,
      physics: AppConstants.scrollPhysics,
      itemCount: data?.content?.length ?? 0,
      separatorBuilder: (BuildContext context, int index) => const SafeSpacer(
        height: 8,
      ),
      itemBuilder: (context, index) {
        final logbook = data?.content?[index];
        final card = LogbookCard(
          data: logbook,
          index: index,
          onTap: () {
            ref
                .read(selectedLogbookProvider.notifier)
                .update((state) => logbook);
            Navigation.goTo(CustomAppRouter.logbookDetail);
          },
        );
        if (index == 0 || (logbook?.createdAt.year ?? 0) < lastYear) {
          lastYear = logbook?.createdAt.year ?? 0;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 4,
                ),
                child: Text(
                  '$lastYear',
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              card,
            ],
          );
        }
        return card;
      },
    );
  }
}
