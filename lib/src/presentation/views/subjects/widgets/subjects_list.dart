import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/subjects/subjects_list_provider.dart';
import 'package:amacom_app/src/presentation/views/subjects/widgets/subject_card.dart';
import 'package:amacom_app/src/utils/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// Subjects list
///
/// ListView with which hace a controller with a listener to
/// fetch more subjects on scroll end.
class SubjectsList extends ConsumerStatefulWidget {
  ///
  const SubjectsList({
    super.key,
    required this.data,
    required this.controller,
  });

  ///
  final List<SubjectEntity>? data;

  ///
  final ScrollController controller;

  @override
  ConsumerState<SubjectsList> createState() => _SubjectsListState();
}

class _SubjectsListState extends ConsumerState<SubjectsList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    var _ = ref.refresh(subjectsProvider);
    ref.read(subjectsPageProvider.notifier).update((state) => 0);
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
          thickness: 0.4,
        ),
        itemBuilder: (context, index) {
          return SubjectCard(
            data: widget.data?[index],
          );
        },
      ),
    );
  }
}
