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
import 'package:spyco_shop_management/stock/barcode.dart';
import 'package:spyco_shop_management/stock/view_all_stock.dart';
import 'constants/colors.dart';
import 'constants/text_styles.dart';
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
                child: Container(
                  decoration: BoxDecoration(
                    color:colorSideMenu,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView(
                      children: [
                        Container(
                          height: 100,
                          child: Center(
                            child: Text(
                              "Logo",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 32,
                                color: Colors.white
                              ),
                            ),
                          ),

                        ),
                        // DrawerHeader(
                        //   child: Center(
                        //       child: Icon(Icons.logo_dev_outlined)),
                        // ),
                        DrawerListTile(
                          text:  sidemenTextWhite,
                          title: "Dashboard",
                          svgSrc: "assets/icon/dashboard-svgrepo-com.svg",
                          selectedColor: _index == 0  ? selectedGreenColor : colorSideMenu,
                          svgColor:  Colors.white,
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
                        DrawerListTile(
                          title: "Supplier",
                          svgSrc: "assets/icon/dashboard-svgrepo-com.svg",
                          selectedColor: _index == 1  ? selectedGreenColor : colorSideMenu,
                          text: sidemenTextWhite,
                          svgColor:Colors.white ,
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
                            //       child: MainScreen(),
                            //     ),
                            //   ),
                            // );
                          },
                        ),
                        // DropDownMenu(
                        //   title: 'Supplier',
                        //   color:selectedGreenColor,
                        //   leadingImage: 'assets/icon/box-packed-svgrepo-com.svg',
                        //   child: Column(
                        //     children: [
                        //       // CustomListTile(
                        //       //   selectColor: _index == 1
                        //       //       ? Colors.white
                        //       //       : Colors.transparent,
                        //       //   selectTextColor:
                        //       //       _index == 1 ? Colors.black : Colors.white,
                        //       //   font: _index == 1
                        //       //       ? FontWeight.w600
                        //       //       : FontWeight.w300,
                        //       //   press: () {
                        //       //     setState(() {
                        //       //       _index = 1;
                        //       //     });
                        //       //     // Navigator.push(
                        //       //     //   context,
                        //       //     //   MaterialPageRoute(
                        //       //     //     builder: (context) => MultiProvider(
                        //       //     //       providers: [
                        //       //     //         ChangeNotifierProvider(
                        //       //     //           create: (context) => MenuAppController(),
                        //       //     //         ),
                        //       //     //       ],
                        //       //     //       child: AddSupplier(),
                        //       //     //     ),
                        //       //     //   ),
                        //       //     // );
                        //       //   },
                        //       //   title: "Add supplier",
                        //       // ),
                        //       // CustomListTile(
                        //       //   selectColor: _index == 1
                        //       //       ? Colors.white
                        //       //       : Colors.transparent,
                        //       //   selectTextColor:
                        //       //       _index == 1 ? Colors.black : Colors.white,
                        //       //   font: _index == 2
                        //       //       ? FontWeight.w600
                        //       //       : FontWeight.w300,
                        //       //   press: () {
                        //       //     setState(() {
                        //       //       _index = 2;
                        //       //     });
                        //       //     // Navigator.push(
                        //       //     //   context,
                        //       //     //   MaterialPageRoute(
                        //       //     //     builder: (context) => MultiProvider(
                        //       //     //       providers: [
                        //       //     //         ChangeNotifierProvider(
                        //       //     //           create: (context) => MenuAppController(),
                        //       //     //         ),
                        //       //     //       ],
                        //       //     //       child: SupplierScreen(),
                        //       //     //     ),
                        //       //     //   ),
                        //       //     // );
                        //       //   },
                        //       //   title: "View all supplier",
                        //       // ),
                        //     ],
                        //   ),
                        // ),
                        DropDownMenu(
                          title: 'Purchase',
                          leadingImage: 'assets/icon/square-dollar-chart-svgrepo-com.svg',
                          text:sidemenTextWhite,
                          child: Column(
                            children: [
                              CustomListTile(
                                text: sidemenTextWhite,

                                press: () {
                                  setState(() {
                                    _index = 2;
                                  });
                                },
                                title: "Add Purchase",
                                selectedColor: _index ==  2 ? selectedGreenColor : colorSideMenu,
                              ),
                              CustomListTile(
                                text: sidemenTextWhite,
                                selectedColor:  _index ==  3 ? selectedGreenColor : colorSideMenu,


                                press: () {
                                  setState(() {
                                    _index = 3;
                                  });
                                },
                                title: "View all stock",
                              ),
                              CustomListTile(
                                text: sidemenTextWhite,
                                selectedColor:  _index ==  4 ? selectedGreenColor : colorSideMenu,

                                press: () {
                                  setState(() {
                                    _index = 4;
                                  });

                                },
                                title: "Barcode",
                              ),
                            ],
                          ),
                        ),
                        DrawerListTile(
                          svgColor:
                          Colors.white,
                          title: "Pos",
                          selectedColor: colorSideMenu,
                          text:  sidemenTextWhite ,
                          svgSrc: "assets/icon/card-pos-svgrepo-com.svg",
                          press: () {
                            // setState(() {
                            //   _index = 5;
                            // });
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
                        DrawerListTile(
                          selectedColor:  _index ==  5 ? selectedGreenColor : colorSideMenu,
                          title: "Customer",
                          svgSrc: "assets/icon/dashboard-svgrepo-com.svg",
                          text: sidemenTextWhite,
                          svgColor: Colors.white,

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
                            //       child: MainScreen(),
                            //     ),
                            //   ),
                            // );
                          },
                        ),
                       /* DropDownMenu(
                          title: 'Customer',
                          leadingImage: 'assets/icons/menu_doc.svg',
                          color: selectedGreenColor,
                          child: Column(
                            children: [
                              CustomListTile(
                                selectColor: _index == 7
                                    ? Colors.white
                                    : Colors.transparent,
                                selectTextColor:
                                    _index == 7 ? Colors.black : Colors.white,
                                font: _index == 7
                                    ? FontWeight.w600
                                    : FontWeight.w300,
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
                                  //       child: AddCustomer(),
                                  //     ),
                                  //   ),
                                  // );
                                },
                                title: "Add Customer",
                              ),
                              CustomListTile(
                                selectColor: _index == 8
                                    ? Colors.white
                                    : Colors.transparent,
                                selectTextColor:
                                    _index == 8 ? Colors.black : Colors.white,
                                font: _index == 8
                                    ? FontWeight.w600
                                    : FontWeight.w300,
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
                                  //       child: CustomersScreen(),
                                  //     ),
                                  //   ),
                                  // );
                                },
                                title: "All Customers",
                              ),
                            ],
                          ),
                        ),*/
                        DrawerListTile(
                          selectedColor:  _index ==  6 ? selectedGreenColor : colorSideMenu,
                          title: "Users",
                          svgSrc: "assets/icon/person-square-svgrepo-com.svg",
                          text: sidemenTextWhite,
                          svgColor:  Colors.white ,
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
                          selectedColor:  _index ==  7 ? selectedGreenColor : colorSideMenu,
                          title: "Company profile",
                          svgSrc: "assets/icon/company-svgrepo-com.svg",
                          text: sidemenTextWhite,
                          svgColor:  Colors.white ,

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
                          selectedColor:  _index ==  8 ? selectedGreenColor : colorSideMenu,
                          title: "Management",
                          svgSrc: "assets/icon/dashboard-svgrepo-com.svg",
                          text: sidemenTextWhite,
                          svgColor:  Colors.white,
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
                          selectedColor:  _index ==  9 ? selectedGreenColor : colorSideMenu,
                          title: "CRM",
                          svgSrc: "assets/icon/dashboard-svgrepo-com.svg",
                          text: sidemenTextWhite,
                          svgColor:  Colors.white ,
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
                /*    MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (context) => MenuAppController(),
                        ),
                      ],
                      child: AddSupplier(),
                    ),*/
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
                      child: ViewAllStock(),
                    ),
                    MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (context) => MenuAppController(),
                        ),
                      ],
                      child: Barcode(),
                    ),


                  /*  MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                          create: (context) => MenuAppController(),
                        ),
                      ],
                      child: AddCustomer(),
                    ),*/


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
      required this.text,
    required this.selectedColor,


  });
  final String title;
  final VoidCallback press;
  final TextStyle text;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: selectedColor,
        borderRadius: BorderRadius.circular(12)
      ),
      child: ListTile(
        title: Text(
          title,
          style: text,
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
    required this.svgColor,
    required this.text,
    required this.selectedColor,

    // required this.textColor, required this.selectedIconColor,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final Color svgColor;
  final TextStyle text;
  final Color selectedColor;

  // final Color textColor;
  // final Color selectedIconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: selectedColor,
          borderRadius: BorderRadius.circular(12)
      ),

      child: ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(
            svgSrc,
            color: svgColor,
            // height: 16,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            title,
            style: text,
          ),
        ),
      ),
    );
  }
}

class DropDownMenu extends StatefulWidget {
  final String title,
      leadingImage;
  final Widget child;
  final TextStyle text;


  const DropDownMenu(
      {super.key,
      required this.title,
      required this.child,
      required this.leadingImage,
        required this.text,
      });

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return Container(
          child: ExpansionTile(
            expandedAlignment: Alignment.centerLeft,

            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    widget.leadingImage,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Text(widget.title, style: widget.text),
              ],
            ),
            trailing: isExpanded
                ? Image.asset(
                    'assets/images/dropdown reverse.png',
                    height: 16,
                    color: unSelectedMenuTextColor,
                  )
                : Image.asset(
                    'assets/images/dropdown.png',
                    height: 16,
                    color: unSelectedMenuTextColor,
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
    );
  }
}
