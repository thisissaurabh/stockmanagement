//
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:spyco_shop_management/constants/colors.dart';
// import 'package:spyco_shop_management/constants/responsive.dart';
// import 'package:spyco_shop_management/constants/textfield_decoration.dart';
// import 'package:spyco_shop_management/constants/textstyle.dart';
// import 'package:spyco_shop_management/controllers/MenuAppController.dart';
// import 'package:spyco_shop_management/screens/dashboard/components/header.dart';
// import 'package:spyco_shop_management/screens/main/components/side_menu.dart';
// import 'package:spyco_shop_management/widgets/cards.dart';
// import 'package:spyco_shop_management/widgets/custom_data_list.dart';
// import 'package:spyco_shop_management/widgets/global_widgets.dart';
// import 'package:spyco_shop_management/widgets/globals.dart';
// import 'package:spyco_shop_management/widgets/intraction_buttons.dart';
// import 'package:spyco_shop_management/widgets/main_button.dart';
//
// class Users extends StatefulWidget {
//   const Users({super.key});
//
//   @override
//   State<Users> createState() => _UsersState();
// }
//
// class _UsersState extends State<Users> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       key: context.read<MenuAppController>().scaffoldKey,
//       drawer: SideMenu(),
//       body: SafeArea(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // We want this side menu only for large screen
//             if (Responsive.isDesktop(context))
//               Expanded(
//                 // default flex = 1
//                 // and it takes 1/6 part of the screen
//                 child: SideMenu(),
//               ),
//             Expanded(
//               // It takes 5/6 part of the screen
//               flex: 5,
//               child: AllUsersList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// class AllUsersList extends StatefulWidget {
//   const AllUsersList({super.key});
//
//   @override
//   State<AllUsersList> createState() => _AllUsersListState();
// }
//
// class _AllUsersListState extends State<AllUsersList> {
//
//   List<String> saleType = ["1","2","3","4""5","6","7","8","9","10"];
//   List <String>partyName = ["95959595", "95959595","95959595", "95959595","95959595", "95959595","95959595", "95959595","95959595", "95959595",];
//   List <String>date = ["saurabh","saurabh","saurabh","saurabh","saurabh","saurabh","saurabh","saurabh","saurabh","saurabh",];
//   List <String> amount = ["xyz collections","xyz collections","xyz collections","xyz collections","xyz collections","xyz collections","xyz collections","xyz collections","xyz collections","xyz collections",];
//   List item = ["xyz collections","xyz collections","xyz collections","xyz collections","xyz collections","xyz collections","xyz collections","xyz collections","xyz collections","xyz collections",];
//   List<String> image = ["assets/images/profile_pic.png","assets/images/profile_pic.png","assets/images/profile_pic.png","assets/images/profile_pic.png","assets/images/profile_pic.png","assets/images/profile_pic.png","assets/images/profile_pic.png","assets/images/profile_pic.png","assets/images/profile_pic.png","assets/images/profile_pic.png",];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Header(title: "All Users"),
//             SizedBox(height: 5,),
//             CustomHorizontalLine(),
//             SizedBox(height: 16,),
//             SizedBox(height: 20,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 AddButtonWithText(),
//               ],
//             ),
//         SizedBox(height: 10,),
//
//         ElevatedBgCard(
//           radius: 0.0,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Column(
//                 children: [
//                   Container(
//                     color: selectedColor
//                         .withOpacity(0.40),
//                     child: Padding(
//                       padding:
//                       const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Expanded(
//                             flex:1,
//                             child: Center(
//                               child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   "S.no",
//                                   style: nameTextGrey,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex:2,
//                             child: Center(
//                               child: Text(
//                                 "Id",
//                                 style: nameTextGrey,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex:2,
//                             child: Center(
//                               child: Text(
//                                 "photo",
//                                 style: nameTextGrey,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex:2,
//                             child: Center(
//                               child: Text(
//                                 "Name",
//                                 style: nameTextGrey,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex:2,
//                             child: Center(
//                               child: Text(
//                                 "Store",
//                                 style: nameTextGrey,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex:2,
//                             child: Center(
//                               child: Text(
//                                 "Role",
//                                 style: nameTextGrey,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex:2,
//                             child: Center(
//                               child: Text(
//                                 "Actions",
//                                 style: nameTextGrey,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ), ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   // CustomHorizontalLine(),
//                   ListView.separated(
//                     itemCount: saleType.length,
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemBuilder: (_, i) {
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Expanded(
//                               flex:1,
//                               child: Center(
//                                 child: Align(
//                                   alignment: Alignment.centerLeft,
//                                   child: Text(
//
//                                     saleType[i],
//                                     style: listName,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex:2,
//                               child: Center(
//                                 child: Text(
//                                   partyName[i],
//                                   style: listName,
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex:2,
//                               child: Container(
//                                 height: 60,
//                                 width: 60,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.grey.shade200,
//                                 ),
//                                 clipBehavior: Clip.hardEdge,
//                                 child: CachedNetworkImage(
//                                   imageUrl: image[i],
//                                   fit: BoxFit.cover,
//                                   errorWidget: (context, url, error) =>
//                                       Image.asset(
//                                           "assets/images/profile_pic.png",fit: BoxFit.contain,),
//                                   progressIndicatorBuilder: (a, b, c) =>
//                                       Opacity(
//                                         opacity: 0.3,
//                                         child: Shimmer.fromColors(
//                                           baseColor: Colors.black12,
//                                           highlightColor: Colors.white,
//                                           child: Container(
//                                             width: 50,
//                                             height: 50,
//                                             //margin: EdgeInsets.symmetric(horizontal: 24),
//                                             decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 shape: BoxShape.circle),
//                                           ),
//                                         ),
//                                       ),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex:2,
//                               child: Center(
//                                 child: Text(
//                                   date[i],
//                                   style: listName,
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex:2,
//                               child: Center(
//                                 child: Text(
//                                   item[i],
//                                   style: listName,
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex:2,
//                               child: Center(
//                                 child: Text(
//                                   amount[i],
//                                   style: listName,
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex:2,
//                               child: Center(
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     SvgPicture.asset("assets/images/edit-user-6-svgrepo-com.svg"),
//                                     SizedBox(width: 10,),
//                                     SvgPicture.asset("assets/images/delete-alt-2-svgrepo-com.svg")
//                                   ],
//                                 ),
//                               )
//                             ),
//                           ],
//                         ),
//                       );
//                     }, separatorBuilder: (BuildContext context, int index) =>
//                       CustomHorizontalLine(),
//                   )
//
//                 ],
//               ),
//             ],
//           ),
//         ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
