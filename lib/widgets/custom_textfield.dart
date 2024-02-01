import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spyco_shop_management/constants/colors.dart';

import '../constants/textstyle.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final int maxLines;
  final double verticlePadding;
  final String? Function(String?)? validation;
  final bool readOnly;
  final TextInputAction textInputAction;



  const CustomTextField({Key ? key,  this.controller,
    required this.hintText,
    this.maxLines = 1,
    required this.validation,
    this.verticlePadding = 6,
    this.readOnly = false,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      maxLines: maxLines,
        readOnly: readOnly,

        // inputFormatters: [
        //   LengthLimitingTextInputFormatter(10),
        // ],

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: verticlePadding,
        horizontal: 10),
        hintText: hintText,
        isDense: true,
        hintStyle:  k16_400_62696A.copyWith(fontSize: 14),
        border: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.yellow,
                width: 0.5
            )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.60), width: 0.5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.red,
              width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide( color: selectedGreenColor
             , width: 0.5),
           ),
        ),
        // textInputAction: TextInputAction.next,

        // onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
        onEditingComplete: () {

          // Move the focus to the next node explicitly.

          FocusScope.of(context).nextFocus();

        },
        // textInputAction: textInputAction,
        validator: validation
    );
  }
}



class Field extends StatelessWidget {

  Field({super.key});


  final controller = TextEditingController();


  @override

  Widget build(BuildContext context) {

    return TextFormField(

      controller: controller,

      decoration: const InputDecoration(

          border: OutlineInputBorder(),

          labelText: "Email"),

      // textInputAction: TextInputAction.next,

      // onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),

      onEditingComplete: () {

        // Move the focus to the next node explicitly.

        FocusScope.of(context).nextFocus();

      },

      validator: (value) {

        if (value == null || value.isEmpty) {

          return 'Please enter your email';

        }

        return null;

      },

    );

  }

}