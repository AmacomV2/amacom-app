import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/subjects/subjects_list_provider.dart';
import 'package:amacom_app/src/presentation/views/resources/widgets/search_resources.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Resources main screen header
class ResourcesHeader extends ConsumerWidget {
  ///
  const ResourcesHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context);

    return ColumnWithPadding(
      children: [
        CustomAppBar(
          title: appLocalizations?.resources,
          centerTitle: true,
          prefix: CustomIconButton(
            icon: Icons.refresh,
            onTap: () {
              ref.read(subjectsPageProvider.notifier).update((state) => 0);
            },
          ),
          titleIcon: const ImageIcon(
            AssetImage(
              'assets/icon/open-folder.png',
            ),
            size: 22,
          ),
        ),
        SearchResources(),
      ],
    );
  }
}
