import 'package:amacom_app/src/config/settings.dart';
import 'package:amacom_app/src/utils/utils/global_locator.dart';
import 'package:amacom_app/src/utils/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Change locale dialog body
class ChangeLocaleWidget extends ConsumerWidget {
  ///
  const ChangeLocaleWidget({
    super.key,
    required this.state,
  });

  /// Widget selection state
  final StateProvider<Locale> state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLocalizations = AppLocalizations.of(context);
    final responsive = GlobalLocator.responsiveDesign;
    final theme = Theme.of(context);
    final height = responsive.maxHeightValue(
      70.0 * AppLocalizations.supportedLocales.length,
    );
    return Container(
      padding: responsive.appHInnerPadding,
      height: height > 240 ? 240 : height,
      width: double.infinity,
      child: ListView.separated(
        padding: EdgeInsets.only(
          top: responsive.maxHeightValue(10),
        ),
        itemCount: AppLocalizations.supportedLocales.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final e = AppLocalizations.supportedLocales[index];
          return GestureDetector(
            onTap: () {
              ref.read(state.notifier).update((state) => state = e);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(AppSizes.genericBorderRadius),
                border: ref.watch(state) == e
                    ? Border.all(
                        color: theme.primaryColor,
                      )
                    : null,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      (e.languageCode == 'en'
                              ? appLocalizations?.en
                              : appLocalizations?.es) ??
                          '',
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black54,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      (e.languageCode).toUpperCase(),
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
