import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/feelings/feelings_provider.dart';
import 'package:amacom_app/src/presentation/state/situations/new_situation_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/feeling_card.dart';
import 'package:amacom_app/src/utils/constant/app_constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// Feelings list
///
/// ListView with which hace a controller with a listener to
/// fetch more feelings on scroll end.
class FeelingsList extends ConsumerStatefulWidget {
  ///
  const FeelingsList({
    super.key,
    required this.data,
    required this.controller,
  });

  ///
  final List<GenericData>? data;

  ///
  final ScrollController controller;

  @override
  ConsumerState<FeelingsList> createState() => _FeelingsListState();
}

class _FeelingsListState extends ConsumerState<FeelingsList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    var _ = ref.refresh(feelingsProvider);
    ref.read(feelingsPageProvider.notifier).update((state) => 0);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final selection = ref.watch(situationFeelingsProvider);
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
          thickness: 0.4,
        ),
        itemBuilder: (context, index) {
          final item = widget.data?[index];
          final bool isSelected =
              selection.where((element) => element.id == item?.id).isNotEmpty;
          return FeelingCard(
            data: item,
            isSelected: isSelected,
            onTap: () {
              try {
                final temp = List<GenericData>.from(selection);
                if (!isSelected) {
                  temp.add(item!);
                } else {
                  temp.removeWhere((element) => element.id == item?.id);
                }
                ref
                    .read(situationFeelingsProvider.notifier)
                    .update((state) => temp);
              } catch (e) {
                GlobalLocator.appLogger.e(e);
              }
            },
          );
        },
      ),
    );
  }
}
