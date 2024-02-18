import 'package:flutter/cupertino.dart';

import '../constants/text_styles.dart';
import 'custom_textfield.dart';

class AddPersonRowHolder extends StatelessWidget {
  final String title;
  final Widget textField;

  const AddPersonRowHolder({super.key, required this.title, required this.textField});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: textfieldTopText),
        SizedBox(height: 10,),
        textField
      ],
    );
  }
}
