import 'package:amacom_app/src/presentation/state/subjects/subject_selection.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/generic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class SelectedSubjects extends ConsumerWidget {
  ///
  const SelectedSubjects({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subject = ref.watch(selectedSubject);
    if (subject == null) {
      return Container();
    }
    return GenericDismissibleCard(
      text: subject.name,
      onTap: () {
        ref.read(selectedSubject.notifier).update((state) => null);
      },
    );
  }
}
