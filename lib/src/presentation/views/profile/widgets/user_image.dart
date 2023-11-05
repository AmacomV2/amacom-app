import 'package:amacom_app/src/config/theme/theme.dart';
import 'package:amacom_app/src/presentation/state/authentication/user_provider.dart';
import 'package:amacom_app/src/presentation/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// User Image
///
/// Shows current user imageUrl
class UserImage extends ConsumerWidget {
  ///
  const UserImage({
    super.key,
    this.showEditIcon = false,
    required this.height,
    required this.width,
  });

  /// Image height
  final double height;

  /// Image width
  final double width;

  /// To show edit icon on widget
  final bool showEditIcon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ref.watch(userProvider).when(
          data: (data) {
            if (data.imageUrl.isEmpty) {}
            return Container(
              padding: const EdgeInsets.all(0.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2000),
                color: Colors.white,
                border: Border.all(
                  color: primary,
                  width: 1,
                ),
              ),
              child: Container(
                clipBehavior: Clip.hardEdge,
                height: height,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2000),
                  color: Colors.white,
                  border: Border.all(
                    color: primary,
                    width: 1,
                  ),
                ),
                child: data.imageUrl.isEmpty
                    ? Icon(
                        Icons.image_not_supported_outlined,
                        size: 30,
                        color: primary,
                      )
                    : CachedNetworkImage(
                        imageUrl: data.imageUrl,
                        fit: BoxFit.cover,
                        maxHeightDiskCache: (height * 2).toInt(),
                      ),
              ),
            );
          },
          error: (error, stackTrace) {
            return const SizedCustomProgressIndicator();
          },
          loading: () {
            return const SizedCustomProgressIndicator();
          },
        ),
        if (showEditIcon)
          Positioned(
            bottom: -14,
            left: ((width - 16) / 2),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: FigmaColors.primary_50,
              ),
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                'assets/svg/pencil.svg',
                height: 16,
                width: 16,
                color: theme.primaryColor,
              ),
            ),
          ),
      ],
    );
  }
}
