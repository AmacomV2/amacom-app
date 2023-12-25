import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/alarm_signs/alarm_signs_provider.dart';
import 'package:amacom_app/src/presentation/state/situations/new_situation_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/alarm_sign_body.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/alarm_sign_card.dart';
import 'package:amacom_app/src/utils/constant/app_constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// AlarmSign list
///
/// ListView with which hace a controller with a listener to
/// fetch more alarmSign on scroll end.
class AlarmSignList extends ConsumerStatefulWidget {
  ///
  const AlarmSignList({
    super.key,
    required this.data,
    required this.controller,
    required this.type,
  });

  ///
  final List<AlarmSignEntity>? data;

  ///
  final ScrollController controller;

  ///
  final AlarmSignType type;

  @override
  ConsumerState<AlarmSignList> createState() => _AlarmSignListState();
}

class _AlarmSignListState extends ConsumerState<AlarmSignList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    var _ = ref.refresh(alarmSignProvider);
    ref.read(alarmSignPageProvider.notifier).update((state) => 0);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    List<AlarmSignEntity> selection = [];
    if (widget.type == AlarmSignType.BABY) {
      selection = ref.watch(babySituationAlarmSignsProvider);
    } else {
      selection = ref.watch(motherSituationAlarmSignsProvider);
    }
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
          return AlarmSignCard(
            data: item,
            isSelected: isSelected,
            onTap: () {
              try {
                final temp = List<AlarmSignEntity>.from(selection);
                if (!isSelected) {
                  temp.add(item!);
                } else {
                  temp.removeWhere((element) => element.id == item?.id);
                }
                if (widget.type == AlarmSignType.BABY) {
                  ref
                      .read(babySituationAlarmSignsProvider.notifier)
                      .update((state) => temp);
                } else {
                  ref
                      .read(motherSituationAlarmSignsProvider.notifier)
                      .update((state) => temp);
                }
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
