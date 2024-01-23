import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/resources/resource_files_provider.dart';
import 'package:amacom_app/src/presentation/views/resources/widgets/file_card.dart';
import 'package:amacom_app/src/utils/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// ResourceFiles list
///
/// ListView with which hace a controller with a listener to
/// fetch more fileFiles on scroll end.
class ResourceFilesList extends ConsumerStatefulWidget {
  ///
  const ResourceFilesList({
    super.key,
    required this.data,
    required this.controller,
  });

  ///
  final List<SupportMaterialFile>? data;

  ///
  final ScrollController controller;

  @override
  ConsumerState<ResourceFilesList> createState() => _ResourceFilesListState();
}

class _ResourceFilesListState extends ConsumerState<ResourceFilesList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    ref.read(resourceFilesPageProvider.notifier).update((state) => 0);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      child: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          spacing: 8,
          runSpacing: 10,
          children: [
            ...(widget.data ?? []).map((e) {
              return ResourceFileCard(
                data: e,
                onTap: () {
                  Navigation.goTo(
                    CustomAppRouter.networkResource,
                    extra: {
                      'title': e.name,
                      'subtitle': e.description,
                      'url': e.path,
                    },
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
    // return SmartRefresher(
    //   controller: _refreshController,
    //   onRefresh: _onRefresh,
    //   child: ListView.separated(
    //     padding: const EdgeInsets.only(
    //       bottom: 90,
    //     ),
    //     controller: widget.controller,
    //     physics: AppConstants.scrollPhysics,
    //     itemCount: widget.data?.length ?? 0,
    //     separatorBuilder: (BuildContext context, int index) => const Divider(
    //       height: 8,
    //     ),
    //     itemBuilder: (context, index) {
    //       final file = widget.data?[index];
    //       final card = ResourceFileCard(
    //         data: file,
    //         onTap: () {},
    //       );

    //       return card;
    //     },
    //   ),
    // );
  }
}
