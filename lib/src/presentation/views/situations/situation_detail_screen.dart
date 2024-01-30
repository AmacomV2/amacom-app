import 'package:amacom_app/src/presentation/views/situations/widgets/widgets.dart';
import 'package:amacom_app/src/presentation/widgets/custom_scaffold.dart';
import 'package:amacom_app/src/presentation/widgets/spacers.dart';
import 'package:flutter/material.dart';

///
class SituationDetailScreen extends StatelessWidget {
  ///
  const SituationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Column(
        children: [
          SituationDetailHeader(),
          SafeSpacer(
            height: 14,
          ),
          Expanded(child: SituationDetailBody()),
        ],
      ),
    );
  }
}
