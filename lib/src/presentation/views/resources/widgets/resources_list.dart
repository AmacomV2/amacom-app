import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/resources/resource_files_provider.dart';
import 'package:amacom_app/src/presentation/state/resources/resources_fetch.dart';
import 'package:amacom_app/src/presentation/state/resources/selected_resource.dart';
import 'package:amacom_app/src/presentation/views/resources/widgets/resource_card.dart';
import 'package:amacom_app/src/utils/constant/app_constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// Resources list
///
/// ListView with which hace a controller with a listener to
/// fetch more resources on scroll end.
class ResourcesList extends ConsumerStatefulWidget {
  ///
  const ResourcesList({
    super.key,
    required this.data,
    required this.controller,
  });

  ///
  final List<GenericData>? data;

  ///
  final ScrollController controller;

  @override
  ConsumerState<ResourcesList> createState() => _ResourcesListState();
}

class _ResourcesListState extends ConsumerState<ResourcesList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    var _ = ref.refresh(resourcesProvider);
    ref.read(resourcesPageProvider.notifier).update((state) => 0);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      child: ListView.separated(
        padding: const EdgeInsets.only(
          bottom: 90,
        ),
        controller: widget.controller,
        physics: AppConstants.scrollPhysics,
        itemCount: widget.data?.length ?? 0,
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 8,
        ),
        itemBuilder: (context, index) {
          final resource = widget.data?[index];
          final card = ResourceCard(
            data: resource,
            index: index,
            onTap: () {
              ref
                  .read(selectedResourceProvider.notifier)
                  .update((state) => resource);
              if (Navigation.navigate()) {
                Navigation.goTo(CustomAppRouter.resourceDetail);
              } else {
                ref.invalidate(resourceFilesListFetchProvider);
                ref.invalidate(resourceFilesProvider);
                ref.invalidate(resourceFilesPageProvider);
              }
            },
          );

          return card;
        },
      ),
    );
  }
}
