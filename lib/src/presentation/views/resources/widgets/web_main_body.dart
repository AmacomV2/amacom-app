import 'package:amacom_app/src/presentation/state/resources/selected_resource.dart';
import 'package:amacom_app/src/presentation/views/resources/resource_files_screen.dart';
import 'package:amacom_app/src/presentation/views/resources/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class WebMainBody extends ConsumerWidget {
  ///
  const WebMainBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = GlobalLocator.responsiveDesign;
    return Row(
      children: [
        SizedBox(
          width: responsive.webMultipleViewMainWidth(),
          child: const MobileMainBody(),
        ),
        if (ref.watch(selectedResourceProvider) != null)
          const Expanded(child: ResourceFilesScreen()),
      ],
    );
  }
}
