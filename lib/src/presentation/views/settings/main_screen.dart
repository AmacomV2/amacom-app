import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/presentation/state/main_provider.dart';
import 'package:amacom_app/src/presentation/views/settings/widgets/widgets.dart';
import 'package:amacom_app/src/presentation/widgets/custom_body.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

/// Pet information form
///
/// Catch information about user's pet
class SettingsForm extends ConsumerWidget {
  /// Widget Constructor
  const SettingsForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = GlobalLocator.responsiveDesign;
    final theme = Theme.of(context);
    final appLocalizations = AppLocalizations.of(context);
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomAppBar(
            title: appLocalizations?.settingsTitle,
            centerTitle: true,
            padding: true,
          ),
          Expanded(
            child: Padding(
              padding: responsive.appHorizontalPadding,
              child: CustomBody(
                padding: responsive.appHorizontalPadding
                    .copyWith(top: responsive.maxHeightValue(24)),
                child: SettingSection(
                  headerPadding: EdgeInsets.zero,
                  items: [
                    SettingItemWidget(
                      onTap: () async {
                        final localeSelection = StateProvider<Locale>(
                          (ref) => Locale(
                            appLocalizations.localeName,
                          ),
                        );
                        await AppDialogs.genericDialog(
                          buttonText: appLocalizations.accept,
                          widget: ChangeLocaleWidget(state: localeSelection),
                          onTap: () {
                            Navigation.goBack();
                          },
                        );
                        if (ref.read(localeSelection).languageCode !=
                            appLocalizations.localeName) {
                          if (AppLocalizations.delegate
                              .isSupported(ref.read(localeSelection))) {
                            ref
                                .read(localeProvider.notifier)
                                .update((state) => ref.read(localeSelection));
                          }
                        }
                      },
                      title: appLocalizations!.language,
                      titleTextStyle: theme.textTheme.bodyLarge,
                      leading: const FaIcon(
                        FontAwesomeIcons.language,
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black54,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          (appLocalizations.localeName).toUpperCase(),
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
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
