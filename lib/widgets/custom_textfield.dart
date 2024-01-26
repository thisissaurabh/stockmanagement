import 'package:flutter/material.dart';
import 'package:spyco_shop_management/constants/colors.dart';

import '../constants/textstyle.dart';

class CustomTextField extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final int maxLines;

  const CustomTextField({Key ? key, required this.controller, required this.hintText, this.maxLines = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0.05,
        horizontal: 10),
        hintText: hintText,
        hintStyle:  k16_400_62696A.copyWith(fontSize: 14),
        border: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.yellow,
                width: 0.5
            )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.60), width: 0.5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red,
              width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide( color: selectedColor
              .withOpacity(0.90), width: 0.5),
        ),
      ),
      validator: (val) {
        if(val == null || val.isEmpty){
          return 'Enter a valid $hintText';
        }
        return null;
      },
    );
  }
}
