import 'package:amacom_app/src/domain/entities/logbook.dart';
import 'package:amacom_app/src/presentation/state/logbooks/logbook_provider.dart';
import 'package:amacom_app/src/presentation/state/logbooks/logbooks_provider.dart';
import 'package:amacom_app/src/presentation/views/logbooks/widgets/widgets.dart';
import 'package:amacom_app/src/presentation/widgets/spacers.dart';
import 'package:amacom_app/src/utils/constant/app_constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// Logbooks list
///
/// ListView with which hace a controller with a listener to
/// fetch more logbooks on scroll end.
class LogbooksList extends ConsumerStatefulWidget {
  ///
  const LogbooksList({super.key, required this.data, required this.controller});

  ///
  final List<Logbook>? data;

  ///
  final ScrollController controller;

  @override
  ConsumerState<LogbooksList> createState() => _LogbooksListState();
}

class _LogbooksListState extends ConsumerState<LogbooksList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    var _ = ref.refresh(logbooksProvider);
    ref.read(logbookPageProvider.notifier).update((state) => 0);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    int lastYear = widget.data?.first.createdAt.year ?? 0;
    final textTheme = Theme.of(context).textTheme;
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      child: ListView.separated(
        padding: const EdgeInsets.only(
          bottom: 90,
        ),
        controller: widget.controller,
        physics: AppConstants.scrollPhysics,
        itemCount: widget.data?.length ?? 0,
        separatorBuilder: (BuildContext context, int index) => const SafeSpacer(
          height: 8,
        ),
        itemBuilder: (context, index) {
          final logbook = widget.data?[index];
          final card = LogbookCard(
            data: logbook,
            index: index,
            onTap: () {
              ref
                  .read(selectedLogbookProvider.notifier)
                  .update((state) => logbook);
              Navigation.goTo(CustomAppRouter.logbookDetail);
              FocusScope.of(context).unfocus();
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
      ),
    );
  }
}
