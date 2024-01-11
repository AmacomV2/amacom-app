import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/data/repositories/logbooks_repository.dart';
import 'package:amacom_app/src/domain/dtos/logbook_dto.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/logbooks/logbooks_provider.dart';
import 'package:amacom_app/src/presentation/state/logbooks/new_lookbook_provider.dart';
import 'package:amacom_app/src/presentation/views/logbooks/widgets/widgets.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/app_constants.dart';
import 'package:amacom_app/src/utils/utils/app_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

/// Logbook creation
///
/// Logbook creation form. Creates a logbook with validations and
/// refresh the list of logbooks.
class LogbookCreationScreen extends ConsumerWidget {
  ///
  const LogbookCreationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final appLocalizations = AppLocalizations.of(context);

    return CustomScaffold(
      body: ColumnWithPadding(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar2(
            title: appLocalizations?.newRecord ?? '',
            subtitle: appLocalizations?.newRecordText ?? '',
          ),
          CoolDateToText(date: DateTime.now()),
          const SafeSpacer(),
          Expanded(
            child: SingleChildScrollView(
              physics: AppConstants.scrollPhysics,
              child: NewLogbookForm(
                formKey: formKey,
              ),
            ),
          ),
          Center(
            child: CustomButtonWithState(
              text: appLocalizations?.save ?? '',
              onTap: () async {
                if (formKey.currentState?.validate() == true) {
                  try {
                    final logbook = await ref.read(logbooksRepository).create(
                          LogbookDTO(
                            name: ref.read(logbookTitleProvider) ?? '',
                            description:
                                ref.read(logbookDescriptionProvider) ?? '',
                          ),
                        );
                    final logbooks = ref.read(logbooksProvider);
                    final totalList = [logbook];
                    totalList.addAll(logbooks?.content ?? []);
                    logbooks?.content = totalList;
                    final newState = Pageable<List<Logbook>>.fromJson(
                      logbooks!.toJson(
                        (value) => value.map((e) => e.toJson()).toList(),
                      ),
                      Logbook.fromJsonList,
                    );
                    ref
                        .read(logbooksProvider.notifier)
                        .update((state) => state = newState);
                    if (context.mounted) {
                      FocusScope.of(context).unfocus();
                      context.pop();
                    }
                  } catch (e) {
                    AppDialogs.showCustomSnackBar(
                      e.toString(),
                      color: FigmaColors.danger_700,
                      icon: Icons.error_outline_outlined,
                    );
                  }
                }
              },
            ),
          ),
          const SafeBottomSpacer(),
        ],
      ),
    );
  }
}
