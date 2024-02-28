import 'package:amacom_app/src/presentation/views/resources/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

/// Main screen of resources module
class ResourcesScreen extends StatelessWidget {
  ///
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: const MobileMainBody(),
      web: const WebMainBody(),
    );
  }
}
