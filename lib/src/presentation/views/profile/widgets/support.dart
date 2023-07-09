import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/presentation/widgets/custom_body.dart';

import 'package:amacom_app/src/presentation/widgets/widgets.dart';
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
    return const CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomAppBar(
            title: 'Soporte',
            padding: true,
            centerTitle: true,
          ),
          Expanded(
            child: CustomBody(
              child: ScrollColumnExpandable(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SafeSpacer(),
                  Text(
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
                      _InfoItem(
                        icon: Icons.mail_outline,
                        title: 'Escríbenos',
                        variant: true,
                        subtitle: [
                          {
                            'title': 'Contacto@AmacomApp.com.co',
                          }
                        ],
                      ),
                      Divider(),
                      _InfoItem(
                        icon: Icons.web_outlined,
                        title: 'Encontramos en',
                        subtitle: [
                          {
                            'title': 'www.AmacomApp.com.co',
                            'url': 'https://www.AmacomApp.com.co',
                            'icon': 'assets/svg/icons/link.svg'
                          }
                        ],
                      ),
                      Divider(),
                      _InfoItem(
                        icon: Icons.tag,
                        title: 'Redes sociales',
                        subtitle: [
                          {
                            'title': 'Instagram',
                            'url': 'https://www.instagram.com',
                            'icon': 'assets/svg/icons/in.svg'
                          },
                          {
                            'title': 'Facebook',
                            'url': 'https://www.site.com',
                            'icon': 'assets/svg/icons/in.svg'
                          }
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
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
  });
  final String title;
  final List<dynamic> subtitle;
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
              color: Colors.blue.shade400,
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
            )
          ],
        ),
        const SafeSpacer(
          height: 16,
        ),
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
        const SafeSpacer(
          height: 19,
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
              ),
            if (icon != null)
              const HorizontalSpacer(
                width: 8,
              ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: (url != null) ? Colors.blue : null,
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
