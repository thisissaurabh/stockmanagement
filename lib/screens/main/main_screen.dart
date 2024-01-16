import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/controllers/MenuAppController.dart';
import 'package:spyco_shop_management/constants/responsive.dart';
import 'package:spyco_shop_management/screens/dashboard/dashboard_screen.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainscreenColor,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              // Expanded(
              //   // default flex = 1
              //   // and it takes 1/6 part of the screen
              //   child: SideMenu(),
              // ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 4,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
