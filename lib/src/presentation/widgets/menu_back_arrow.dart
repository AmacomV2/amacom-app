import 'package:flutter/material.dart';

import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class MenuBackArrowButton extends StatelessWidget {
  const MenuBackArrowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        BackArrowButton(
          onTap: () => context.pop(),
        )
      ],
    );
  }
}
