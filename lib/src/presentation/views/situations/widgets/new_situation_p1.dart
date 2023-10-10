import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/presentation/state/situations/new_situation_provider.dart';
import 'package:amacom_app/src/presentation/views/situations/widgets/select_subject.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/constant/constants.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

///
class NewSituationPart1 extends StatelessWidget {
  ///
  const NewSituationPart1({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final responsive = GlobalLocator.responsiveDesign;
    return SingleChildScrollView(
      child: ColumnWithPadding(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SelectSubject(),
          const SafeSpacer(),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Puntúa tu grado de afectación de 1 a 10',
                  style: theme.textTheme.bodyLarge,
                  textAlign: TextAlign.justify,
                ),
              ),
              Tooltip(
                message:
                    'Marca 1 si tu grado de afectación es leve y 10 si es grave',
                triggerMode: TooltipTriggerMode.tap,
                textStyle: theme.textTheme.bodyLarge?.copyWith(),
                showDuration: AppDurations.longMessagePopUp,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius:
                      BorderRadius.circular(AppSizes.genericBorderRadius),
                ),
                margin: responsive.appHorizontalPadding,
                child: const FaIcon(
                  FontAwesomeIcons.solidCircleQuestion,
                  size: 20,
                  color: FigmaColors.secondary_200,
                ),
              ),
            ],
          ),
          const SafeSpacer(
            height: 10,
          ),
          DegreeSelector(
            stateProvider: affectationDegreeProvider,
          ),
          const SafeSpacer(),
          Text(
            'Describe con tus palabras la situación actual ',
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SafeSpacer(
            height: 16,
          ),
          CustomTextFormField(
            fillColor: theme.colorScheme.primary,
            maxLines: 5,
            minLines: 3,
            labelText: 'Describe tu situación',
          ),
        ],
      ),
    );
  }
}
