
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spyco_shop_management/constants/colors.dart';


import '../constants/font_styles.dart';
import '../src/utiils/textstyles.dart';

class CustomRadioButton extends StatelessWidget {
  final String title;
  final String value;
  final String? groupValue;
  final Color activeColor;
  final ValueChanged<String?>? onChanged;

  const CustomRadioButton({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.activeColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged?.call(value);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Row(
          children: [
            Container(
              width: 18.0,
              height: 18.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color:  Colors.black87,
                ),
              ),
              child: value == groupValue
                  ? Container(
                margin: const EdgeInsets.all(2),
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  color: selectedGreenColor,
                ),
              )
                  : Container(
                width: 18.0,
                height: 18.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
              ),
            ),
            const SizedBox(width: 10,),
            Text(title,style: styleInterThin(size: 14,
                color: Colors.black),)
          ],
        ),
      ),
    );
  }
}

