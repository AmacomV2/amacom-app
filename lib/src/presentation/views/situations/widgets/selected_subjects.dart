import 'package:amacom_app/src/presentation/state/situations/new_situation_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/generic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class SelectedSubjects extends ConsumerWidget {
  ///
  const SelectedSubjects({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subject = ref.watch(situationSubjectProvider);
    if (subject == null) {
      return Container();
    }
    return GenericDismissibleCard(
      text: subject.name,
      onTap: () {
        ref.read(situationSubjectProvider.notifier).update((state) => null);
      },
    );
  }
}
