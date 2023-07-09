import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

import 'package:nb_utils/nb_utils.dart';

/// StateProvider to manage widget state.
final stateProviderT = StateProvider<bool>(
  (ref) => false,
);

/// If tap on "Términos y condiciones", go to an url
class TermsAndConditions extends ConsumerWidget {
  /// Constructor
  const TermsAndConditions({
    super.key,
    required this.onChanged,
  });

  ///
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final stateP = ref.watch(stateProviderT);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: InkWell(
            onTap: () {
              ref.read(stateProviderT.notifier).state = !stateP;
              onChanged.call(!stateP);
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: stateP
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onPrimary,
                border: Border.all(
                  color:
                      stateP ? theme.colorScheme.primary : Colors.grey.shade500,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: stateP
                  ? Icon(
                      Icons.check,
                      size: 16,
                      color: theme.colorScheme.onPrimary,
                    )
                  : null,
            ),
          ),
        ).paddingRight(10),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigation.goTo(
                CustomAppRouter.networkResource,
                extra: {
                  'url': 'https://rewindrecursos.s3.amazonaws.com/REWIND+-+Te%CC%81rminos+y+Condiciones.pdf'
                },
              );
            },
            child: Text(
              'Acepto términos y condiciones',
              style: theme.textTheme.bodyLarge?.copyWith(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        )
      ],
    );
  }
}
