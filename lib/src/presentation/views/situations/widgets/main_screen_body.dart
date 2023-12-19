import 'package:amacom_app/src/presentation/state/situations/situations_list_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/situations_list.dart';
import 'package:amacom_app/src/presentation/widgets/custom_body.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class SituationsBody extends ConsumerStatefulWidget {
  ///
  const SituationsBody({super.key});

  @override
  ConsumerState<SituationsBody> createState() => _SituationsBodyState();
}

class _SituationsBodyState extends ConsumerState<SituationsBody> {
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
          final situationsData = ref.read(situationsProvider);
          if (situationsData != null) {
            int currentPage = ref.read(situationsPageProvider);
            if (!situationsData.last) {
              ref
                  .read(situationsPageProvider.notifier)
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
    final situations = ref.watch(situationsProvider);
    return CustomBody(
      width: double.infinity,
      child: ColumnWithPadding(
        mainAxisAlignment: situations == null
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        padding: GlobalLocator.responsiveDesign.appHInnerPadding,
        children: [
          const SafeSpacer(),
          if (situations != null)
            Expanded(
              child: (situations.content?.isNotEmpty == true)
                  ? SituationsList(
                      data: situations.content,
                      controller: _controller,
                    )
                  : const Center(
                      child: EmptyListWidget(),
                    ),
            ),
          if (situations == null || situations.last == false)
            ref.watch(situationsListFetchProvider).when(
                  data: (data) {
                    if (situations == null) {
                      Future.delayed(
                        Duration.zero,
                        () => ref
                            .read(situationsProvider.notifier)
                            .update((state) => state = data),
                      );
                    } else {
                      Future.delayed(
                        Duration.zero,
                        () {
                          if (data?.number != situations.number) {
                            final totalList = situations.content;
                            totalList?.addAll(data?.content ?? []);
                            data?.content = totalList;
                            ref
                                .read(situationsProvider.notifier)
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
        ],
      ),
    );
  }
}
