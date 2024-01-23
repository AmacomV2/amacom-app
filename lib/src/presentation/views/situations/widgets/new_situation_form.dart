import 'package:amacom_app/src/presentation/state/situations/new_situation_provider.dart';
import 'package:amacom_app/src/presentation/state/subjects/subject_selection.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/new_situation_p1.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/new_situation_p2.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/new_situation_p3.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/new_situation_p4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// New situation paginated form
class NewSituationForm extends ConsumerWidget {
  ///
  const NewSituationForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(selectedSubject);
    return [
      NewSituationPart1(
        formKey: ref.watch(newSituationForm1Key),
      ),
      NewSituationPart2(
        formKey: ref.watch(newSituationForm2Key),
      ),
      const NewSituationPart3(),
      const NewSituationP4(),
    ][ref.watch(newSituationIndexProvider)];
  }
}
