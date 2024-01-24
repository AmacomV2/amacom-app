import 'package:amacom_app/src/presentation/state/achievements/achievements_fetch.dart';
import 'package:amacom_app/src/presentation/views/achievements/widgets/achievements_list.dart';
import 'package:amacom_app/src/presentation/widgets/custom_body.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class AchievementsBody extends ConsumerStatefulWidget {
  ///
  const AchievementsBody({super.key});

  @override
  ConsumerState<AchievementsBody> createState() => _AchievementsBodyState();
}

class _AchievementsBodyState extends ConsumerState<AchievementsBody> {
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
          final achievementsData = ref.read(achievementsProvider);
          if (achievementsData != null) {
            int currentPage = ref.read(achievementsPageProvider);
            if (!achievementsData.last) {
              ref
                  .read(achievementsPageProvider.notifier)
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
    final achievements = ref.watch(achievementsProvider);
    return CustomBody(
      width: double.infinity,
      margin: GlobalLocator.responsiveDesign.appHInnerPadding,
      child: ColumnWithPadding(
        mainAxisAlignment: achievements == null
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        padding: GlobalLocator.responsiveDesign.appHInnerPadding,
        children: [
          const SafeSpacer(),
          if (achievements != null ||
              !ref.watch(achievementsListFetchProvider).isLoading)
            Expanded(
              child: (achievements?.content?.isNotEmpty == true)
                  ? AchievementsList(
                      data: achievements?.content,
                      controller: _controller,
                    )
                  : const Center(
                      child: EmptyListWidget(),
                    ),
            ),
          if (achievements == null || achievements.last == false)
            ref.watch(achievementsListFetchProvider).when(
                  data: (data) {
                    if (achievements == null) {
                      Future.delayed(
                        Duration.zero,
                        () => ref
                            .read(achievementsProvider.notifier)
                            .update((state) => state = data),
                      );
                    } else {
                      Future.delayed(
                        Duration.zero,
                        () {
                          if (data?.number != achievements.number) {
                            final totalList = achievements.content;
                            totalList?.addAll(data?.content ?? []);
                            data?.content = totalList;
                            ref
                                .read(achievementsProvider.notifier)
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
