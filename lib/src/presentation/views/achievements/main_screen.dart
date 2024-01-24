import 'package:amacom_app/src/presentation/views/achievements/widgets/widgets.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

///
class PersonAchievementsScreen extends StatelessWidget {
  ////
  const PersonAchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Column(
        children: [
          AchievementsHeader(),
          SafeSpacer(
            height: 10,
          ),
          Expanded(child: AchievementsBody()),
        ],
      ),
    );
  }
}
