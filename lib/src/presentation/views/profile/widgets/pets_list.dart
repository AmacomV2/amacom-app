import 'package:flutter/material.dart';
import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

/// Pets list
///
/// Pets  horizontal list shown below [ProfileHeader]
class PetsList extends StatelessWidget {
  ///
  const PetsList({super.key});

  @override
  Widget build(BuildContext context) {
    final responsiveD = GlobalLocator.responsiveDesign;
    final List<Map<String, String>> pets = [
      {
        'image': 'assets/images/temporal/dog_1.png',
        'name': 'Donatello',
      },
      {
        'image': 'assets/images/temporal/cat_1.png',
        'name': 'Sasha',
      },
      {
        'image': 'assets/images/temporal/cat_2.png',
        'name': 'Loli',
      },
      {
        'image': 'assets/images/temporal/cat_2.png',
        'name': 'Loli',
      },
    ];
    final imgSize = responsiveD.maxHeightValue(70);
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyLarge?.copyWith(
      color: theme.colorScheme.primary,
    );
    return SizedBox(
      height: responsiveD.maxHeightValue(110),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: pets.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: responsiveD.maxHeightValue(80),
                  child: Column(
                    children: [
                      Image.asset(
                        pets[index]['image'] ?? '',
                        width: imgSize,
                        height: imgSize,
                      ),
                      const SafeSpacer(height: 9),
                      Text(
                        pets[index]['name'] ?? '',
                        style: textStyle,
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const HorizontalSpacer(
                width: 5,
              ),
            ),
          ),
          const HorizontalSpacer(
            width: 15,
          ),
          GestureDetector(
            onTap: () => Navigation.goTo(CustomAppRouter.petRegistration),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(responsiveD.maxHeightValue(15)),
                  height: imgSize,
                  width: imgSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2000),
                    color: FigmaColors.primary_50,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.add,
                    color: theme.colorScheme.primary,
                    size: 30,
                  ),
                ),
                const SafeSpacer(height: 9),
                Text(
                  'Agregar mascota',
                  style: textStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

/// Widget for displaying a pet image and title.
class _ProfilePetImageTitleItem extends StatelessWidget {
  const _ProfilePetImageTitleItem({
    required this.petName,
    required this.asset,
    required this.size,
  });

  final String petName;
  final String asset;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Image.asset(
          asset,
          width: size,
          height: size,
        ),
        const SafeSpacer(height: 10),
        Text(
          petName,
          style: TextStyle(fontSize: 16, color: colorScheme.primary),
        ),
        const SafeSpacer(height: 25),
      ],
    );
  }
}
