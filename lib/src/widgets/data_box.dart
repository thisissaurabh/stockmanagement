import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/textfield_decoration.dart';

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