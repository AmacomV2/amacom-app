import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/data/repositories/situation_repository.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/situations/situation_provider.dart';
import 'package:amacom_app/src/presentation/state/situations/situations_list_provider.dart';
import 'package:amacom_app/src/presentation/widgets/circular_progress_indicator.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/app_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

final _loadingProvider = StateProvider.autoDispose<bool>((ref) => false);

///
class DeleteSituation extends ConsumerWidget {
  ///
  const DeleteSituation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final situation = ref.read(selectedSituationProvider);
    final appLocalizations = AppLocalizations.of(context);
    return GestureDetector(
      child: ref.watch(_loadingProvider)
          ? const SizedCustomProgressIndicator(
              size: 22,
            )
          : Icon(
              color: FigmaColors.danger_700,
              Icons.delete_outline_rounded,
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
          final result = await ref
              .read(situationsRepository)
              .delete(id: situation?.id ?? '');
          if (result) {
            final situationsState = ref.read(situationsProvider);
            situationsState?.content
                ?.removeWhere((element) => element.id == situation?.id);
            final newState = Pageable<List<SituationEntity>>.fromJson(
              situationsState!.toJson(
                (value) => value.map((e) => e.toJson()).toList(),
              ),
              SituationEntity.fromJsonList,
            );
            ref.read(situationsProvider.notifier).update((state) => newState);
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
