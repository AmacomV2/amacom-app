import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/logbooks/logbooks_provider.dart';
import 'package:amacom_app/src/presentation/widgets/custom_text_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// TexField to search logbooks
class SearchLogbooks extends ConsumerWidget {
  ///
  const SearchLogbooks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context);
    return CustomTextFormField(
      hintText: appLocalizations?.searchText ?? '',
      prefixIcon: const Icon(Icons.search_rounded),
      onChanged: (value) {
        ref
            .read(logbookSearchProvider.notifier)
            .update((state) => state = value ?? '');
      },
    );
  }
}
