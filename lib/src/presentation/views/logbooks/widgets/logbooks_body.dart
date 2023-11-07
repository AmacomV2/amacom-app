import 'package:amacom_app/src/presentation/state/logbooks/logbooks_provider.dart';
import 'package:amacom_app/src/presentation/views/logbooks/widgets/widgets.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class LogbooksBody extends ConsumerStatefulWidget {
  ///
  const LogbooksBody({super.key});

  @override
  ConsumerState<LogbooksBody> createState() => _LogbooksBodyState();
}

class _LogbooksBodyState extends ConsumerState<LogbooksBody> {
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
          final logbooksData = ref.read(logbooksProvider);
          if (logbooksData != null) {
            int currentPage = ref.read(logbookPageProvider);
            if (!logbooksData.last) {
              ref
                  .read(logbookPageProvider.notifier)
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
    final logbooks = ref.watch(logbooksProvider);
    return ColumnWithPadding(
      mainAxisAlignment:
          logbooks == null ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        if (logbooks != null)
          Expanded(
            child: LogbooksList(
              data: logbooks,
              controller: _controller,
            ),
          ),
        if (logbooks == null || logbooks.last == false)
          ref.watch(logbookListFetchProvider).when(
                data: (data) {
                  if (logbooks == null) {
                    Future.delayed(
                      Duration.zero,
                      () => ref
                          .read(logbooksProvider.notifier)
                          .update((state) => state = data),
                    );
                  } else {
                    Future.delayed(
                      Duration.zero,
                      () {
                        if (data?.number != logbooks.number) {
                          final totalList = logbooks.content;
                          totalList?.addAll(data?.content ?? []);
                          data?.content = totalList;
                          ref
                              .read(logbooksProvider.notifier)
                              .update((state) => state = data);
                        }
                      },
                    );
                  }
                  return const SizedBox();
                },
                error: (error, stackTrace) => Container(),
                loading: () => const SizedCustomProgressIndicator2(),
              ),
      ],
    );
  }
}
