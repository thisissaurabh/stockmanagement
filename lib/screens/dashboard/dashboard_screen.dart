


import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:spyco_shop_management/api_models/login_model.dart';
import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/constants/responsive.dart';
import 'package:spyco_shop_management/constants/shared_prefs.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';
import 'package:spyco_shop_management/screens/dashboard/components/header.dart';
import 'package:spyco_shop_management/widgets/cards.dart';
import 'package:spyco_shop_management/widgets/custom_data_list.dart';
import 'package:spyco_shop_management/widgets/global_widgets.dart';
import 'package:spyco_shop_management/widgets/globals.dart';
import 'package:spyco_shop_management/widgets/main_recent_widget.dart';

import '../../constants/text_styles.dart';
import 'components/dashboard_widgets.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  int pageIndex = 0;
  LoginResponse ? response;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  var customerName = [
    "Rampal singh",
    "jaipal singh",
    "sompal singh",
    "kishan singh",
    "rompal singh",
    "Rampal singh",
    "Rampal singh",
  ];
  var billingPrice = [
    "1000.00",
    "1000.00",
    "1000.00",
    "1000.00",
    "1000.00",
    "1000.00",
    "1000.00",
    "1000.00",
  ];

  var transictionitem = [
    "saree",
    "saree",
    "saree",
    "saree",
    "saree",
    "saree",
    "saree",
    "saree",
    "saree",
    "saree"
  ];
  var transictionquantity = [
    "10",
    "10",
    "10",
    "10",
    "10",
    "10",
    "10",
    "10",
    "10",
    "10",
  ];
  var transictiondate = [
    '21-10-2023',
    '21-10-2023',
    '21-10-2023',
    '21-10-2023',
    '21-10-2023',
    '21-10-2023',
    '21-10-2023',
    '21-10-2023',
    '21-10-2023',
    '21-10-2023',
  ];
  var transictionamount = [
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
    '10000',
  ];



  List<String> saleType = ["Purchase","Sales","Purchase","Sales""Purchase","Sales""Purchase","Sales""Purchase","Sales"];
  List <String>partyName = ["saurabh", "Roshan","saurabh", "Roshan","saurabh", "Roshan","saurabh", "Roshan","saurabh", "Roshan",];
  List <String>date = ["24-10-2023","24-10-2023","24-10-2023","24-10-2023","24-10-2023","24-10-2023","24-10-2023","24-10-2023","24-10-2023","24-10-2023",];
  List <String> amount = ["10000","20000","60000","90000","50000","10000","10000","10000","10000","10000",];
  List item = ["fabric", "fabric","fabric", "fabric","fabric", "fabric","fabric", "fabric","fabric", "fabric",];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header(
              //   title: "Dashboard",
              //   profileCard: ProfileCard(
              //       username: '',
              //       userImage: "person-svgrepo-com.svg",
              //   ),
              // ),
              SizedBox(height: 5,),
              Text("Business Monitor",
                style: title36w500,
              ),
              // SizedBox(height: 10),
              // CustomHorizontalLine(),
              SizedBox(height: 16,),

              ///------------------------TOp panel -----------------------
              Row(
                children: [
                  Expanded(
                    child: ElevatedBgCard(
                      radius: 16,
                      child: CardSales(
                        title: 'Total Sales', 
                        amount: '120000', 
                        viewAll: 'View All Sales',
                        iconColor: colorBlue, 
                        icon: Ionicons.server_outline,
                        containerColor: colorLightGreen,),
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: ElevatedBgCard(
                      radius: 16,
                      child: CardSales(
                        title: 'Total Purchase',
                        amount: '180000',
                        viewAll: 'View All Purchase',
                        iconColor: colorLightOrange,
                        icon: Ionicons.stats_chart,
                        containerColor: colorOrange,),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: ElevatedBgCard(
                      radius: 16,
                      child: CardSales(
                        title: 'Current Stock',
                        amount: '12000',
                        viewAll: 'View All Stock',
                        iconColor: colorLightOrange,
                        icon: Ionicons.storefront_outline,
                        containerColor: colorOrange,),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: ElevatedBgCard(
                      radius: 16,
                      child: CardSales(
                        title: 'Total Expanses',
                        amount: '10000',
                        viewAll: 'View All Expanses',
                        iconColor: Colors.white.withOpacity(0.50),
                        icon: Ionicons.book_outline,
                        containerColor: colorMainGrey,),
                    ),
                  ),
                ],
              ),
              ///------------------------TOp panel -----------------------
              ///
              SizedBox(height: 16,),
              Row(
                children: [
                  Expanded(
                    child: ElevatedBgCard(
                      radius: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Overview",
                          style: textMainBlack,),
                        ],
                      )
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ElevatedBgCard(
                      radius: 16,
                      child: CardSales(
                        title: 'Total Sales',
                        amount: '120000',
                        viewAll: 'View All Sales',
                        iconColor: colorBlue,
                        icon: Ionicons.server_outline,
                        containerColor: colorLightGreen,),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (Responsive.isDesktop(context))
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Business Monitor",
                        style: title36w500,
                        ),






                        SizedBox(height: 10,),
                        ElevatedBgColorCard(
                          color: selectedColor.withOpacity(0.60),
                          radius: 12,
                          child: Text(
                            "Top Selling items",
                            style: title16,
                          ),
                        ),
                        SizedBox(height: 10,),
                        ElevatedBgCard(
                          radius: 12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("1200",style: title34w300,),
                                      SvgPicture.asset("assets/icon/rupee-sign-svgrepo-com.svg",
                                        height: 15,
                                        width: 15,)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Quantity: 100",
                                      style: TextStyle(
                                        color: Colors.black
                                      ),),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("1200",style: title34w300,),
                                      SvgPicture.asset("assets/icon/rupee-sign-svgrepo-com.svg",
                                        height: 15,
                                        width: 15,)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Quantity: 100",
                                        style: TextStyle(
                                            color: Colors.black
                                        ),),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("1200",style: title34w300,),
                                      SvgPicture.asset("assets/icon/rupee-sign-svgrepo-com.svg",
                                        height: 15,
                                        width: 15,)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Quantity: 100",
                                        style: TextStyle(
                                            color: Colors.black
                                        ),),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        ElevatedBgColorCard(
                          color: selectedColor.withOpacity(0.60),
                          radius: 12,
                          child: Text("Non Moving Item",
                            style: title16,
                          ),
                        ),
                        SizedBox(height: 10,),
                        ElevatedBgCard(
                          radius: 12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("1200",style: title34w300,),
                                      SvgPicture.asset("assets/icon/rupee-sign-svgrepo-com.svg",
                                        height: 15,
                                        width: 15,)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Quantity: 100",
                                        style: TextStyle(
                                            color: Colors.black
                                        ),),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("1200",style: title34w300,),
                                      SvgPicture.asset("assets/icon/rupee-sign-svgrepo-com.svg",
                                        height: 15,
                                        width: 15,)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Quantity: 100",
                                        style: TextStyle(
                                            color: Colors.black
                                        ),),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("1200",style: title34w300,),
                                      SvgPicture.asset("assets/icon/rupee-sign-svgrepo-com.svg",
                                        height: 15,
                                        width: 15,)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("Quantity: 100",
                                        style: TextStyle(
                                            color: Colors.black
                                        ),),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        ElevatedBgColorCard(
                          color: selectedColor.withOpacity(0.60),
                          radius: 12,
                          child: Text(
                            "Top Supplier",
                            style: title16,
                          ),
                        ),
                        SizedBox(height: 20,),
                        ElevatedBgCard(
                          radius: 12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("Sk \nEnterprises",style: title20w500,),
                                        // SvgPicture.asset("assets/icon/rupee-sign-svgrepo-com.svg",
                                        //   height: 15,
                                        //   width: 15,)
                                      ],
                                    ),
                                    SizedBox(height: 6,),
                                    Row(
                                      children: [
                                        Text("Sold Quantity:\n 100",
                                          style: TextStyle(
                                              color: Colors.black
                                          ),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("Sorav \nCollection",style: title20w500,),
                                        // SvgPicture.asset("assets/icon/rupee-sign-svgrepo-com.svg",
                                        //   height: 15,
                                        //   width: 15,)
                                      ],
                                    ),
                                    SizedBox(height: 6,),
                                    Row(
                                      children: [
                                        Text("Sold Quantity:\n 100",
                                          style: TextStyle(
                                              color: Colors.black
                                          ),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("Garg \nEnterprises",style: title20w500,),
                                        // SvgPicture.asset("assets/icon/rupee-sign-svgrepo-com.svg",
                                        //   height: 15,
                                        //   width: 15,)
                                      ],
                                    ),
                                    SizedBox(height: 6,),
                                    Row(
                                      children: [
                                        Text("Sold Quantity:\n 100",
                                          style: TextStyle(
                                              color: Colors.black
                                          ),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        ElevatedBgColorCard(
                          color: Colors.green,
                          radius: 12,
                          child: Text(
                            "Total Business Profit",
                            style: title16white,
                          ),
                        ),
                        SizedBox(height: 10,),
                        ElevatedBgColorCard(
                          color: Colors.green,
                          radius: 12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("1200000",style: title40,),
                                      SvgPicture.asset("assets/icon/rupee-sign-svgrepo-com.svg",
                                        color: Colors.white,
                                        height: 15,
                                        width: 15,)
                                    ],
                                  ),

                                ],
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: 20,),

                      ],
                    )
                  ),
                  SizedBox(width: 16,),
                  if (Responsive.isDesktop(context))
                  Expanded(
                    flex:2,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedBgCard(
                                  radius: 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Today Sale"),
                                        SvgPicture.asset("assets/icon/arrow-up-right-svgrepo-com.svg",
                                        height: 24,
                                        width: 24,)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("1200",style: pageTitle,),
                                        SvgPicture.asset("assets/icon/rupee-sign-svgrepo-com.svg",
                                        height: 24,
                                        width: 24,),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 16,),
                            Expanded(
                              child: ElevatedBgCard(
                                radius: 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Weekly Sale"),
                                        SvgPicture.asset("assets/icon/arrow-up-right-svgrepo-com.svg",
                                          height: 24,
                                          width: 24,)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("8000",style: pageTitle,),
                                        SvgPicture.asset("assets/icon/rupee-sign-svgrepo-com.svg",
                                          height: 24,
                                          width: 24,)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              child: ElevatedBgCard(
                                radius: 16,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Montly Sale"),
                                        SvgPicture.asset("assets/icon/arrow-up-right-svgrepo-com.svg",
                                          height: 24,
                                          width: 24,)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("18282",style: pageTitle,),
                                        SvgPicture.asset(
                                          "assets/icon/rupee-sign-svgrepo-com.svg",
                                          height: 24,
                                          width: 24,),

                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24,),
                        ElevatedBgColorCard(
                          radius: 0,
                          color: selectedColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Total Sale",
                                          style: title20,
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icon/rupee-sign-svgrepo-com.svg",
                                              height: 24,
                                              width: 24,),
                                            Text("18282",style: pageTitle,),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("10000",style: title34w300,),
                                                    SvgPicture.asset(
                                                      "assets/icon/rupee-sign-svgrepo-com.svg",
                                                      height: 16,
                                                      width: 16,),

                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 10,
                                                      width: 10,
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.black
                                                      ),
                                                    ),
                                                    SizedBox(width: 4,),
                                                    Text("CASH",
                                                      style: TextStyle(
                                                          color: Colors.black
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                        Expanded(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("8282",style: title34w300,),
                                                    SvgPicture.asset(
                                                      "assets/icon/rupee-sign-svgrepo-com.svg",
                                                      height: 16,
                                                      width: 16,),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 10,
                                                      width: 10,
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.black
                                                      ),
                                                    ),
                                                    SizedBox(width: 4,),
                                                    Text("UPI",
                                                      style: TextStyle(
                                                          color: Colors.black
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                        Expanded(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("4000",style: title34w300,),
                                                    SvgPicture.asset(
                                                      "assets/icon/rupee-sign-svgrepo-com.svg",
                                                      height: 16,
                                                      width: 16,),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 10,
                                                      width: 10,
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.black
                                                      ),
                                                    ),
                                                    SizedBox(width: 4,),
                                                    Text("CREDIT",
                                                      style: TextStyle(
                                                          color: Colors.black
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),



                            ],
                          ),
                        ),
                        SizedBox(height: 24,),
                        SizedBox(height: 24,),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedBgColorCard(
                                color: selectedColor,
                                radius: 12,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Total Supplier's Credit",
                                          style: title20Black,
                                        ),
                                        Row(
                                          children: [
                                            Text("1200",style: titleBlack,),
                                            SvgPicture.asset("assets/icon/rupee-sign-svgrepo-com.svg",
                                              color: Colors.black,
                                              height: 15,
                                              width: 15,)
                                          ],
                                        ),

                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 16,),
                            Expanded(
                              child: ElevatedBgColorCard(
                                color: Colors.green,
                                radius: 12,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Total Customer's Credit",
                                          style: title20White,
                                        ),
                                        Row(
                                          children: [
                                            Text("1200",style: title40,),
                                            SvgPicture.asset("assets/icon/rupee-sign-svgrepo-com.svg",
                                              color: Colors.white,
                                              height: 15,
                                              width: 15,)
                                          ],
                                        ),

                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}





class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor,
  });
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        )
      ],
    );
  }
}




