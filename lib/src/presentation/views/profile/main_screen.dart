import 'package:amacom_app/src/config/menu/profile_menu_items.dart';
import 'package:amacom_app/src/presentation/views/profile/widgets/profile_header.dart';
import 'package:amacom_app/src/presentation/views/profile/widgets/profile_options.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';

/// Profile screen widget.
class ProfileScreen extends StatelessWidget {
  /// Constructor of this class
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    appMenuItems; // Unused variable
    final responsive = GlobalLocator.responsiveDesign;
    return SizedBox(
      child: ColumnWithPadding(
        children: [
          const ProfileHeader(),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: responsive.appHorizontalPadding,
              child: const Column(
                children: [
                  SafeSpacer(),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: AppConstants.scrollPhysics,
                      child: ProfileOptions(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
