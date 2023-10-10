import 'package:amacom_app/src/presentation/widgets/custom_asset_icon.dart';
import 'package:flutter/material.dart';

///
class PasswordIcon extends StatelessWidget {
  ///
  const PasswordIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(9),
      child: CustomAssetIcon(
        path: 'assets/svg/icons/eye-off-outline.svg',
        height: 10,
        width: 10,
      ),
    );
  }
}
