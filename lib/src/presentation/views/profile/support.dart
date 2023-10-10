import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/presentation/widgets/custom_asset_icon.dart';
import 'package:amacom_app/src/presentation/widgets/custom_body.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

/// Pet information form
///
/// Catch information about user's pet
class Support extends StatelessWidget {
  /// Widget Constructor
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = GlobalLocator.responsiveDesign;
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomAppBar(
            title: 'AmacomApp',
            padding: true,
            centerTitle: true,
          ),
          Expanded(
            child: Padding(
              padding: responsive.appDialogsPadding,
              child: CustomBody(
                child: ScrollColumnExpandable(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SafeSpacer(),
                    const Text(
                      textAlign: TextAlign.center,
                      '¿Requieres de alguna ayuda o tienes alguna sugerencia?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _InfoItem(
                          icon: Icons.mail_outline,
                          title: 'Escríbenos',
                          variant: true,
                          subtitle: [
                            {
                              'title': 'Contacto@AmacomApp.com.co',
                            }
                          ],
                        ),
                        const Divider(),
                        _InfoItem(
                          icon: Icons.privacy_tip_outlined,
                          title: 'Términos y políticas de privacidad',
                          subtitle: const [],
                          options: [
                            {
                              'title': 'Políticas de privacidad',
                              'onTap': () => Navigation.goTo(
                                    CustomAppRouter.privacyPolitics,
                                  ),
                            },
                            {
                              'title': 'Términos y condiciones',
                              'onTap': () => Navigation.goTo(
                                    CustomAppRouter.networkResource,
                                    extra: {
                                      'title': 'Términos y condiciones',
                                      'url': AppUrlResources.termsAndConditions,
                                    },
                                  ),
                            }
                          ],
                        ),
                        const Divider(),
                        const _InfoItem(
                          icon: Icons.web_outlined,
                          title: 'Encontramos en',
                          subtitle: [
                            {
                              'title': 'www.AmacomApp.com.co',
                              'url': 'https://www.AmacomApp.com.co',
                              'icon': 'assets/svg/icons/link.svg',
                            }
                          ],
                        ),
                        const Divider(),
                        const _InfoItem(
                          icon: Icons.tag,
                          title: 'Redes sociales',
                          subtitle: [
                            {
                              'title': 'Instagram',
                              'url': 'https://www.instagram.com',
                              'icon': 'assets/svg/icons/in.svg',
                            },
                            {
                              'title': 'Facebook',
                              'url': 'https://www.site.com',
                              'icon': 'assets/svg/icons/in.svg',
                            }
                          ],
                        ),
                      ],
                    ),
                    const SafeSpacer(
                      height: 10,
                    ),
                    CustomButtonWithState(
                      adaptiveTextColor: false,
                      onTap: () {},
                      text: 'Borrar cuenta',
                      // svgPicture: SvgPngToIcon(assetName: 'trash_outline'),
                      svgPicture: const CustomAssetIcon(
                        path: 'assets/svg/icons/trash_outline.svg',
                        height: 28,
                        width: 28,
                      ),
                      color: Colors.red.shade100,
                      textColor: Colors.red,
                    ),
                    const BottomSpacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.variant = false,
    this.options = const [],
  });
  final String title;
  final List<dynamic> subtitle;
  final List<dynamic> options;
  final IconData icon;
  final bool variant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SafeSpacer(),
        Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: FigmaColors.primary_300,
            ),
            const HorizontalSpacer(
              width: 5,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        if (subtitle.isNotEmpty)
          const SafeSpacer(
            height: 16,
          ),
        if (subtitle.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(left: variant ? 17.0 : 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...subtitle
                    .map(
                      (e) => _CustomUrlTextButton(
                        title: e['title'],
                        url: e['url'],
                        icon: e['icon'],
                      ).paddingBottom(subtitle.length > 1 ? 15 : 0),
                    )
                    .toList(),
              ],
            ),
          ),
        if (options.isNotEmpty)
          const SafeSpacer(
            height: 16,
          ),
        if (options.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(left: variant ? 17.0 : 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...options
                    .map(
                      (e) => _CustomNavigationTextButton(
                        title: e['title'],
                        onTap: e['onTap'],
                      ).paddingBottom(options.length > 1 ? 15 : 0),
                    )
                    .toList(),
              ],
            ),
          ),
        const Divider(),
      ],
    );
  }
}

class _CustomUrlTextButton extends StatelessWidget {
  const _CustomUrlTextButton({
    required this.title,
    this.url,
    required this.icon,
  });

  final String title;
  final String? url;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => (url != null) ? _launchURL(url!) : null,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 2,
        ),
        decoration: BoxDecoration(
          color: icon != null ? FigmaColors.information_50 : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              SvgPicture.asset(
                icon!,
                height: 16,
                // ignore: deprecated_member_use
                color: FigmaColors.primary_300,
              ),
            if (icon != null)
              const HorizontalSpacer(
                width: 8,
              ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: (url != null) ? FigmaColors.primary_300 : null,
                decoration: (url != null) ? TextDecoration.underline : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    Uri url0 = Uri.parse(url);
    if (await launchUrl(url0)) {
      await launchUrl(url0);
    } else {
      throw 'Could not launch $url0';
    }
  }
}

class _CustomNavigationTextButton extends StatelessWidget {
  const _CustomNavigationTextButton({
    required this.title,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 2,
        ),
        decoration: BoxDecoration(
          color: FigmaColors.information_50,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: FigmaColors.primary_300,
                decoration: TextDecoration.underline,
              ),
            ),
            const HorizontalSpacer(
              width: 8,
            ),
            const Icon(
              Icons.launch_rounded,
              color: FigmaColors.primary_300,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
