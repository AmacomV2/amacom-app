import 'dart:math';
import 'package:flutter/material.dart';
import 'package:amacom_app/src/config/theme/figma_colors.dart';

/// Custom painter specie selection cards
class WeirdShapePainter extends CustomPainter {
  /// Constructor
  WeirdShapePainter({
    required this.borderWidth,
    required this.borderColor,
  });

  /// Color to apply on border
  final Color borderColor;

  /// Border width
  final double borderWidth;

  ///drawArc deals with rads, easier for me to use degrees
  ///so this takes a degree and change it to rad
  double inRads(double degree) {
    return (degree * pi) / 180;
  }

  @override
  bool shouldRepaint(WeirdShapePainter oldDelegate) {
    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //circle angle is 360, remove all space arcs between the main story arc (the number of spaces(stories) times the  space length
    //then subtract the number from 360 to get ALL arcs length
    //then divide the ALL arcs length by number of Arc (number of stories) to get the exact length of one arc
    // final path = Path();
    // path.moveTo(0, 0);

    final path = Path();
    path.moveTo(size.width * 0.24, size.height * 0.3);
    path.quadraticBezierTo(
      size.width * 0.28,
      size.height * 0.0,
      size.width * 0.44,
      size.height * 0.01,
    );
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.009,
      size.width * 0.57,
      size.height * 0.068,
    );
    path.quadraticBezierTo(
      size.width * 0.66,
      size.height * 0.17,
      size.width * 0.69,
      size.height * 0.29,
    );
    path.quadraticBezierTo(
      size.width * 0.73,
      size.height * 0.41,
      size.width * 0.88,
      size.height * 0.56,
    );
    path.quadraticBezierTo(
      size.width * 0.92,
      size.height * 0.61,
      size.width * 0.94,
      size.height * 0.64,
    );
    path.quadraticBezierTo(
      size.width * 1.04,
      size.height * 0.85,
      size.width * 0.89,
      size.height * 0.94,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 1,
      size.width * 0.5,
      size.height * 0.92,
    );
    path.quadraticBezierTo(
      size.width * 0.43,
      size.height * 0.9,
      size.width * 0.3,
      size.height * 0.95,
    );
    path.quadraticBezierTo(
      size.width * 0.06,
      size.height * 1.06,
      size.width * 0.02,
      size.height * 0.87,
    );
    path.quadraticBezierTo(
      size.width * 0.0,
      size.height * 0.68,
      size.width * 0.12,
      size.height * 0.55,
    );
    // path.quadraticBezierTo(
    //   size.width * 0.21,
    //   size.height * 0.52,
    //   size.width * 0.255,
    //   size.height * 0.44,
    // );
    path.quadraticBezierTo(
      size.width * 0.21,
      size.height * 0.42,
      size.width * 0.24,
      size.height * 0.3,
    );

    canvas.drawPath(
      path,
      Paint()
        //here you can compare your SEEN story index with the arc index to make it grey
        ..color = FigmaColors.primary_200
        ..strokeWidth = 2
        ..style = PaintingStyle.fill,
    );
    canvas.drawPath(
      path,
      Paint()
        //here you can compare your SEEN story index with the arc index to make it grey
        ..color = borderColor
        ..strokeWidth = borderWidth
        ..style = PaintingStyle.stroke,
    );
  }
}
