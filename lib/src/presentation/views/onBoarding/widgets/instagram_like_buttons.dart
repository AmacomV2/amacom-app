import 'package:flutter/material.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

/// Instagram like history transitions
class InstagramLikeButtons extends StatelessWidget {
  /// Widget constructor
  const InstagramLikeButtons({
    super.key,
    required this.next,
    required this.onBack,
  });

  /// back callback
  final VoidCallback? onBack;

  /// Next Callback
  final VoidCallback? next;

  @override
  Widget build(BuildContext context) {
    final responsive = GlobalLocator.responsiveDesign;

    return Row(
      children: [
        TransparentButton(
          height: responsive.screenHeight,
          width: responsive.screenWidth / 2,
          onTap: onBack,
        ),
        TransparentButton(
          height: responsive.screenHeight,
          width: responsive.screenWidth / 2,
          onTap: next,
        ),
      ],
    );
  }
}
