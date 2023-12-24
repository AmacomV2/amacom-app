import 'package:amacom_app/src/presentation/state/feelings/feelings_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/feelings_list.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class FeelingsBody extends ConsumerStatefulWidget {
  ///
  const FeelingsBody({super.key});

  @override
  ConsumerState<FeelingsBody> createState() => _FeelingsBodyState();
}

class _FeelingsBodyState extends ConsumerState<FeelingsBody> {
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
          final feelingsData = ref.read(feelingsProvider);
          if (feelingsData != null) {
            int currentPage = ref.read(feelingsPageProvider);
            if (!feelingsData.last) {
              ref
                  .read(feelingsPageProvider.notifier)
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
    final feelings = ref.watch(feelingsProvider);
    final theme = Theme.of(context);

    return ColumnWithPadding(
      mainAxisAlignment:
          feelings == null ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Text(
          'Elige los sentimientos o sensaciones que reflejan como te sientes',
          style: theme.textTheme.bodyLarge?.copyWith(),
          textAlign: TextAlign.justify,
        ),
        const SafeSpacer(
          height: 10,
        ),
        if (feelings != null)
          Expanded(
            child: (feelings.content?.isNotEmpty == true)
                ? FeelingsList(
                    data: feelings.content,
                    controller: _controller,
                  )
                : const Center(
                    child: EmptyListWidget(),
                  ),
          ),
        if (feelings == null || feelings.last == false)
          Expanded(
            child: ref.watch(feelingsListFetchProvider).when(
                  data: (data) {
                    if (feelings == null) {
                      Future.delayed(
                        Duration.zero,
                        () => ref
                            .read(feelingsProvider.notifier)
                            .update((state) => state = data),
                      );
                    } else {
                      Future.delayed(
                        Duration.zero,
                        () {
                          if (data?.number != feelings.number) {
                            final totalList = feelings.content;
                            totalList?.addAll(data?.content ?? []);
                            data?.content = totalList;
                            ref
                                .read(feelingsProvider.notifier)
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
