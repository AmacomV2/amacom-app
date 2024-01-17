import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/subjects/subjects_list_provider.dart';
import 'package:amacom_app/src/presentation/views/subjects/widgets/subjects_list.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class SubjectsBody extends ConsumerStatefulWidget {
  ///
  const SubjectsBody({super.key, this.title});

  ///
  final String? title;

  @override
  ConsumerState<SubjectsBody> createState() => _SubjectsBodyState();
}

class _SubjectsBodyState extends ConsumerState<SubjectsBody> {
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
          final subjectsData = ref.read(subjectsProvider);
          if (subjectsData != null) {
            int currentPage = ref.read(subjectsPageProvider);
            if (!subjectsData.last) {
              ref
                  .read(subjectsPageProvider.notifier)
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
    final theme = Theme.of(context);
    final subjects = ref.watch(subjectsProvider);
    final appLocalizations = AppLocalizations.of(context);

    return ColumnWithPadding(
      mainAxisAlignment:
          subjects == null ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Text(
          '${appLocalizations?.relatedTopicsMessage}',
          style: theme.textTheme.bodyLarge?.copyWith(),
          textAlign: TextAlign.justify,
        ),
        const SafeSpacer(
          height: 10,
        ),
        if (subjects != null)
          Expanded(
            child: (subjects.content?.isNotEmpty == true)
                ? SubjectsList(
                    data: subjects.content,
                    controller: _controller,
                  )
                : const Center(
                    child: EmptyListWidget(),
                  ),
          ),
        if (subjects == null || subjects.last == false)
          Expanded(
            child: ref.watch(subjectsListFetchProvider).when(
                  data: (data) {
                    if (subjects == null) {
                      Future.delayed(
                        Duration.zero,
                        () => ref
                            .read(subjectsProvider.notifier)
                            .update((state) => state = data),
                      );
                    } else {
                      Future.delayed(
                        Duration.zero,
                        () {
                          if (data?.number != subjects.number) {
                            final totalList = subjects.content;
                            totalList?.addAll(data?.content ?? []);
                            data?.content = totalList;
                            ref
                                .read(subjectsProvider.notifier)
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
