import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/subjects/subject_selection.dart';
import 'package:amacom_app/src/presentation/views/subjects/widgets/sub_subjects_list.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/extensions/extensions.dart';
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.data?.name}'.capitalize(),
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (widget.data?.description != null)
                        Text(
                          '${widget.data?.description}',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontSize: 15,
                          ),
                        ),
                    ],
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
            onSelected: (subject) {
              ref.read(selectedSubject.notifier).update((state) => subject);
            },
          ),
      ],
    );
  }
}
