import 'package:amacom_app/src/presentation/state/resources/resources_fetch.dart';
import 'package:amacom_app/src/presentation/views/resources/widgets/resources_list.dart';
import 'package:amacom_app/src/presentation/widgets/custom_body.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class ResourcesBody extends ConsumerStatefulWidget {
  ///
  const ResourcesBody({super.key});

  @override
  ConsumerState<ResourcesBody> createState() => _ResourcesBodyState();
}

class _ResourcesBodyState extends ConsumerState<ResourcesBody> {
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
          final resourcesData = ref.read(resourcesProvider);
          if (resourcesData != null) {
            int currentPage = ref.read(resourcesPageProvider);
            if (!resourcesData.last) {
              ref
                  .read(resourcesPageProvider.notifier)
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
    final resources = ref.watch(resourcesProvider);
    return CustomBody(
      width: double.infinity,
      child: ColumnWithPadding(
        mainAxisAlignment: resources == null
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        padding: GlobalLocator.responsiveDesign.appHInnerPadding,
        children: [
          const SafeSpacer(),
          if (resources != null)
            Expanded(
              child: (resources.content?.isNotEmpty == true)
                  ? ResourcesList(
                      data: resources.content,
                      controller: _controller,
                    )
                  : const Center(
                      child: EmptyListWidget(),
                    ),
            ),
          if (resources == null || resources.last == false)
            ref.watch(resourcesListFetchProvider).when(
                  data: (data) {
                    if (resources == null) {
                      Future.delayed(
                        Duration.zero,
                        () => ref
                            .read(resourcesProvider.notifier)
                            .update((state) => state = data),
                      );
                    } else {
                      Future.delayed(
                        Duration.zero,
                        () {
                          if (data?.number != resources.number) {
                            final totalList = resources.content;
                            totalList?.addAll(data?.content ?? []);
                            data?.content = totalList;
                            ref
                                .read(resourcesProvider.notifier)
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
