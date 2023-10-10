import 'package:amacom_app/src/presentation/state/situations/new_situation_provider.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// New situation form button
class NewSituationButton extends ConsumerWidget {
  ///
  const NewSituationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = GlobalLocator.responsiveDesign;
    return CustomButtonWithState(
      onTap: () {},
      text: ref.watch(newSituationIndexProvider) != 4 ? 'Siguiente' : 'Enviar',
      margin: responsive.appHorizontalPadding.copyWith(
        top: responsive.maxHeightValue(16),
      ),
    );
  }
}
