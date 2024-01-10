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

class BorderContainer extends StatelessWidget {
  final Widget widget;
  final Function() onTap;
  const BorderContainer({super.key, required this.widget, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 0.5,
              color: Colors.black.withOpacity(0.40)
          ),
        ),
        child: widget,
      ),
    );
  }
}
