import 'package:flutter/material.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:get_it/get_it.dart';
import 'package:nb_utils/nb_utils.dart';

/// Fur header widget, show fur logo and an optional title and
/// back arrow button
class AuthHeader extends StatelessWidget {
  /// Constructor
  const AuthHeader({
    super.key,
    this.title,
    this.includeBackArrow = false,
    this.showLogo = true,
    this.onBack,
  });

  /// Title to show
  final String? title;

  /// To include a back arrow on title
  final bool includeBackArrow;

  /// Show or hide app logo
  final bool showLogo;

  /// Optional on back button pressed callback
  final VoidCallback? onBack;
  @override
  Widget build(BuildContext context) {
    final responsive = GetIt.instance.get<ResponsiveDesign>();
    final theme = Theme.of(context);
    final titleWidget = Text(
      title ?? 'Crear cuenta',
      textAlign: TextAlign.center,
      style: theme.textTheme.headlineSmall?.apply(
        color: theme.colorScheme.primary,
      ),
    );
    return Column(
      children: [
        const HeaderSpacer(
          height: 46,
        ),
        // if (showLogo)
        //   SvgPicture.asset(
        //     'assets/logos/logo.svg',
        //     semanticsLabel: 'AmacomApp Logo',
        //     height: responsive.maxHeightValue(45.17),
        //   ),
        if (showLogo)
          Image.asset(
            'assets/icon/logo.png',
            height: responsive.maxHeightValue(100),
          ),
        const SafeSpacer(
          height: 20,
        ),
        if (includeBackArrow)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackArrowButton(
                  onTap: onBack ?? () => Navigation.goBack(),
                ).paddingRight(8),
              Expanded(child: titleWidget),
              const HorizontalSpacer(
                  width: 26,
                )
            ],
          ),
        if (!includeBackArrow) titleWidget,
      ],
    );
  }
}
