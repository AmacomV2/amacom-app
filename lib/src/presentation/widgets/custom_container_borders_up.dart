import 'package:flutter/material.dart';

///
class CustomContainerBordersUp extends StatelessWidget {
  ///
  const CustomContainerBordersUp({
    super.key,
    this.child,
    this.topPadding = 50,
  });

  ///
  final Widget? child;

  ///
  final double? topPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topPadding ?? 0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: child,
    );
  }
}
