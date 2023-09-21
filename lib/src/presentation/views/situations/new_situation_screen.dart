import 'package:amacom_app/src/presentation/views/situations/widgets/widgets.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

///
class NewSituationScreen extends StatelessWidget {
  ///
  const NewSituationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Column(
        children: [
          NewSituationHeader(),
          Expanded(
            child: NewSituationForm(),
          ),
          NewSituationButton(),
          BottomSpacer(),
        ],
      ),
    );
  }
}
