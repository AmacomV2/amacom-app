import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:amacom_app/src/presentation/widgets/custom_asset_icon.dart';

/// Convert from svg to icon class
class SvgPngToIcon {
  /// Builder
  /// Get svg file
  SvgPngToIcon({required this.assetName, this.padding});

  /// File svg
  final String assetName;

  /// Padding to set size icon
  final double? padding;

  /// get SvgPicture
  get iconFromSVG => Container(
        padding: (padding != null) ? EdgeInsets.all(padding!) : null,
        child: SvgPicture.asset(
          'assets/svg/icons/$assetName.svg',
          fit: BoxFit.fitHeight,
        ),
      );

  ///
  get iconFromSVG2 => CustomAssetIcon(
        path: 'assets/svg/icons/$assetName.svg',
        height: 40,
        width: 40,
      );

  /// get OngPicture
  Image get iconFromPNG => Image.asset('assets/png/icons/$assetName.png');
}
