import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/situations/new_situation_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/generic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class SelectedAlarmSignsBaby extends ConsumerWidget {
  ///
  const SelectedAlarmSignsBaby({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ...ref.watch(babySituationAlarmSignsProvider).reversed.map(
              (e) => GenericDismissibleCard(
                text: e.name,
                onTap: () {
                  final temp = List<AlarmSignEntity>.from(
                    ref.read(babySituationAlarmSignsProvider),
                  );
                  temp.removeWhere((element) => element.id == e.id);
                  ref
                      .read(babySituationAlarmSignsProvider.notifier)
                      .update((state) => temp);
                },
              ),
            ),
      ],
    );
  }
}

///
class SelectedAlarmSignsMother extends ConsumerWidget {
  ///
  const SelectedAlarmSignsMother({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ...ref.watch(motherSituationAlarmSignsProvider).reversed.map(
              (e) => GenericDismissibleCard(
                text: e.name,
                onTap: () {
                  final temp = List<AlarmSignEntity>.from(
                    ref.read(motherSituationAlarmSignsProvider),
                  );
                  temp.removeWhere((element) => element.id == e.id);
                  ref
                      .read(motherSituationAlarmSignsProvider.notifier)
                      .update((state) => temp);
                },
              ),
            ),
      ],
    );
  }
}
