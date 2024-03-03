import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spyco_shop_management/constants/colors.dart';

import '../constants/text_styles.dart';
import '../constants/textstyle.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final int maxLines;
  final double verticlePadding;
  final String? Function(String?)? validation;
  final bool readOnly;
  final TextInputAction textInputAction;
  final Function()? tap;
  final Function(String)? onChanged;

  const CustomTextField({Key ? key,  this.controller,
    required this.hintText,
    this.maxLines = 1,
    required this.validation,
    this.verticlePadding = 8,
    this.readOnly = false,
    this.textInputAction = TextInputAction.next, this.tap, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
        readOnly: readOnly,
        onTap: tap,
        onChanged: onChanged,
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



Widget customDropDownFieldHolder({
  required String title,
  required Widget child,

}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: textfieldTopText),
        SizedBox(height: 6,),
        child,

      ],
    );
}