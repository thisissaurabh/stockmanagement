import 'package:flutter/material.dart';
import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.title, required this.press});
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: press,
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 18.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: bgColor,
          ),
          child: Text(
            title,
            style: ralewayStyle.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.whiteColor,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}

class PlusButton extends StatelessWidget {
  const PlusButton({super.key, required this.press});

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: press,
        borderRadius: BorderRadius.circular(16.0),
        child: Ink(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: bgColor,
                shape: BoxShape.rectangle),
            child: Icon(Icons.add)),
      ),
    );
  }
}
