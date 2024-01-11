import 'package:amacom_app/src/domain/entities/logbook.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/app_constants.dart';
import 'package:amacom_app/src/utils/extensions/extensions.dart';
import 'package:amacom_app/src/utils/utils/global_locator.dart';
import 'package:flutter/material.dart';

///
class LogbookDetailBody extends StatelessWidget {
  ///
  const LogbookDetailBody({super.key, this.logbook});

  /// Logbook data
  final Logbook? logbook;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final responsive = GlobalLocator.responsiveDesign;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ColumnWithPadding(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CoolDateToText(date: logbook?.createdAt ?? DateTime.now()),
              const SafeSpacer(),
              Text(
                '${logbook?.name.capitalize()}',
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SafeSpacer(
                height: 16,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: AppConstants.scrollPhysics,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text(
                      '${logbook?.description}',
                      style: textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SafeSpacer(
          height: 10,
        ),
        Image.asset(
          'assets/images/mountains.png',
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          width: responsive.screenWidth,
          height: 100,
          cacheWidth: responsive.screenWidth.toInt(),
        ),
      ],
    );
  }
}
