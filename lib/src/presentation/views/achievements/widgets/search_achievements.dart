import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/achievements/achievements_fetch.dart';
import 'package:amacom_app/src/presentation/views/achievements/widgets/filters.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// TexField to search achievements
class SearchAchievements extends ConsumerWidget {
  ///
  SearchAchievements({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context);
    final providerNotifier = ref.read(achievementsSearchProvider.notifier);
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            controller: _controller,
            hintText: appLocalizations?.searchText ?? '',
            prefixIcon: const Icon(Icons.search_rounded),
            onSubmit: (value) {
              providerNotifier.update((state) => state = value ?? '');
            },
            suffixIcon: IconButton(
              onPressed: () {
                providerNotifier.update((state) => state = '');
              },
              icon: const Icon(Icons.clear_rounded),
            ),
          ),
        ),
        const HorizontalSpacer(
          width: 8,
        ),
        CustomIconButton(
          icon: Icons.search_rounded,
          onTap: () {
            providerNotifier.update((state) => state = _controller.text);
          },
        ),
        const HorizontalSpacer(
          width: 8,
        ),
        CustomIconButton(
          faIcon: true,
          icon: Icons.filter_list_rounded,
          onTap: () async {
            await AppDialogs.genericBottomSheet(
              widget: const AchievementsFilter(),
            );
          },
        ),
      ],
    );
  }
}
