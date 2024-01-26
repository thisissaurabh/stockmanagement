import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key,
    required this.title,
    required this.press,
    required this.sizeHorizontal,
    required this.sizeVerticle,
    required this.color,
    required this.titleColor, this.radius});
  final String title;
  final VoidCallback press;
  final double sizeHorizontal;
  final double sizeVerticle;
  final Color color;
  final Color titleColor;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: press,
        borderRadius: BorderRadius.circular(radius ??12.0),
        child: Container(
          padding:  EdgeInsets.symmetric(horizontal: sizeHorizontal, vertical: sizeVerticle),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: color,
          ),
          child: Text(
            title,
            style: ralewayStyle.copyWith(
              fontWeight: FontWeight.w900,
              color: titleColor,
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
                color: selectedColor,
                shape: BoxShape.rectangle),
            child: Icon(Icons.add),
        ),
      ),
    );
  }
}


class AddButtonWithText extends StatelessWidget {
  final VoidCallback onTap;
  const AddButtonWithText({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: purpleColor.withOpacity(0.80),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SvgPicture.asset("assets/icons/add-svgrepo-com.svg",color: Colors.white,),
              Text("Add User",
              style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingButton extends StatelessWidget {
  final Color? color;
  const LoadingButton({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: Colors.transparent,
          child: Ink(
            padding: const EdgeInsets.symmetric(
                horizontal: 70.0, vertical: 18.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: color ?? Colors.black,
            ),
            child: Center(
        child: LoadingAnimationWidget.waveDots(
        color: Colors.white,
        size: 20,
        ),
          ),
        ),
        ),
      ],
    );
  }
}
