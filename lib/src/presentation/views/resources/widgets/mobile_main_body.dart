import 'package:amacom_app/src/presentation/views/resources/widgets/resources_body.dart';
import 'package:amacom_app/src/presentation/views/resources/widgets/resources_header.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

////
class MobileMainBody extends StatelessWidget {
  ///
  const MobileMainBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Column(
        children: [
          ResourcesHeader(),
          SafeSpacer(),
          Expanded(child: ResourcesBody()),
        ],
      ),
    );
  }
}
