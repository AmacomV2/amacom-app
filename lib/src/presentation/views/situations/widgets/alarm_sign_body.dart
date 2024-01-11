// ignore_for_file: public_member_api_docs

import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/alarm_signs/alarm_signs_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/alarm_sign_list.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Alarm sign
// ignore: constant_identifier_names
enum AlarmSignType { BABY, MOTHER }

///
class AlarmSignsBody extends ConsumerStatefulWidget {
  ///
  const AlarmSignsBody({
    super.key,
    required this.type,
  });

  ///
  final AlarmSignType type;

  @override
  ConsumerState<AlarmSignsBody> createState() => _AlarmSignsBodyState();
}

class _AlarmSignsBodyState extends ConsumerState<AlarmSignsBody> {
  /// ListView ScrollController
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    // Setup the listener.
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (!isTop) {
          final alarmSignData = ref.read(alarmSignProvider);
          if (alarmSignData != null) {
            int currentPage = ref.read(alarmSignPageProvider);
            if (!alarmSignData.last) {
              ref
                  .read(alarmSignPageProvider.notifier)
                  .update((state) => state = (currentPage += 1));
            }
          }
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final alarmSign = ref.watch(alarmSignProvider);
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context);

    return ColumnWithPadding(
      mainAxisAlignment: alarmSign == null
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [
        Text(
          widget.type == AlarmSignType.MOTHER
              ? '${appLocalizations?.motherAlarmSignsMessage}'
              : '${appLocalizations?.babyAlarmSignsMessage}',
          style: theme.textTheme.bodyLarge?.copyWith(),
          textAlign: TextAlign.justify,
        ),
        const SafeSpacer(
          height: 10,
        ),
        if (alarmSign != null)
          Expanded(
            child: (alarmSign.content?.isNotEmpty == true)
                ? AlarmSignList(
                    data: alarmSign.content,
                    controller: _controller,
                    type: widget.type,
                  )
                : const Center(
                    child: EmptyListWidget(),
                  ),
          ),
        if (alarmSign == null || alarmSign.last == false)
          Expanded(
            child: ref.watch(alarmSignListFetchProvider(widget.type.name)).when(
                  data: (data) {
                    if (alarmSign == null) {
                      Future.delayed(
                        Duration.zero,
                        () => ref
                            .read(alarmSignProvider.notifier)
                            .update((state) => state = data),
                      );
                    } else {
                      Future.delayed(
                        Duration.zero,
                        () {
                          if (data?.number != alarmSign.number) {
                            final totalList = alarmSign.content;
                            totalList?.addAll(data?.content ?? []);
                            data?.content = totalList;
                            ref
                                .read(alarmSignProvider.notifier)
                                .update((state) => state = data);
                          }
                        },
                      );
                    }
                    return const SizedBox();
                  },
                  error: (error, stackTrace) => ErrorWidget(error),
                  loading: () => const SizedBox(
                    width: double.infinity,
                    child: SizedCustomProgressIndicator2(),
                  ),
                ),
          ),
      ],
    );
  }
}
