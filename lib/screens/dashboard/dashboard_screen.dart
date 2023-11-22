import 'package:flutter/material.dart';
import 'package:spyco_shop_management/constants/colors.dart';

import 'package:spyco_shop_management/widgets/cards.dart';
import 'components/header.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              title: "Dashboard",
            ),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ElevatedBgCard(
                    radius: 16.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [],
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedBgCard(
                    radius: 16.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [],
                    ),
                  ),
                ),

                // Expanded(
                //   flex: 5,
                //   child: Column(
                //     children: [
                //       MyFiles(),
                //       SizedBox(height: defaultPadding),
                //       RecentFiles(),
                //       if (Responsive.isMobile(context))
                //         SizedBox(height: defaultPadding),
                //       if (Responsive.isMobile(context)) StorageDetails(),
                //     ],
                //   ),
                // ),
                // if (!Responsive.isMobile(context))
                //   SizedBox(width: defaultPadding),
                // // On Mobile means if the screen is less than 850 we don't want to show it
                // if (!Responsive.isMobile(context))
                //   Expanded(
                //     flex: 2,
                //     child: StorageDetails(),
                //   ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ElevatedBgCard(
                    radius: 16.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Total Sales",
                          style: nameText,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedBgCard(
                    radius: 16.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
