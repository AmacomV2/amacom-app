import 'package:amacom_app/src/presentation/state/logbooks/logbook_provider.dart';
import 'package:amacom_app/src/presentation/views/logbooks/widgets/logbook_detail_body.dart';
import 'package:amacom_app/src/presentation/views/logbooks/widgets/widgets.dart';
import 'package:amacom_app/src/presentation/widgets/app_bars.dart';
import 'package:amacom_app/src/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

/// Selected logbook detail
class LogbookDetailScreen extends ConsumerWidget {
  ///
  const LogbookDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logbook = ref.watch(selectedLogbookProvider);
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar2(
            includeBottomSpacer: false,
            padding: true,
            action: const DeleteLogbook(),
            onBack: () {
              ref.invalidate(selectedLogbookProvider);
              context.pop();
            },
          ),
          Expanded(child: LogbookDetailBody(logbook: logbook)),
        ],
      ),
    );
  }
}
