import 'package:amacom_app/src/presentation/state/situations/situation_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/situation_description.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/situation_diagnosis.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class SituationDetailBody extends ConsumerWidget {
  ///
  const SituationDetailBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(selectedSituationDataIndexProvider);
    return FadeIn(
      key: UniqueKey(),
      child: [
        const SituationDescription(),
        const SituationDiagnosis(),
      ][index],
    );
  }
}
