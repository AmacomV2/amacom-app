import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:amacom_app/src/utils/utils/utils.dart';

class CustomAssetIcon extends StatelessWidget {
  const CustomAssetIcon({
    super.key,
    required this.path,
    this.fit,
    required this.height,
    this.width,
    this.padding,
  });

  final String path;

  final BoxFit? fit;

  final double height;

  final double? width;

  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    final resourceType = ResourceTypeHelper.getType(path);
    if (resourceType == ResourceType.SVG) {
      return SvgPicture.asset(
        path,
        height: height,
        width: width,
        alignment: Alignment.bottomCenter,
      );
    }
    if (resourceType == ResourceType.IMAGE) {
      return Image.asset(
        path,
        height: height,
        width: width,
        alignment: Alignment.bottomCenter,
      );
    }
    return Container();
  }
}
