import 'package:flutter/material.dart';

class CustomHorizontalLine extends StatelessWidget {
  const CustomHorizontalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.grey.withOpacity(0.40),
    );
  }
}


class MouseHover extends StatelessWidget {
  final Widget child;
  const MouseHover({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: child,
    );
  }
}
