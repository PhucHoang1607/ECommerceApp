import 'package:flutter/material.dart';

class CustomeItemNavigation extends StatelessWidget {
  const CustomeItemNavigation(
      {super.key,
      required this.width,
      required this.color,
      required this.height,
      required this.child});

  final double width;
  final double height;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: child,
    );
  }
}
