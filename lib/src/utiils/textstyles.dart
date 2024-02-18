

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:flutter_svg/flutter_svg.dart';
import 'package:spyco_shop_management/src/utiils/strings.dart';

styleInterThin({required double size, required Color color}) {
  return TextStyle(fontSize: size, color: color, fontFamily: InterThin,
  );
}
styleInterBlack({required double size, required Color color}) {
  return TextStyle(fontSize: size, color: color, fontFamily: InterBlack);
}

styleInterBold({required double size, required Color color}) {
  return TextStyle(fontSize: size, color: color, fontFamily: InterBold, fontWeight: FontWeight.bold);
}

styleInterExtraBold({required double size, required Color color}) {
  return TextStyle(fontSize: size, color: color, fontFamily: InterExtraBold, fontWeight: FontWeight.bold);
}

styleInterExtraLite({required double size, required Color color}) {
  return TextStyle(fontSize: size, color: color, fontFamily: InterExtraLight);
}

styleInterMedium({required double size, required Color color}) {
  return TextStyle(fontSize: size, color: color, fontFamily: InterMedium);
}

styleInterRegular({required double? size, required Color color}) {
  return TextStyle(fontSize: size ?? null, color: color, fontFamily: InterRegular, fontWeight: FontWeight.w400);
}

styleInterSemiBold({required double size, required Color color}) {
  return TextStyle(fontSize: size, color: color, fontFamily: InterSemiBold);
}

