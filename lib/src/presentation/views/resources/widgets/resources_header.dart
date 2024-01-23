import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/resources/resources_fetch.dart';
import 'package:amacom_app/src/presentation/state/subjects/subject_selection.dart';
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
    final textTheme = Theme.of(context).textTheme;
    return ColumnWithPadding(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(
          title: appLocalizations?.resources,
          centerTitle: true,
          prefix: CustomIconButton(
            icon: Icons.refresh,
            onTap: () {
              var _ = ref.refresh(resourcesProvider);
              ref.read(resourcesPageProvider.notifier).update((state) => 0);
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
        const SafeSpacer(
          height: 10,
        ),
        if (ref.watch(selectedSubject) != null)
          ChoiceChip(
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            selected: true,
            onSelected: (_) {
              ref.read(selectedSubject.notifier).update((state) => null);
            },
            avatar: const Icon(
              Icons.check_circle_outline_rounded,
              color: Colors.white,
            ),
            label: Text(
              ref.read(selectedSubject)?.name ?? '',
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}
