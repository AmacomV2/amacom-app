import 'package:amacom_app/src/presentation/views/resources/widgets/widgets.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// Main screen of resources module
class ResourcesScreen extends StatelessWidget {
  ///
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ResourcesHeader(),
        SafeSpacer(),
        Expanded(child: ResourcesBody()),
      ],
    );
  }
}
