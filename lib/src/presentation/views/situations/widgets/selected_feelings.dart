import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/situations/new_situation_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/generic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class SelectedFeelings extends ConsumerWidget {
  ///
  const SelectedFeelings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      spacing: 20,
      runSpacing: 10,
      alignment: WrapAlignment.spaceBetween,
      children: [
        ...ref.watch(situationFeelingsProvider).reversed.map(
              (e) => FeelingCard(
                text: e.name,
                image: e.imageUrl,
                onTap: () {
                  final temp = List<GenericData>.from(
                    ref.read(situationFeelingsProvider),
                  );
                  temp.removeWhere((element) => element.id == e.id);
                  ref
                      .read(situationFeelingsProvider.notifier)
                      .update((state) => temp);
                },
              ),
            ),
      ],
    );
  }
}
