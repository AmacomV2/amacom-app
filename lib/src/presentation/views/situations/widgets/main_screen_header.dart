import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/situations/situations_list_provider.dart';
import 'package:amacom_app/src/presentation/widgets/app_bars.dart';
import 'package:amacom_app/src/presentation/widgets/icon_buttons.dart';
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
    return CustomAppBar(
      title: appLocalizations?.situations,
      centerTitle: true,
      prefix: CustomIconButton(
        size: 24,
        icon: Icons.refresh,
        onTap: () {
          ref.invalidate(situationsListProvider);
        },
      ),
      titleIcon: const ImageIcon(
        AssetImage(
          'assets/icon/report.png',
        ),
        size: 21,
      ),
      action: AddIconButton(
        onTap: () => Navigation.goTo(CustomAppRouter.newSituation),
      ),
    );
  }
}
