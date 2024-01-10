import 'package:flutter/material.dart';
import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';

class DecorationCustomNew {
  final bool? blocked;
  final String label;
  final String prefixIcon;
  final bool suffixIcon;
  final bool? showEye;
  final Function? onTap;
  final Function? onPrefixTap;
  DecorationCustomNew({
    required this.label,
    required this.prefixIcon,
    required this.suffixIcon,
    this.showEye,
    this.onTap,
    this.onPrefixTap,
    this.blocked,
  });

  InputDecoration textFieldDecoration() {
    if (suffixIcon) {
      return InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: label,
        hintStyle: k16_400_62696A,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 0,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            onTap!();
          },
          child: Container(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Image.asset(
                  'assets/icons/${showEye! ? 'eye' : 'eye-slash'}.png'),
            ),
          ),
        ),
        suffixIconConstraints: BoxConstraints(maxWidth: 56, maxHeight: 24),
        // prefixIcon: GestureDetector(
        //   onTap: () {
        //     //print('a');
        //     onPrefixTap!();
        //   },
        //   child: Container(
        //     color: Colors.black,
        //     padding: const EdgeInsets.symmetric(horizontal: 12),
        //     child: Image.asset('assets/icons/$prefixIcon.png'),
        //   ),
        // ),
        // prefixIconConstraints: BoxConstraints(maxWidth: 56, maxHeight: 24),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: textfieldBorder, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: textfieldBorder, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 2,
          ),
        ),
      );
    } else {
      return InputDecoration(
        filled: true,
        fillColor: blocked! ? Colors.grey : Colors.white,
        hintText: label,
        hintStyle: k16_400_62696A,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 0,
        ),
        // prefixIcon: GestureDetector(
        //   onTap: () {
        //     //print('a');
        //     onPrefixTap!();
        //   },
        //   child: Container(
        //     color: Colors.transparent,
        //     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        //     child: Image.asset('assets/icons/$prefixIcon.png'),
        //   ),
        // ),
        // prefixIconConstraints: BoxConstraints(maxWidth: 56),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: textfieldBorder, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: textfieldBorder, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: textfieldBorder, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 2,
          ),
        ),
      );
    }
  }
}

class DecorationCustom {
  final String label;
  final String prefixIcon;
  final bool suffixIcon;
  final bool? showEye;
  final Function? onTap;
  DecorationCustom({
    required this.label,
    required this.prefixIcon,
    required this.suffixIcon,
    this.showEye,
    this.onTap,
  });



  InputDecoration textFieldDecoration() {
    if (suffixIcon) {
      return InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: label,
        hintStyle: k16_400_62696A,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            onTap!();
          },
          child: Container(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Image.asset(
                  'assets/icons/${showEye! ? 'eye' : 'eye-slash'}.png'),
            ),
          ),
        ),
        suffixIconConstraints: BoxConstraints(maxWidth: 56, maxHeight: 24),
        // prefixIcon: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 12),
        //   child: Image.asset('assets/icons/$prefixIcon.png'),
        // ),
        // prefixIconConstraints: BoxConstraints(maxWidth: 56, maxHeight: 24),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: textfieldBorder, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: textfieldBorder, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 2,
          ),
        ),
      );
    } else {
      return InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: label,
        hintStyle: k16_400_62696A,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        // prefixIcon: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 12),
        //   child: Image.asset('assets/icons/$prefixIcon.png'),
        // ),
        // prefixIconConstraints: BoxConstraints(maxWidth: 56, maxHeight: 24),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: textfieldBorder, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: textfieldBorder, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 2,
          ),
        ),
      );
    }
  }
}

class DecorationCustomSuffix {
  final String label;
  final String suffixIcon;
  DecorationCustomSuffix({
    required this.label,
    required this.suffixIcon,
  });

  InputDecoration textFieldDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: label,
      hintStyle: k16_400_62696A,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 15,
      ),
      suffixIcon: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Image.asset('assets/icons/$suffixIcon.png'),
        ),
      ),
      suffixIconConstraints: BoxConstraints(maxWidth: 56, maxHeight: 24),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: textfieldBorder, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: textfieldBorder, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.redAccent,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.redAccent,
          width: 2,
        ),
      ),
    );
  }
}

class DecorationSimpleBold {
  final String label;
  DecorationSimpleBold({required this.label});

  InputDecoration textFieldDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: label,
      hintStyle: k20_700_62696A,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 15,
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: textfieldBorder, width: 1),
      ),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: textfieldBorder, width: 2),
      ),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.redAccent,
          width: 1,
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.redAccent,
          width: 2,
        ),
      ),
    );
  }
}

class DecorationSimple {
  final String label;
  DecorationSimple({required this.label});

  InputDecoration textFieldDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: label,
      hintStyle: k16_400_62696A,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 15,
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: textfieldBorder, width: 1),
      ),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: textfieldBorder, width: 2),
      ),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.redAccent,
          width: 1,
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.redAccent,
          width: 2,
        ),
      ),
    );
  }
}

class CustomDataField {
  final String label;
  CustomDataField({required this.label});

  InputDecoration dataFieldDecoration() {
    return InputDecoration(
        // contentPadding: EdgeInsets.symmetric(vertical: 1),
        labelText: label,
        labelStyle: k16_400_62696A.copyWith(fontSize: 14),
      fillColor: Colors.white,
      //   contentPadding: EdgeInsets.symmetric(
      //     horizontal: 10,
      //     vertical: 10,
      //   ),

        // This is the normal border
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.yellow,
                width: 1
          )
        ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: Colors.black.withOpacity(0.60), width: 0.5),
      ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.red,
                width: 1),
        ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide( color: selectedColor
            .withOpacity(0.90), width: 0.5),
      ),
    );

    // return InputDecoration(
    //   filled: true,
    //   fillColor: Colors.white,
    //   hintText: label,
    //   hintStyle: k16_400_62696A,
    //   contentPadding: EdgeInsets.symmetric(
    //     horizontal: 10,
    //     vertical: 10,
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(6),
    //     borderSide: BorderSide(color: Colors.black.withOpacity(0.60), width: 0.5),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(6),
    //     borderSide: BorderSide( color: selectedColor
    //         .withOpacity(0.90), width: 0.5),
    //   ),
    // );
  }
}


class ItemDataField {
  final String label;
  ItemDataField({required this.label});

  InputDecoration itemFieldDecoration() {
    return InputDecoration(
      // contentPadding: EdgeInsets.symmetric(vertical: 1),
      hintText: label,
      hintStyle: k16_400_62696A.copyWith(fontSize: 12),
      fillColor: Colors.white,

      //   contentPadding: EdgeInsets.symmetric(
      //     horizontal: 10,
      //     vertical: 10,
      //   ),

      // This is the normal border
      border: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.yellow,
              width: 0.5
          )
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide(color: Colors.black.withOpacity(0.60), width: 0.5),
      ),
      errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.60), width: 0.5),
            ),
      focusedBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide(color: Colors.black.withOpacity(0.60), width: 0.5),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 6,horizontal: 2),

    );

    // return InputDecoration(
    //   filled: true,
    //   fillColor: Colors.white,
    //   hintText: label,
    //   hintStyle: k16_400_62696A,
    //   contentPadding: EdgeInsets.symmetric(
    //     horizontal: 10,
    //     vertical: 10,
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(6),
    //     borderSide: BorderSide(color: Colors.black.withOpacity(0.60), width: 0.5),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(6),
    //     borderSide: BorderSide( color: selectedColor
    //         .withOpacity(0.90), width: 0.5),
    //   ),
    // );
  }
}