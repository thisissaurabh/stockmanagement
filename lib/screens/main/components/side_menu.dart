import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/controllers/MenuAppController.dart';
import 'package:spyco_shop_management/sales/add_customer.dart';
import 'package:spyco_shop_management/sales/customers.dart';
import 'package:spyco_shop_management/screens/company_profile.dart';
import 'package:spyco_shop_management/screens/main/main_screen.dart';
import 'package:spyco_shop_management/screens/supplier/add_supplier.dart';
import 'package:spyco_shop_management/screens/supplier/supplier.dart';
import 'package:spyco_shop_management/screens/users/users.dart';
import 'package:spyco_shop_management/users.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  bool _isMenuOpen = false;

  void toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      // backgroundColor: AppColors.mainBlueColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Text(
                "Our Logo",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiProvider(
                    providers: [
                      ChangeNotifierProvider(
                        create: (context) => MenuAppController(),
                      ),
                    ],
                    child: MainScreen(),
                  ),
                ),
              );
            },
          ),

          // DrawerListTile(
          //   title: "product catelog",
          //   svgSrc: "assets/icons/menu_task.svg",
          //   press: () {},
          // ),
          DropDownMenu(
            title: 'Supplier',
            leadingImage: 'assets/icons/menu_tran.svg',
            child: Column(
              children: [
                CustomListTile(
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MultiProvider(
                        providers: [
                          ChangeNotifierProvider(
                            create: (context) => MenuAppController(),
                          ),
                        ],
                        child: AddSupplier(),
                      ),
                    ),
                  ),
                  title: "Add supplier",
                ),
                CustomListTile(
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MultiProvider(
                        providers: [
                          ChangeNotifierProvider(
                            create: (context) => MenuAppController(),
                          ),
                        ],
                        child: SupplierScreen(),
                      ),
                    ),
                  ),
                  title: "View all supplier",
                ),
              ],
            ),
          ),

          // DrawerListTile(
          //   title: "Stock",
          //   svgSrc: "assets/icons/menu_doc.svg",
          //   press: () {},
          // ),
          DropDownMenu(
            title: 'Stock',
            leadingImage: 'assets/icons/menu_doc.svg',
            child: Column(
              children: [
                CustomListTile(
                  press: () {},
                  title: "Add stock",
                ),
                CustomListTile(
                  press: () {},
                  title: "View all stock",
                ),
                CustomListTile(
                  press: () {},
                  title: "Category 3",
                )
              ],
            ),
          ),
          DropDownMenu(
            title: 'Customer',
            leadingImage: 'assets/icons/menu_doc.svg',
            child: Column(
              children: [
                CustomListTile(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MultiProvider(
                          providers: [
                            ChangeNotifierProvider(
                              create: (context) => MenuAppController(),
                            ),
                          ],
                          child: AddCustomer(),
                        ),
                      ),
                    );
                  },
                  title: "Add Customer",
                ),
                CustomListTile(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MultiProvider(
                          providers: [
                            ChangeNotifierProvider(
                              create: (context) => MenuAppController(),
                            ),
                          ],
                          child: CustomersScreen(),
                        ),
                      ),
                    );
                  },
                  title: "All Customers",
                ),
                // CustomListTile(
                //   press: () {},
                //   title: "Category 3",
                // )
              ],
            ),
          ),
          // DrawerListTile(
          //   title: "Sales",
          //   svgSrc: "assets/icons/menu_store.svg",
          //   press: () {},
          // ),
          // DrawerListTile(
          //   title: "Lead management",
          //   svgSrc: "assets/icons/menu_notification.svg",
          //   press: () {},
          // ),
          DrawerListTile(
            title: "Users",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiProvider(
                    providers: [
                      ChangeNotifierProvider(
                        create: (context) => MenuAppController(),
                      ),
                    ],
                    child: Users(),
                  ),
                ),
              );
            },
          ),
          DrawerListTile(
            title: "Company profile",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiProvider(
                    providers: [
                      ChangeNotifierProvider(
                        create: (context) => MenuAppController(),
                      ),
                    ],
                    child: CompanyProfile(),
                  ),
                ),
              );
            },
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.title, required this.press});
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      onTap: press,
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
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class DropDownMenu extends StatefulWidget {
  final String title, leadingImage;
  final Widget child;
  const DropDownMenu(
      {super.key,
      required this.title,
      required this.child,
      required this.leadingImage});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedAlignment: Alignment.centerLeft,

      title: Row(
        children: [
          SvgPicture.asset(
            widget.leadingImage,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          SizedBox(
            width: 20,
          ),
          Text(widget.title, style: TextStyle(color: Colors.white)),
        ],
      ),
      trailing: isExpanded
          ? Image.asset(
              'assets/images/dropdown reverse.png',
              height: 16,
            )
          : Image.asset(
              'assets/images/dropdown.png',
              height: 16,
            ),
      onExpansionChanged: (bool expanded) {
        setState(() => isExpanded = expanded);
      },

      childrenPadding: EdgeInsets.only(left: 30), //children padding
      children: [
        widget.child,

        //more child menu
      ],
    );
  }
}
