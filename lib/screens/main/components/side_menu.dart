// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
// import 'package:spyco_shop_management/constants/colors.dart';
// import 'package:spyco_shop_management/controllers/MenuAppController.dart';
// import 'package:spyco_shop_management/sales/add_customer.dart';
// import 'package:spyco_shop_management/sales/customers.dart';
// import 'package:spyco_shop_management/screens/company_profile.dart';
// import 'package:spyco_shop_management/screens/main/main_screen.dart';
// import 'package:spyco_shop_management/screens/supplier/add_supplier.dart';
// import 'package:spyco_shop_management/screens/supplier/supplier.dart';
// import 'package:spyco_shop_management/screens/users/users.dart';
// import 'package:spyco_shop_management/stock/add_stock.dart';
// import 'package:spyco_shop_management/users.dart';
//
// import '../../../dashboard.dart';
// import '../../../pos/invoice.dart';
//
// class SideMenu extends StatefulWidget {
//   const SideMenu({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<SideMenu> createState() => _SideMenuState();
// }
//
// class _SideMenuState extends State<SideMenu> {
//   bool _isMenuOpen = false;
//
//   void toggleMenu() {
//     setState(() {
//       _isMenuOpen = !_isMenuOpen;
//     });
//   }
//
//
//   int _index = 0;
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8.0,top: 8,bottom: 8),
//       child: Container(
//     decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(22),
//           color: Colors.black,
//         ),
//         child: Drawer(
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(22),
//               color: Colors.black,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: ListView(
//                 children: [
//                   DrawerHeader(
//                     child: Center(
//                       child: Text(
//                         "Our Logo",
//                         style: TextStyle(color: Colors.white, fontSize: 30),
//                       ),
//                     ),
//                   ),
//                   DrawerListTile(
//                     title: "Dashboard",
//                     svgSrc: "assets/icons/menu_dashboard.svg",
//                     color: Colors.black,
//                     press: () {
//                       setState(() {
//                         _index = 0;
//                       });
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => MultiProvider(
//                             providers: [
//                               ChangeNotifierProvider(
//                                 create: (context) => MenuAppController(),
//                               ),
//                             ],
//                             child: MainScreen(),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   DropDownMenu(
//                     title: 'Supplier',
//                     color: Colors.black,
//                     leadingImage: 'assets/icons/menu_tran.svg',
//                     child: Column(
//                       children: [
//                         CustomListTile(
//                           color: _index == 1 ? Colors.red: Colors.yellow,
//                           press: () {
//                             setState(() {
//                               _index = 1;
//                             });
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => MultiProvider(
//                                   providers: [
//                                     ChangeNotifierProvider(
//                                       create: (context) => MenuAppController(),
//                                     ),
//                                   ],
//                                   child: AddSupplier(),
//                                 ),
//                               ),
//                             );
//                           },
//                           title: "Add supplier",
//                         ),
//                         CustomListTile(
//                           color: Colors.black,
//                           press: () {
//                             setState(() {});
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => MultiProvider(
//                                   providers: [
//                                     ChangeNotifierProvider(
//                                       create: (context) => MenuAppController(),
//                                     ),
//                                   ],
//                                   child: SupplierScreen(),
//                                 ),
//                               ),
//                             );
//                           },
//                           title: "View all supplier",
//                         ),
//                       ],
//                     ),
//                   ),
//                   DropDownMenu(
//                     title: 'Purchase',
//                     leadingImage: 'assets/icons/menu_doc.svg',
//                     color: Colors.black,
//                     child: Column(
//                       children: [
//                         CustomListTile(
//                           color: Colors.black,
//                           press: () {
//                             setState(() {
//                               _index = 2;
//                             });
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => MultiProvider(
//                                   providers: [
//                                     ChangeNotifierProvider(
//                                       create: (context) => MenuAppController(),
//                                     ),
//                                   ],
//                                   child: AddStock(),
//                                 ),
//                               ),
//                             );
//                           },
//                           title: "Add Purchase",
//                         ),
//                         CustomListTile(
//                           color: Colors.black,
//                           press: () {},
//                           title: "View all stock",
//                         ),
//                       ],
//                     ),
//                   ),
//                   DrawerListTile(
//                     color: Colors.black,
//                     title: "Pos",
//                     svgSrc: "assets/icons/menu_dashboard.svg",
//                     press: () {
//                       setState(() {
//                         _index = 1;
//                       });
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => MultiProvider(
//                             providers: [
//                               ChangeNotifierProvider(
//                                 create: (context) => MenuAppController(),
//                               ),
//                             ],
//                             child: Invoice(),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   // DropDownMenu(
//                   //   title: 'Customer',
//                   //   leadingImage: 'assets/icons/menu_doc.svg',
//                   //   color: _index == 4 ? Colors.red: Colors.yellow,
//                   //   child: Column(
//                   //     children: [
//                   //       CustomListTile(
//                   //         color: Colors.black,
//                   //         press: () {
//                   //           setState(() {
//                   //             _index = 4;
//                   //           });
//                   //           Navigator.push(
//                   //             context,
//                   //             MaterialPageRoute(
//                   //               builder: (context) => MultiProvider(
//                   //                 providers: [
//                   //                   ChangeNotifierProvider(
//                   //                     create: (context) => MenuAppController(),
//                   //                   ),
//                   //                 ],
//                   //                 child: AddCustomer(),
//                   //               ),
//                   //             ),
//                   //           );
//                   //         },
//                   //         title: "Add Customer",
//                   //       ),
//                   //       CustomListTile(
//                   //         color: Colors.black,
//                   //         press: () {
//                   //           Navigator.push(
//                   //             context,
//                   //             MaterialPageRoute(
//                   //               builder: (context) => MultiProvider(
//                   //                 providers: [
//                   //                   ChangeNotifierProvider(
//                   //                     create: (context) => MenuAppController(),
//                   //                   ),
//                   //                 ],
//                   //                 child: CustomersScreen(),
//                   //               ),
//                   //             ),
//                   //           );
//                   //         },
//                   //         title: "All Customers",
//                   //       ),
//                   //     ],
//                   //   ),
//                   // ),
//                   DrawerListTile(
//                     title: "Users",
//                     svgSrc: "assets/icons/menu_profile.svg",
//                     color: Colors.black,
//                     press: () {
//                       setState(() {
//                         _index == 2;
//
//                       });
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => MultiProvider(
//                             providers: [
//                               ChangeNotifierProvider(
//                                 create: (context) => MenuAppController(),
//                               ),
//                             ],
//                             child: Users(),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   DrawerListTile(
//                     title: "Company profile",
//                     svgSrc: "assets/icons/menu_setting.svg",
//                     color: Colors.black,
//                     press: () {
//                       setState(() {
//                         _index == 3;
//                       });
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => MultiProvider(
//                             providers: [
//                               ChangeNotifierProvider(
//                                 create: (context) => MenuAppController(),
//                               ),
//                             ],
//                             child: CompanyProfile(),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   // DrawerListTile(
//                   //   title: "Settings",
//                   //   svgSrc: "assets/icons/menu_setting.svg",
//                   //   press: () {},
//                   //   color: Colors.black,
//                   //   textColor: Colors.white, selectedIconColor: Colors.white,
//                   // ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//
//     );
//   }
// }
//
// // class CustomListTile extends StatelessWidget {
// //   const CustomListTile({super.key,
// //     required this.title,
// //     required this.press,
// //     required this.color});
// //   final String title;
// //   final VoidCallback press;
// //   final Color color;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       color: color,
// //       child: ListTile(
// //         title: Text(
// //           title,
// //           style: TextStyle(color:Colors.white),
// //         ),
// //         onTap: press,
// //       ),
// //     );
// //   }
// // }
// //
// // class DrawerListTile extends StatelessWidget {
// //   const DrawerListTile({
// //     Key? key,
// //     // For selecting those three line once press "Command+D"
// //     required this.title,
// //     required this.svgSrc,
// //     required this.press,
// //     required this.color,
// //     // required this.textColor, required this.selectedIconColor,
// //   }) : super(key: key);
// //
// //   final String title, svgSrc;
// //   final VoidCallback press;
// //   final Color color;
// //   // final Color textColor;
// //   // final Color selectedIconColor;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return ListTile(
// //       onTap: press,
// //       horizontalTitleGap: 0.0,
// //       leading: SvgPicture.asset(
// //         svgSrc,
// //         color: Colors.white,
// //         height: 16,
// //       ),
// //       title: Padding(
// //         padding: const EdgeInsets.only(left: 8.0),
// //         child: Text(
// //           title,
// //           style: TextStyle(
// //           color: Colors.white,
// //          ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class DropDownMenu extends StatefulWidget {
// //   final String title,
// //       leadingImage;
// //   final Widget child;
// //   final Color color;
// //   const DropDownMenu(
// //       {super.key,
// //       required this.title,
// //       required this.child,
// //       required this.leadingImage, required this.color});
// //
// //   @override
// //   State<DropDownMenu> createState() => _DropDownMenuState();
// // }
// //
// // class _DropDownMenuState extends State<DropDownMenu> {
// //   bool isExpanded = false;
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       color:widget.color,
// //       child: ExpansionTile(
// //         expandedAlignment: Alignment.centerLeft,
// //
// //         title: Row(
// //           children: [
// //             SvgPicture.asset(
// //               widget.leadingImage,
// //               colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
// //             ),
// //             SizedBox(
// //               width: 20,
// //             ),
// //             Text(widget.title, style: TextStyle(color: Colors.white)),
// //           ],
// //         ),
// //         trailing: isExpanded
// //             ? Image.asset(
// //                 'assets/images/dropdown reverse.png',
// //                 height: 16,
// //           color: sideMenuTextColor,
// //               )
// //             : Image.asset(
// //                 'assets/images/dropdown.png',
// //                 height: 16,
// //           color: sideMenuTextColor,
// //               ),
// //         onExpansionChanged: (bool expanded) {
// //           setState(() => isExpanded = expanded);
// //         },
// //
// //         childrenPadding: EdgeInsets.only(left: 30), //children padding
// //         children: [
// //           widget.child,
// //
// //           //more child menu
// //         ],
// //       ),
// //     );
// //   }
// // }
