import 'package:amacom_app/src/presentation/views/resources/widgets/widgets.dart';
import 'package:amacom_app/src/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

/// Shows files related to selected resource
class ResourceFilesScreen extends StatelessWidget {
  ///
  const ResourceFilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Column(
        children: [
          ResourceFilesHeader(),
          Expanded(child: ResourceFilesBody()),
        ],
      ),
    );
  }
}
