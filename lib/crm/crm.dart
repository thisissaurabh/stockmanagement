

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:spyco_shop_management/widgets/cards.dart';
import '../constants/text_styles.dart';
import '../controllers/MenuAppController.dart';
import 'add_voucher.dart';


class Crm extends StatefulWidget {
  const Crm({super.key});

  @override
  State<Crm> createState() => _CrmState();
}

class _CrmState extends State<Crm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // drawer: SideMenu(),
      body: SafeArea(
        child: CrmPanel(),
      ),
    );;
  }
}
class CrmPanel extends StatefulWidget {
  const CrmPanel({super.key});

  @override
  State<CrmPanel> createState() => _CrmPanelState();
}

class _CrmPanelState extends State<CrmPanel> {
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
                      radius: 16,
                      color: Colors.yellowAccent.withOpacity(0.70),
                      child: Column(
                        children: [
                          Container(
                              height: 300,
                              width: 300,
                              child: SvgPicture.asset("assets/icon/coins-money-svgrepo-com.svg")),
                          Text("Points System",
                            style: title20Black,)
                        ],
                      )),
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MultiProvider(
                            providers: [
                              ChangeNotifierProvider(
                                create: (context) => MenuAppController(),
                              ),
                            ],
                            child: AddVoucher(),
                          ),
                        ),
                      );
                    },
                    child: ElevatedBgColorCard(
                        radius: 16,
                        color: Colors.redAccent,
                        child: Column(
                          children: [
                            Container(
                                height: 300,
                                width: 300,
                                child: SvgPicture.asset("assets/icon/voucher-coupon-svgrepo-com.svg"),
                            ),
                            Text("Voucher",
                              style: title20Black,),
                          ],
                        )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



