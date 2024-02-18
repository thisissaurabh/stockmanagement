import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/textfield_decoration.dart';

Widget customCard({
  required BuildContext context,
  required Widget child,
  double? bottomPadding,
  double? leftPadding,
  double? rightPadding,
  double? topPadding,
  double? elevation,
  VoidCallback? onTap,
}) {
  // Set default padding value if not provided
  bottomPadding ??= 28.0;
  leftPadding ??= 16.0;
  rightPadding ??= 16.0;
  topPadding ??= 28.0;
  elevation ??= 5.0;

  return Card(
    elevation: elevation,
    child: GestureDetector(
      onTap: onTap != null ? onTap : () {},
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(
            left: leftPadding,
            right: rightPadding,
            top: topPadding,
            bottom: bottomPadding,
          ),
          child: child,
        ),
      ),
    ),
  );
}


class InvoiceBoxField extends StatelessWidget {
  final String title;


  const InvoiceBoxField({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      decoration: BoxDecoration(
          color: selectedGreenColor,
          border:
          Border.all(width: 0.2, color: Colors.black.withOpacity(0.50))),
      child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w900),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 2,
          )),
    );
  }
}

class ItemRowBilling extends StatelessWidget {
  final String title;
  final Color color;

  const ItemRowBilling({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: TextField(
        cursorHeight: 22,
        // controller: discount,
        onChanged: (value) {
          // discountP = double.tryParse(value) ?? 0;
          // calculateTotalAmount();
        },
        onSubmitted: (val) {
          FocusScope.of(context).requestFocus(FocusNode());
          FocusScope.of(context).nextFocus();
        },
        decoration: ItemDataField(
          label: title,
        ).itemFieldDecoration(),
      ),
    );
  }
}

class InvoiceTotalBoxField extends StatelessWidget {
  final String title;

  const InvoiceTotalBoxField({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.80),
          border:
          Border.all(width: 0.2, color: Colors.black.withOpacity(0.50))),
      child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black, fontSize: 13, fontWeight: FontWeight.w700),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 2,
          )),
    );
  }
}

Widget outlineContainer({
  required Widget child,
}) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black,
        )
    ),
    child:child ,
  );
}