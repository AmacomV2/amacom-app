import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/situations/new_situation_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/sub_subjects_list.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class SubjectCard extends ConsumerStatefulWidget {
  ///
  const SubjectCard({super.key, this.data});

  ///
  final SubjectEntity? data;

  @override
  ConsumerState<SubjectCard> createState() => _SubjectCardState();
}

class _SubjectCardState extends ConsumerState<SubjectCard> {
  bool expanded = false;
  String? parentId;

  @override
  Widget build(BuildContext context) {
    List<SubjectEntity> selected = ref.watch(situationSubjectsProvider);
    final theme = Theme.of(context);
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (expanded) {
              parentId = null;
            } else {
              parentId = widget.data?.id;
            }
            expanded = !expanded;
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 6,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '${widget.data?.name}',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: AppDurations.animation,
                  child: expanded
                      ? const Icon(
                          Icons.keyboard_arrow_up_rounded,
                          size: 18,
                        )
                      : const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 18,
                        ),
                ),
              ],
            ),
          ),
        ),
        if (parentId != null)
          SubSubjectsList(
            parentId: parentId!,
            selected: selected,
            onSelected: (subject) {
              final temp = List<SubjectEntity>.from(selected);
              if (selected
                  .where((element) => element.id == subject.id)
                  .isEmpty) {
                temp.add(subject);
              } else {
                temp.removeWhere((element) => element.id == subject.id);
              }
              ref
                  .read(situationSubjectsProvider.notifier)
                  .update((state) => temp);
            },
          ),
      ],
    );
  }
}
