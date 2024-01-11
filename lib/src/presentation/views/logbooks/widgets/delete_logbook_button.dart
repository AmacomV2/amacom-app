import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/data/repositories/logbooks_repository.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/logbooks/logbook_provider.dart';
import 'package:amacom_app/src/presentation/state/logbooks/logbooks_provider.dart';
import 'package:amacom_app/src/presentation/widgets/circular_progress_indicator.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/app_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

final _loadingProvider = StateProvider.autoDispose<bool>((ref) => false);

///
class DeleteLogbook extends ConsumerWidget {
  ///
  const DeleteLogbook({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logbook = ref.read(selectedLogbookProvider);
    final appLocalizations = AppLocalizations.of(context);
    return GestureDetector(
      child: ref.watch(_loadingProvider)
          ? const SizedCustomProgressIndicator(
              size: 22,
            )
          : Icon(
              color: FigmaColors.danger_700,
              Icons.close_rounded,
              size: AppSizes.appBarIcons,
            ),
      onTap: () async {
        final selection = await AppDialogs.genericConfirmDialog(
          context,
          title: appLocalizations?.deleteRecord ?? '',
          subtitle: appLocalizations?.deleteRecordText,
          buttonTextYes: appLocalizations?.accept ?? '',
          buttonTextNo: appLocalizations?.cancel ?? '',
        );
        if (selection == true) {
          ref.read(_loadingProvider.notifier).update((state) => true);
          final result =
              await ref.read(logbooksRepository).delete(logbook?.id ?? '');
          if (result) {
            final logbooksState = ref.read(logbooksProvider);
            logbooksState?.content
                ?.removeWhere((element) => element.id == logbook?.id);
            final newState = Pageable<List<Logbook>>.fromJson(
              logbooksState!.toJson(
                (value) => value.map((e) => e.toJson()).toList(),
              ),
              Logbook.fromJsonList,
            );
            ref.read(logbooksProvider.notifier).update((state) => newState);
            if (context.mounted) {
              context.pop();
            }
          }
          ref.read(_loadingProvider.notifier).update((state) => false);
        }
      },
    );
  }
}
