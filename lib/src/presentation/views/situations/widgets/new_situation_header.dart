import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/situations/new_situation_provider.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// New situation header widget
class NewSituationHeader extends ConsumerWidget {
  ///
  const NewSituationHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context);

    return ColumnWithPadding(
      children: [
        CustomAppBar(
          title: '${appLocalizations?.newSituation.toUpperCase()}',
          centerTitle: true,
          includeBottomSpacer: false,
          onBack: () {
            final indexProvider = ref.read(newSituationIndexProvider);
            final indexProviderNotifier =
                ref.read(newSituationIndexProvider.notifier);
            if (indexProvider == 0) {
              Navigation.goBack();
            } else {
              indexProviderNotifier.update((state) => indexProvider - 1);
            }
          },
        ),
      ],
    );
  }
}
