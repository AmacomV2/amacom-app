import 'package:amacom_app/src/presentation/state/resources/selected_resource.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ResourceFiles main screen header
class ResourceFilesHeader extends ConsumerWidget {
  ///
  const ResourceFilesHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedResource = ref.watch(selectedResourceProvider);

    return CustomAppBar2(
      title: selectedResource?.name,
      padding: true,
      subtitle: selectedResource?.description,
      onBack: () {
        ref.invalidate(selectedResourceProvider);
        Navigation.goBack();
      },
    );
  }
}
