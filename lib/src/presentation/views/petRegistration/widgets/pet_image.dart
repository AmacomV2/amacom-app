import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:amacom_app/src/config/theme/figma_colors.dart';
import 'package:amacom_app/src/data/dataSources/local_data_source.dart';
import 'package:amacom_app/src/presentation/state/pet_registration/pet_form_providers.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

/// Pet registration form image widget.
class PetRegistrationImage extends ConsumerWidget {
  /// Constructor.
  const PetRegistrationImage({this.width = 160, this.height = 160, Key? key})
      : super(key: key);

  /// width parameter of double type
  final double width;

  /// height parameter of double type
  final double height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responsive = GlobalLocator.responsiveDesign;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
              border: Border.all(
                color: colorScheme.primary,
                width: 1,
              ),
            ),
            child: Container(
              clipBehavior: Clip.hardEdge,
              width: responsive.maxWidthValue(width),
              height: responsive.maxWidthValue(height),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
              ),
              child: ref.watch(petRegistrationImageProvider) != null
                  ? Image.file(
                      ref.watch(petRegistrationImageProvider)!,
                      cacheWidth: responsive.maxWidthValue(width).toInt(),
                      fit: BoxFit.cover,
                    )
                  : Center(
                      child: SizedBox(
                        height: responsive.maxHeightValue(43),
                        width: responsive.maxWidthValue(47),
                        child: SvgPicture.asset(
                          'assets/svg/camera.svg',
                        ),
                      ),
                    ),
            ),
          ),
          if (ref.watch(petRegistrationImageProvider) != null)
            Positioned(
              bottom: -14,
              left: (responsive.maxWidthValue(width) / 2) - 10,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: FigmaColors.primary_50,
                ),
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  'assets/svg/pencil.svg',
                  height: 16,
                  width: 16,
                ),
              ),
            )
        ],
      ),
      onTap: () async {
        File? newImage;
        await AppDialogs.imageSelectionDialog(
          onGallerySelection: () async {
            newImage = await ref.read(localDataSourceProvider).getGallery();
          },
          onCameraSelection: () async {
            newImage = await ref.read(localDataSourceProvider).getCamera();
          },
        );

        if (newImage != null) {
          ref
              .read(petRegistrationImageProvider.notifier)
              .update((state) => state = newImage);
        }
      },
    );
  }
}
