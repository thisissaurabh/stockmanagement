import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../utiils/textstyles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, required this.widget});
  final String title;
  final List<Widget> widget;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap:  () {
          Navigator.pop(context);
        },
        child: Icon(Ionicons.arrow_back,
          color: Colors.black,
          size: 30,),
      ), //
      centerTitle: false,
      title: Text(
        title,
        style: styleInterExtraBold(size: 34, color: Colors.black),
      ),
      actions: widget,
    );
  }


  @override
  Size get preferredSize => Size.fromHeight(50.0); // Replace 100.0 with your desired height
}
