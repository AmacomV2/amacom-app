import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/situations/new_situation_provider.dart';
import 'package:amacom_app/src/presentation/state/subjects/subjects_list_provider.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

////
class SubSubjectsList extends ConsumerWidget {
  ///
  const SubSubjectsList({
    super.key,
    required this.parentId,
    required this.onSelected,
  });

  ///
  final String parentId;

  ///
  final Function(SubjectEntity) onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    SubjectEntity? selected = ref.watch(situationSubjectProvider);

    return ref.watch(subjectsProviderFamily(parentId)).when(
          data: (data) {
            return Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: theme.colorScheme.primaryContainer,
                  ),
                ),
              ),
              child: ColumnWithPadding(
                padding: const EdgeInsets.only(
                  left: 8,
                  top: 4,
                  bottom: 4,
                ),
                children: [
                  ...(data!.content as List<SubjectEntity>).map(
                    (e) {
                      bool isSelected = selected?.id == e.id;
                      return GestureDetector(
                        onTap: () {
                          onSelected.call(e);
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                            vertical: 4,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppConstants.cardRadius),
                            side: BorderSide(
                              color: isSelected
                                  ? FigmaColors.primary_200
                                  : Colors.white,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(
                              8,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    e.name,
                                    maxLines: 3,
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                ),
                                CustomCheckBox(
                                  size: 18,
                                  selected: isSelected,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ],
              ),
            );
          },
          error: (error, stackTrace) => const EmptyListWidget(),
          loading: () => const SizedCustomProgressIndicator2(),
        );
  }
}
