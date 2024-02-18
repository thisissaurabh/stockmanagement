import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spyco_shop_management/src/utiils/strings.dart';
import 'package:spyco_shop_management/src/utiils/textstyles.dart';

import 'colors.dart';

textFieldEditBox({
  required BuildContext context,
  required String label,
  required String icon,
  required TextEditingController controller,
  required String hint,
  required int? length,
  required String? Function(String?)? validator,
}) {
  return SizedBox(
    height: 30,
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 1),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
                icon,
                height: 16.0,
                color: defaultColor),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              width: 1,
              color: lightGrey,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              width: 1,
              color: defaultColor,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              width: 1,
              color: lightGrey,
            ),
          ),
          hintText: hint,
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              width: 1,
              color: lightGrey,
            ),
          )),
      onChanged: (value) {
        controller.value = TextEditingValue(text: value, selection: TextSelection(baseOffset: value.length, extentOffset: value.length));
        // controller.value = value.trim() as TextEditingValue;
      },
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: length != null ? [LengthLimitingTextInputFormatter(10)] : [],
    ),
  );
}

UnderLineFieldEditBox({
  required BuildContext context,
  required String label,
  required String icon,
  required TextEditingController controller,
  required String hint,
  required int? length,
  required String? Function(String?)? validator,
  void Function(String)? onChanged,
}) {
  return TextFormField(
    controller: controller,
    onChanged: onChanged,
    decoration: InputDecoration(
      prefixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          icon,
          height: 16.0,
          color: defaultColor,
        ),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: lightGrey),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: defaultColor),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: lightGrey),
      ),
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: lightGrey),
      ),
      hintText: hint,
    ),
    validator: validator,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    inputFormatters: length != null ? [LengthLimitingTextInputFormatter(10)] : [],
  );
}


textBox({
  required BuildContext context,
  required String title,
  required String label,
  required TextEditingController controller,
  required String hint,
  required int? length,
  required String? Function(String?)? validator,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,
        style:  styleInterThin(
      size: 10,
      color: Colors.black),
      ),
      SizedBox(height: 3,),
      TextFormField(
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 4),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: lightGrey,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: defaultColor,
              ),
            ),
            labelStyle:  const TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: lightGrey,
              ),
            ),
            hintText: hint,
            hintStyle:  const TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: lightGrey,
              ),
            )),
        onChanged: (value) {
          controller.value = TextEditingValue(text: value, selection: TextSelection(baseOffset: value.length, extentOffset: value.length));
          // controller.value = value.trim() as TextEditingV
          // alue;
        },
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: length != null ? [LengthLimitingTextInputFormatter(10)] : [],
      ),
    ],
  );
}

pickerTextBox({
  required BuildContext context,
  required String label,
  required String suffixIcon,
  required TextEditingController controller,
  required String hint,
  required int? length,
  required Function() click,
  required String? Function(String?)? validator,
}) {
  return TextFormField(
    controller: controller,
    readOnly: true,
    onTap: click,

    decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: click,

            child: SvgPicture.asset(
                suffixIcon,
                height: 16.0,
                color: defaultColor),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
            width: 1,
            color: lightGrey,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
            width: 1,
            color: defaultColor,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
            width: 1,
            color: lightGrey,
          ),
        ),
        labelText: hint,
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(
            width: 1,
            color: lightGrey,
          ),
        )),
    onChanged: (value) {
      controller.value = TextEditingValue(text: value, selection: TextSelection(baseOffset: value.length, extentOffset: value.length));
      // controller.value = value.trim() as TextEditingValue;
    },
    validator: validator,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    inputFormatters: length != null ? [LengthLimitingTextInputFormatter(10)] : [],
  );
}


underLineFieldSimple({
  required BuildContext context,
  required String label,
  required TextEditingController controller,
  required String hint,
  required int? length,
  required String? Function(String?)? validator,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: lightGrey),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: defaultColor),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: lightGrey),
      ),
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: lightGrey),
      ),
      hintText: hint,
      hintStyle: styleInterRegular(
        size: 14,
        color: colorDarkGrey,
      ),
    ),
    onChanged: (value) {
      controller.value = TextEditingValue(
        text: value,
        selection: TextSelection(
          baseOffset: value.length,
          extentOffset: value.length,
        ),
      );
    },
    validator: validator,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    inputFormatters: length != null ? [LengthLimitingTextInputFormatter(10)] : [],
  );
}


whiteTextBox({
  required BuildContext context,
  required String label,
  required TextEditingController controller,
  required String hint,
  required int? length,
  required String? Function(String?)? validator,
}) {
  return Container(
    color: Colors.white,
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        hintStyle: styleInterThin(size: 13,
            color: Colors.grey),
        labelStyle: styleInterThin(size: 13,
            color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 8),
        fillColor: Colors.white,
        hintText: hint,
        border: InputBorder.none, // Remove border
        focusedBorder: InputBorder.none, // Remove focused border
        enabledBorder: InputBorder.none, // Remove enabled border
        errorBorder: InputBorder.none, // Remove error border
        focusedErrorBorder: InputBorder.none, // Remove focused error border
      ),
      onChanged: (value) {
        controller.value = TextEditingValue(
          text: value,
          selection: TextSelection(baseOffset: value.length, extentOffset: value.length),
        );
      },
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: length != null ? [LengthLimitingTextInputFormatter(10)] : [],
    ),
  );

}


class DropdownFieldBox extends StatefulWidget {
  final BuildContext context;
  final String label;
  final TextEditingController controller;
  final int? length;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;

  const DropdownFieldBox({
    Key? key,
    required this.context,

    required this.label,
    required this.controller,
    required this.length,
    required this.validator,
    required this.onTap,
  }) : super(key: key);

  @override
  State<DropdownFieldBox> createState() => _DropdownFieldBoxState();
}

class _DropdownFieldBoxState extends State<DropdownFieldBox> {
  bool isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          readOnly: true,
          onTap: () {
            widget.onTap!();
            isDropdownOpen = !isDropdownOpen;
          },
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 8),

            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.grey, // Assuming lightGrey is defined somewhere
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.red, // Assuming defaultColor is defined somewhere
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.grey, // Assuming lightGrey is defined somewhere
              ),
            ),
            labelText: widget.label,
            labelStyle: const TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.grey, // Assuming lightGrey is defined somewhere
              ),
            ),
          ),
          onChanged: (value) {
            widget.controller.value = TextEditingValue(
              text: value,
              selection: TextSelection(
                baseOffset: value.length,
                extentOffset: value.length,
              ),
            );
          },
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: widget.length != null ? [LengthLimitingTextInputFormatter(10)] : [],
        ),
      ],
    );
  }
}

class DropDownFieldDecoration {
  final String hint;
  DropDownFieldDecoration({required this.hint});

  InputDecoration decoration() {
    return  InputDecoration(
    isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 4),
    enabledBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
    width: 1,
    color: lightGrey,
    ),
    ),
    errorBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
    width: 1,
    color: defaultColor,
    ),
    ),
    focusedBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
    width: 1,
    color: lightGrey,
    ),
    ),
    hintText: hint,
        hintStyle:  const TextStyle(
          fontSize: 10,
          color: Colors.black,
        ),
        labelStyle:  const TextStyle(
          fontSize: 10,
          color: Colors.black,
        ),
    focusedErrorBorder: const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(
    width: 1,
    color: lightGrey,
    ),
    ));
  }
}
