import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/data/repositories/events_repository.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/events/calendar_view.dart';
import 'package:amacom_app/src/presentation/state/events/selected_event.dart';
import 'package:amacom_app/src/presentation/widgets/circular_progress_indicator.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/app_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

final _loadingProvider = StateProvider.autoDispose<bool>((ref) => false);

///
class DeleteEvent extends ConsumerWidget {
  ///
  const DeleteEvent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final event = ref.read(selectedEventProvider);
    final appLocalizations = AppLocalizations.of(context);
    return GestureDetector(
      child: ref.watch(_loadingProvider)
          ? const SizedCustomProgressIndicator(
              size: 22,
              color: Colors.white,
            )
          : Icon(
              color: Colors.white,
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
          final result =
              await ref.read(eventsRepository).deleteEvent(event?.id ?? '');
          if (result) {
            final eventsState = ref.read(calendarEventsProvider);
            eventsState.removeWhere((element) => element.id == event?.id);
            final newState = List<Event>.from(eventsState);
            ref
                .read(calendarEventsProvider.notifier)
                .update((state) => newState);
            if (context.mounted) {
              context.pop();
              context.pop();
            }
          }
          ref.read(_loadingProvider.notifier).update((state) => false);
        }
      },
    );
  }
}
