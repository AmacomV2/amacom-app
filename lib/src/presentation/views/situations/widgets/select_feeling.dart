import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/domain/entities/entities.dart';
import 'package:amacom_app/src/presentation/state/situations/new_situation_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/feelings_body.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/generic_card.dart';
import 'package:amacom_app/src/presentation/widgets/buttons.dart';
import 'package:amacom_app/src/presentation/widgets/spacers.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
class SelectFeeling extends ConsumerWidget {
  ///
  const SelectFeeling({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final responsive = GlobalLocator.responsiveDesign;

    return Column(
      children: [
        Text(
          'Elige los sentimientos o sensaciones que reflejan como te sientes',
          style: theme.textTheme.bodyLarge?.copyWith(),
          textAlign: TextAlign.justify,
        ),
        const SafeSpacer(
          height: 8,
        ),
        ...ref
            .watch(situationFeelingsProvider)
            .reversed
            .map(
              (e) => GenericDismissibleCard(
                text: e.name,
                onTap: () {
                  final temp = List<GenericData>.from(
                    ref.read(situationFeelingsProvider),
                  );
                  temp.removeWhere((element) => element.id == e.id);
                  ref
                      .read(situationFeelingsProvider.notifier)
                      .update((state) => temp);
                },
              ),
            )
            .toList(),
        const SafeSpacer(
          height: 8,
        ),
        GenericRoundedButton(
          onTap: () async {
            await AppDialogs.genericBottomSheet(
              widget: const FeelingsBody(),
            );
          },
          border: true,
          padding: EdgeInsets.symmetric(
            vertical: responsive.maxHeightValue(14),
            horizontal: responsive.maxWidthValue(12),
          ),
          textColor: FigmaColors.secondary_500,
          borderColor: FigmaColors.secondary_300,
          adaptiveTextColor: false,
          text: 'Seleccionar',
          suffix: const Icon(
            Icons.add_circle_outline_rounded,
            size: 20,
          ),
        ),
      ],
    );
  }
}
