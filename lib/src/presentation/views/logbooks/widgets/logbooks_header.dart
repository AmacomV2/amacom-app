import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/views/logbooks/widgets/search.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/global_locator.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

///
class LogbooksHeader extends StatelessWidget {
  ///
  const LogbooksHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    final responsive = GlobalLocator.responsiveDesign;
    final theme = Theme.of(context);
    return SizedBox(
      height: 160 + responsive.height(100),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/diary-background.jpg',
            height: 150 + responsive.height(100),
            cacheHeight: responsive.safeHeight(280).toInt(),
            fit: BoxFit.cover,
          ),
          Blur(
            color: theme.scaffoldBackgroundColor.withOpacity(0.5),
            blur: 3,
            child: SizedBox(
              height: 160 + responsive.height(100),
              child: ColumnWithPadding(
                children: [
                  CustomAppBar2(
                    title: appLocalizations?.logbook ?? '',
                    subtitle: appLocalizations?.logbookText ?? '',
                  ),
                  const SearchLogbooks(),
                  const SafeSpacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
