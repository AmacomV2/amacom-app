import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/situations/situations_list_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/situations_filter.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/app_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// TexField to search logbooks
class SearchSituations extends ConsumerWidget {
  ///
  SearchSituations({super.key});

  final _controller = TextEditingController();
  final FocusNode _inputFocusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context);
    final providerNotifier = ref.read(situationsSearchProvider.notifier);
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            focusNode: _inputFocusNode,
            controller: _controller,
            hintText: appLocalizations?.searchText ?? '',
            prefixIcon: const Icon(Icons.search_rounded),
            onSubmit: (value) {
              providerNotifier.update((state) => state = value ?? '');
            },
            suffixIcon: IconButton(
              onPressed: () {
                _controller.text = '';
                providerNotifier.update((state) => state = '');
                ref
                    .read(situationsStatusProvider.notifier)
                    .update((state) => state = null);
                ref
                    .read(situationsAlertProvider.notifier)
                    .update((state) => state = null);
                _inputFocusNode.unfocus();
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
              widget: const SituationsFilter(),
            );
          },
        ),
      ],
    );
  }
}
