
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/utiils/textstyles.dart';




class CustomCheckButton extends StatefulWidget {
  final String title;
  final bool isChecked;
  final Color activeColor;
  final ValueChanged<bool>? onChanged;

  const CustomCheckButton({
    required this.title,
    required this.isChecked,
    required this.activeColor,
    required this.onChanged,
  });

  @override
  _CustomCheckButtonState createState() => _CustomCheckButtonState();
}

class _CustomCheckButtonState extends State<CustomCheckButton> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
        widget.onChanged?.call(_isChecked);
      },
      child: Row(
        children: [
          Container(
            width: 16.0,
            height: 16.0,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.black87,
              ),
            ),
            child: _isChecked
                ? Icon(
              Icons.check,
              size: 14.0,
              color: Colors.black,
            )
                : Container(),
          ),
          const SizedBox(width: 10,),
          Text(
            widget.title,
            style: styleInterBold(size: 10, color: Colors.black),
          )
        ],
      ),
    );
  }
}
