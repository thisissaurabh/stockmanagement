import 'package:flutter/material.dart';

import '../utiils/textfields.dart';
import '../utiils/textstyles.dart';
import 'common_widgets.dart';

class CustomDropDown extends StatefulWidget {
  final String label;
  final String title;
  final int listCount;
  final Function(String) onItemSelected; // Change parameter name
  final List<String> dataList;
  final TextEditingController textFieldController; // TextField controller

  const CustomDropDown({
    Key? key,
    required this.label,
    required this.listCount,
    required this.onItemSelected, // Change parameter name
    required this.dataList,
    required this.textFieldController, required this.title, // TextField controller
  }) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  bool isDropdownOpen = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,
          style: styleInterBold(
              size: 10,
              color: Colors.black),
        ),
        SizedBox(height: 3,),
        DropdownFieldBox(
          context: context,
          label: widget.label,
          controller: widget.textFieldController, // Pass the TextField controller
          length: null,
          validator: (val) {
            return null;
          },
          onTap: () {
            setState(() {
              isDropdownOpen = !isDropdownOpen;
            });
          },
        ),
        isDropdownOpen
            ? customCard(
          context: context,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.listCount,
            itemBuilder: (_, i) {
              return AnimatedContainer(
                padding: const EdgeInsets.all(4),
                duration: const Duration(microseconds: 800),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      isDropdownOpen =false;
                    });
                    widget.onItemSelected(widget.dataList[i]); // Call onItemSelected
                  },
                  child: Text(
                    widget.dataList[i],
                    style: styleInterExtraLite(
                      size: 10,
                      color: Colors.black87,
                    ),
                  ),
                ),
              );
            },
          ),
        )
            : const SizedBox(),
      ],
    );
  }
}
