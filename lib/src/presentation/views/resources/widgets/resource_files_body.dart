import 'package:amacom_app/src/presentation/state/resources/resource_files_provider.dart';
import 'package:amacom_app/src/presentation/views/resources/widgets/resource_files_list.dart';
import 'package:amacom_app/src/presentation/widgets/custom_body.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class ResourceFilesBody extends ConsumerStatefulWidget {
  ///
  const ResourceFilesBody({super.key});

  @override
  ConsumerState<ResourceFilesBody> createState() => _ResourceFilesBodyState();
}

class _ResourceFilesBodyState extends ConsumerState<ResourceFilesBody> {
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
          final resourceFilesData = ref.read(resourceFilesProvider);
          if (resourceFilesData != null) {
            int currentPage = ref.read(resourceFilesPageProvider);
            if (!resourceFilesData.last) {
              ref
                  .read(resourceFilesPageProvider.notifier)
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
    final resourceFiles = ref.watch(resourceFilesProvider);
    return CustomBody(
      margin: GlobalLocator.responsiveDesign.appHorizontalPadding,
      width: double.infinity,
      child: ColumnWithPadding(
        mainAxisAlignment: resourceFiles == null
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        padding: GlobalLocator.responsiveDesign.appHInnerPadding,
        children: [
          const SafeSpacer(),
          if (resourceFiles != null ||
              !ref.watch(resourceFilesListFetchProvider).isLoading)
            Expanded(
              child: (resourceFiles?.content?.isNotEmpty == true)
                  ? ResourceFilesList(
                      data: resourceFiles?.content,
                      controller: _controller,
                    )
                  : const Center(
                      child: EmptyListWidget(),
                    ),
            ),
          if (resourceFiles == null || resourceFiles.last == false)
            ref.watch(resourceFilesListFetchProvider).when(
                  data: (data) {
                    if (resourceFiles == null) {
                      Future.delayed(
                        Duration.zero,
                        () => ref
                            .read(resourceFilesProvider.notifier)
                            .update((state) => state = data),
                      );
                    } else {
                      Future.delayed(
                        Duration.zero,
                        () {
                          if (data?.number != resourceFiles.number) {
                            final totalList = resourceFiles.content;
                            totalList?.addAll(data?.content ?? []);
                            data?.content = totalList;
                            ref
                                .read(resourceFilesProvider.notifier)
                                .update((state) => state = data);
                          }
                        },
                      );
                    }
                    return const SizedBox();
                  },
                  error: (error, stackTrace) => CustomErrorWidget(
                    error: error,
                  ),
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
