

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:spyco_shop_management/api/login_register/add_supplier_api.dart';
import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/constants/responsive.dart';
import 'package:spyco_shop_management/constants/textfield_decoration.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';
import 'package:spyco_shop_management/controllers/MenuAppController.dart';
import 'package:spyco_shop_management/management/sales_person.dart';
import 'package:spyco_shop_management/screens/dashboard/components/header.dart';
import 'package:spyco_shop_management/screens/main/components/side_menu.dart';
import 'package:spyco_shop_management/widgets/cards.dart';
import 'package:spyco_shop_management/widgets/global_widgets.dart';
import 'package:spyco_shop_management/widgets/globals.dart';
import 'package:spyco_shop_management/widgets/intraction_buttons.dart';
import 'package:spyco_shop_management/widgets/main_button.dart';
import 'package:spyco_shop_management/widgets/snackbar.dart';

import '../constants/text_styles.dart';
import 'discount.dart';


class Management extends StatefulWidget {
  const Management({super.key});

  @override
  State<Management> createState() => _ManagementState();
}

class _ManagementState extends State<Management> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // drawer: SideMenu(),
      body: SafeArea(
        child: ManagementPanel(),
      ),
    );
  }
}


class ManagementPanel extends StatefulWidget {
  const ManagementPanel({super.key});

  @override
  State<ManagementPanel> createState() => _ManagementPanelState();
}

class _ManagementPanelState extends State<ManagementPanel> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedBgColorCard(
                    tap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => SalesPerson()));
                    },
                      radius: 16,
                      color: Colors.yellowAccent.withOpacity(0.70),
                      child: Column(
                        children: [
                          Container(
                            height: 300,
                              width: 300,
                              child: SvgPicture.asset("assets/icon/team-sales-svgrepo-com.svg")),
                          Text("Sales Person",
                          style: title20Black,)
                        ],
                      )),
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: ElevatedBgColorCard(
                      tap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (builder) => DiscountScreen()));
                      },
                      radius: 16,
                      color: Colors.redAccent,
                      child: Column(
                        children: [
                          Container(
                              height: 300,
                              width: 300,
                              child: SvgPicture.asset("assets/icon/team-sales-svgrepo-com.svg")),
                          Text("Discount",
                            style: title20Black,)
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


