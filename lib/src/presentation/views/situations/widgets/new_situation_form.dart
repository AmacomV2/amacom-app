import 'package:amacom_app/src/presentation/state/situations/new_situation_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/new_situation_p1.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/new_situation_p2.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/new_situation_p3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// New situation paginated form
class NewSituationForm extends ConsumerWidget {
  ///
  const NewSituationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return [
      const NewSituationPart1(),
      const NewSituationPart2(),
      const NewSituationPart3(),
      const NewSituationPart3(),
      const NewSituationPart3(),
    ][ref.watch(newSituationIndexProvider)];
  }
}
