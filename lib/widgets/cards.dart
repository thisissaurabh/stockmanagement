import 'package:flutter/material.dart';
import 'package:spyco_shop_management/constants/colors.dart';

class CustomBgCard extends StatelessWidget {
  const CustomBgCard({super.key, required this.child, required this.width});
  final Widget child;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 10),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: child,
    );
  }
}

class ElevatedBgCard extends StatelessWidget {
  const ElevatedBgCard({super.key, required this.child, required this.radius});
  final Widget child;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 7,
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius),
      child: child,
    );
  }
}
