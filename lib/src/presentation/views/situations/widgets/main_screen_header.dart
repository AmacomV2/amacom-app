import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/situations/situations_list_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/search_situations.dart';
import 'package:amacom_app/src/presentation/widgets/app_bars.dart';
import 'package:amacom_app/src/presentation/widgets/icon_buttons.dart';
import 'package:amacom_app/src/presentation/widgets/spacers.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class SituationsHeader extends ConsumerWidget {
  ///
  const SituationsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context);
    return Column(
      children: [
        CustomAppBar(
          title: appLocalizations?.situations,
          centerTitle: true,
          prefix: CustomIconButton(
            icon: Icons.refresh,
            onTap: () {
              // monitor network fetch
              var _ = ref.refresh(situationsProvider);
              ref.read(situationsPageProvider.notifier).update((state) => 0);
            },
          ),
          titleIcon: const ImageIcon(
            AssetImage(
              'assets/icon/report.png',
            ),
            size: 21,
          ),
          action: CustomIconButton(
            icon: Icons.add_rounded,
            onTap: () => Navigation.goTo(CustomAppRouter.newSituation),
          ),
        ),
        const SafeSpacer(),
        SearchSituations(),
      ],
    );
  }
}
