import 'package:amacom_app/src/presentation/state/situations/new_situation_provider.dart';
import 'package:amacom_app/src/presentation/state/situations/situation_provider.dart';
import 'package:amacom_app/src/presentation/views/screens.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/widgets.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/global_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class MainWebBody extends ConsumerWidget {
  ///
  const MainWebBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = GlobalLocator.responsiveDesign;
    return Row(
      children: [
        SizedBox(
          width: responsive.isScreenEnough()
              ? responsive.webMultipleViewMainWidth()
              : double.infinity,
          child: const CustomScaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            // floatingActionButton: AddSituationsButton(),
            body: ColumnWithPadding(
              children: [
                SituationsHeader(),
                SafeSpacer(),
                Expanded(
                  child: SituationsBody(),
                ),
              ],
            ),
          ),
        ),
        if (!ref.watch(creatingSituationProvider) &&
            ref.watch(selectedSituationProvider) != null)
          const Expanded(child: SituationDetailScreen()),
        if (ref.watch(creatingSituationProvider))
          const Expanded(child: NewSituationScreen()),
      ],
    );
  }
}
