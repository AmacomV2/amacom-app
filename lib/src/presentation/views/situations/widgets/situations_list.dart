import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/situations/situation_provider.dart';
import 'package:amacom_app/src/presentation/state/situations/situations_list_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/situation_card.dart';
import 'package:amacom_app/src/utils/constant/app_constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// Situations list
///
/// ListView with which hace a controller with a listener to
/// fetch more situations on scroll end.
class SituationsList extends ConsumerStatefulWidget {
  ///
  const SituationsList({
    super.key,
    required this.data,
    required this.controller,
  });

  ///
  final List<SituationEntity>? data;

  ///
  final ScrollController controller;

  @override
  ConsumerState<SituationsList> createState() => _SituationsListState();
}

class _SituationsListState extends ConsumerState<SituationsList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    var _ = ref.refresh(situationsProvider);
    ref.read(situationsPageProvider.notifier).update((state) => 0);
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
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 8,
        ),
        itemBuilder: (context, index) {
          final situation = widget.data?[index];
          final card = SituationCard(
            data: situation,
            index: index,
            onTap: () {
              ref
                  .read(selectedSituationProvider.notifier)
                  .update((state) => situation);
              Navigation.goTo(CustomAppRouter.situationDetail);
            },
          );
          if (index == 0 || (situation?.createdAt.year ?? 0) < lastYear) {
            lastYear = situation?.createdAt.year ?? 0;
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
