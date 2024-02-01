import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:spyco_shop_management/management/management.dart';
import 'package:spyco_shop_management/pos/invoice.dart';
import 'package:spyco_shop_management/sales/add_customer.dart';
import 'package:spyco_shop_management/sales/customers.dart';
import 'package:spyco_shop_management/screens/company_profile.dart';
import 'package:spyco_shop_management/screens/main/components/side_menu.dart';
import 'package:spyco_shop_management/screens/main/main_screen.dart';
import 'package:spyco_shop_management/screens/supplier/add_supplier.dart';
import 'package:spyco_shop_management/screens/supplier/supplier.dart';
import 'package:spyco_shop_management/screens/users/users.dart';
import 'package:spyco_shop_management/stock/add_stock.dart';
import 'constants/colors.dart';
import 'controllers/MenuAppController.dart';
import 'crm/crm.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        color: Colors.transparent,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color:Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListView(
                        children: [
                          DrawerHeader(
                            child: Center(
                                child: Image.asset(
                                    "assets/images/Logo final.jpg")),
                          ),
                          DrawerListTile(
                            title: "Dashboard",
                            svgSrc: "assets/icon/dashboard-svgrepo-com.svg",
                            color: Colors.black,
                            iconColor:
                                _index == 0 ? selectedColor : Colors.black,
                            svgColor: _index == 0 ? Colors.black : Colors.white,
                            selectColor:
                                _index == 0 ? Colors.white : Colors.transparent,
                            selectTextColor:
                                _index == 0 ? Colors.black : Colors.white,
                            font:
                                _index == 0 ? FontWeight.w600 : FontWeight.w300,
                            press: () {
                              setState(() {
                                _index = 0;
                              });
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => MultiProvider(
                              //       providers: [
                              //         ChangeNotifierProvider(
                              //           create: (context) => MenuAppController(),
                              //         ),
                              //       ],
                              //       child: MainScreen(),
                              //     ),
                              //   ),
                              // );
                            },
                          ),
                          DropDownMenu(
                            title: 'Supplier',
                            color: Colors.black,
                            iconColor: Colors.black,
                            leadingImage: 'assets/icon/box-packed-svgrepo-com.svg',
                            child: Column(
                              children: [
                                CustomListTile(
                                  selectColor: _index == 1
                                      ? Colors.white
                                      : Colors.transparent,
                                  selectTextColor:
                                      _index == 1 ? Colors.black : Colors.white,
                                  font: _index == 1
                                      ? FontWeight.w600
                                      : FontWeight.w300,
                                  press: () {
                                    setState(() {
                                      _index = 1;
                                    });
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => MultiProvider(
                                    //       providers: [
                                    //         ChangeNotifierProvider(
                                    //           create: (context) => MenuAppController(),
                                    //         ),
                                    //       ],
                                    //       child: AddSupplier(),
                                    //     ),
                                    //   ),
                                    // );
                                  },
                                  title: "Add supplier",
                                ),
                                CustomListTile(
                                  selectColor: _index == 2
                                      ? Colors.white
                                      : Colors.transparent,
                                  selectTextColor:
                                      _index == 2 ? Colors.black : Colors.white,
                                  font: _index == 2
                                      ? FontWeight.w600
                                      : FontWeight.w300,
                                  press: () {
                                    setState(() {
                                      _index = 2;
                                    });
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => MultiProvider(
                                    //       providers: [
                                    //         ChangeNotifierProvider(
                                    //           create: (context) => MenuAppController(),
                                    //         ),
                                    //       ],
                                    //       child: SupplierScreen(),
                                    //     ),
                                    //   ),
                                    // );
                                  },
                                  title: "View all supplier",
                                ),
                              ],
                            ),
                          ),
                          DropDownMenu(
                            title: 'Purchase',
                            leadingImage: 'assets/icon/square-dollar-chart-svgrepo-com.svg',
                            color: Colors.black,
                            iconColor: Colors.black,
                            child: Column(
                              children: [
                                CustomListTile(
                                  selectColor: _index == 3
                                      ? Colors.white
                                      : Colors.transparent,
                                  selectTextColor:
                                      _index == 3 ? Colors.black : Colors.white,
                                  font: _index == 3
                                      ? FontWeight.w600
                                      : FontWeight.w300,
                                  press: () {
                                    setState(() {
                                      _index = 3;
                                    });
                                  },
                                  title: "Add Purchase",
                                ),
                                CustomListTile(
                                  selectColor: Colors.black,
                                  selectTextColor: Colors.white,
                                  font: FontWeight.w600,
                                  press: () {},
                                  title: "View all stock",
                                ),
                              ],
                            ),
                          ),
                          DrawerListTile(
                            color: Colors.black,
                            selectTextColor:
                                Colors.white ,
                            svgColor:
                             Colors.white,
                            title: "Pos",
                            svgSrc: "assets/icon/card-pos-svgrepo-com.svg",
                            iconColor:
                                 Colors.black,
                            selectColor:
                                Colors.black ,
                            font:
                                FontWeight.w600 ,
                            press: () {
                              setState(() {
                                _index = 4;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MultiProvider(
                                    providers: [
                                      ChangeNotifierProvider(
                                        create: (context) => MenuAppController(),
                                      ),
                                    ],
                                    child: Invoice(),
                                  ),
                                ),
                              );
                            },
                          ),
                          DropDownMenu(
                            title: 'Customer',
                            leadingImage: 'assets/icons/menu_doc.svg',
                            color: Colors.black,
                            iconColor: Colors.black,
                            child: Column(
                              children: [
                                CustomListTile(
                                  selectColor: _index == 4
                                      ? Colors.white
                                      : Colors.transparent,
                                  selectTextColor:
                                      _index == 4 ? Colors.black : Colors.white,
                                  font: _index == 4
                                      ? FontWeight.w600
                                      : FontWeight.w300,
                                  press: () {
                                    setState(() {
                                      _index = 4;
                                    });
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => MultiProvider(
                                    //       providers: [
                                    //         ChangeNotifierProvider(
                                    //           create: (context) => MenuAppController(),
                                    //         ),
                                    //       ],
                                    //       child: AddCustomer(),
                                    //     ),
                                    //   ),
                                    // );
                                  },
                                  title: "Add Customer",
                                ),
                                CustomListTile(
                                  selectColor: _index == 5
                                      ? Colors.white
                                      : Colors.transparent,
                                  selectTextColor:
                                      _index == 5 ? Colors.black : Colors.white,
                                  font: _index == 5
                                      ? FontWeight.w600
                                      : FontWeight.w300,
                                  press: () {
                                    setState(() {
                                      _index = 5;
                                    });
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => MultiProvider(
                                    //       providers: [
                                    //         ChangeNotifierProvider(
                                    //           create: (context) => MenuAppController(),
                                    //         ),
                                    //       ],
                                    //       child: CustomersScreen(),
                                    //     ),
                                    //   ),
                                    // );
                                  },
                                  title: "All Customers",
                                ),
                              ],
                            ),
                          ),
                          DrawerListTile(
                            title: "Users",
                            svgSrc: "assets/icon/person-square-svgrepo-com.svg",
                            iconColor:
                                _index == 6 ? selectedColor : Colors.black,
                            color: Colors.black,
                            selectTextColor:
                                _index == 6 ? Colors.black : Colors.white,
                            selectColor:
                                _index == 6 ? Colors.white : Colors.transparent,
                            svgColor: _index == 6 ? Colors.black : Colors.white,
                            font:
                                _index == 6 ? FontWeight.w600 : FontWeight.w300,
                            press: () {
                              setState(() {
                                _index = 6;
                              });
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => MultiProvider(
                              //       providers: [
                              //         ChangeNotifierProvider(
                              //           create: (context) => MenuAppController(),
                              //         ),
                              //       ],
                              //       child: Users(),
                              //     ),
                              //   ),
                              // );
                            },
                          ),
                          DrawerListTile(
                            title: "Company profile",
                            svgSrc: "assets/icon/company-svgrepo-com.svg",
                            color: Colors.black,
                            iconColor:
                                _index == 7 ? selectedColor : Colors.black,
                            selectTextColor:
                                _index == 7 ? Colors.black : Colors.white,
                            selectColor:
                                _index == 7 ? Colors.white : Colors.transparent,
                            svgColor: _index == 7 ? Colors.black : Colors.white,
                            font:
                                _index == 7 ? FontWeight.w600 : FontWeight.w300,
                            press: () {
                              setState(() {
                                _index = 7;
                              });
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => MultiProvider(
                              //       providers: [
                              //         ChangeNotifierProvider(
                              //           create: (context) => MenuAppController(),
                              //         ),
                              //       ],
                              //       child: CompanyProfile(),
                              //     ),
                              //   ),
                              // );
                            },
                          ),

                          DrawerListTile(
                            title: "Management",
                            svgSrc: "assets/icon/dashboard-svgrepo-com.svg",
                            color: Colors.black,
                            iconColor:
                            _index == 8 ? selectedColor : Colors.black,
                            svgColor: _index == 8 ? Colors.black : Colors.white,
                            selectColor:
                            _index == 8 ? Colors.white : Colors.transparent,
                            selectTextColor:
                            _index == 8 ? Colors.black : Colors.white,
                            font:
                            _index == 8 ? FontWeight.w600 : FontWeight.w300,
                            press: () {
                              setState(() {
                                _index = 8;
                              });
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => MultiProvider(
                              //       providers: [
                              //         ChangeNotifierProvider(
                              //           create: (context) => MenuAppController(),
                              //         ),
                              //       ],
                              //       child: MainScreen(),
                              //     ),
                              //   ),
                              // );
                            },
                          ),
                          DrawerListTile(
                            title: "CRM",
                            svgSrc: "assets/icon/dashboard-svgrepo-com.svg",
                            color: Colors.black,
                            iconColor:
                            _index == 9 ? selectedColor : Colors.black,
                            svgColor: _index == 9 ? Colors.black : Colors.white,
                            selectColor:
                            _index == 9 ? Colors.white : Colors.transparent,
                            selectTextColor:
                            _index == 9 ? Colors.black : Colors.white,
                            font:
                            _index == 9 ? FontWeight.w600 : FontWeight.w300,
                            press: () {
                              setState(() {
                                _index = 9;
                              });
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => MultiProvider(
                              //       providers: [
                              //         ChangeNotifierProvider(
                              //           create: (context) => MenuAppController(),
                              //         ),
                              //       ],
                              //       child: MainScreen(),
                              //     ),
                              //   ),
                              // );
                            },
                          ),
                          // DrawerListTile(
                          //   title: "Settings",
                          //   svgSrc: "assets/icons/menu_setting.svg",
                          //   press: () {},
                          //   color: Colors.black,
                          //   textColor: Colors.white, selectedIconColor: Colors.white,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: [
                    MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (context) => MenuAppController(),
                        ),
                      ],
                      child: MainScreen(),
                    ),
                    MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (context) => MenuAppController(),
                        ),
                      ],
                      child: AddSupplier(),
                    ),
                    MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (context) => MenuAppController(),
                        ),
                      ],
                      child: SupplierScreen(),
                    ),
                    MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (context) => MenuAppController(),
                        ),
                      ],
                      child: AddStock(),
                    ),

                    MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (context) => MenuAppController(),
                        ),
                      ],
                      child: AddCustomer(),
                    ),
                    MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (context) => MenuAppController(),
                        ),
                      ],
                      child: CustomersScreen(),
                    ),
                    MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (context) => MenuAppController(),
                        ),
                      ],
                      child: Users(),
                    ),
                    MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (context) => MenuAppController(),
                        ),
                      ],
                      child: CompanyProfile(),
                    ),
                    MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (context) => MenuAppController(),
                        ),
                      ],
                      child: Management(),
                    ),
                    MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (context) => MenuAppController(),
                        ),
                      ],
                      child: Crm(),
                    ),
                  ].elementAt(_index),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
      required this.title,
      required this.press,
      required this.selectColor,
      required this.selectTextColor,
      required this.font
  });
  final String title;
  final VoidCallback press;
  final Color selectColor;
  final Color selectTextColor;
  final FontWeight font;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: selectColor, borderRadius: BorderRadius.circular(30)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: selectTextColor, fontWeight: font),
        ),
        onTap: press,
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.color,
    required this.iconColor,
    required this.selectColor,
    required this.selectTextColor,
    required this.svgColor,
    required this.font,
    // required this.textColor, required this.selectedIconColor,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final Color color;
  final Color iconColor;
  final Color svgColor;
  final Color selectColor;
  final Color selectTextColor;
  final FontWeight font;

  // final Color textColor;
  // final Color selectedIconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: selectColor, borderRadius: BorderRadius.circular(30)),
      child: ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: Container(
          height: 38,
          width: 38,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: iconColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(
              svgSrc,
              color: svgColor,
              // height: 16,
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            title,
            style: TextStyle(color: selectTextColor, fontWeight: font),
          ),
        ),
      ),
    );
  }
}

class DropDownMenu extends StatefulWidget {
  final String title, leadingImage;
  final Widget child;
  final Color color;
  final Color iconColor;

  const DropDownMenu(
      {super.key,
      required this.title,
      required this.child,
      required this.leadingImage,
      required this.color,
      required this.iconColor});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      child: ExpansionTile(
        expandedAlignment: Alignment.centerLeft,

        title: Row(
          children: [
            Container(
              height: 38,
              width: 38,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.iconColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  widget.leadingImage,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Text(widget.title, style: TextStyle(color: Colors.white)),
          ],
        ),
        trailing: isExpanded
            ? Image.asset(
                'assets/images/dropdown reverse.png',
                height: 16,
                color: sideMenuTextColor,
              )
            : Image.asset(
                'assets/images/dropdown.png',
                height: 16,
                color: sideMenuTextColor,
              ),
        onExpansionChanged: (bool expanded) {
          setState(() => isExpanded = expanded);
        },

        childrenPadding: EdgeInsets.only(left: 30),
        //children padding
        children: [
          widget.child,

          //more child menu
        ],
      ),
    );
  }
}
