


import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              // SizedBox(height: 10),
              CustomHorizontalLine(),
              SizedBox(height: 16,),
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
                        ElevatedBgColorCard(

                          radius: 0,
                          color: selectedColor,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: BarChartSample1(),

                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),


              //---------------Old dashb0ard----------------
              // Row(
              //   children: [
              //     if (Responsive.isDesktop(context))
              //     Expanded(
              //       // flex: 2,
              //         child: ElevatedBgCard(
              //           radius: 16,
              //           child: Container(
              //             height: MediaQuery.sizeOf(context).height *0.41,
              //             child: BarChartSample1(),
              //           ),
              //         )),
              //     SizedBox(width: 16,),
              //     if (Responsive.isDesktop(context))
              //     Expanded(
              //         child: ElevatedBgCard(
              //           radius: 16,
              //           child: Container(
              //             hExpanded(
              //                               child: ElevatedBgCard(
              //                                   radius: 16,
              //                                 child: Column(
              //                                   children: [
              //                                     Row(
              //                                       children: [
              //                                         Text("Last Week"),
              //                                       ],
              //                                     ),
              //                                     Text("277",style: pageTitle,)
              //                                   ],
              //                                 ),
              //                               ),
              //                             ),eight: MediaQuery.sizeOf(context).height *0.41,
              //             child: PieChartSample2(),
              //           ),
              //         )),
              //   ],
              // ),
              // SizedBox(height: defaultPadding),
              //
              //
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     if (Responsive.isDesktop(context))
              //     Expanded(
              //       child: ElevatedBgCard(
              //         radius: 16.0,
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           children: [
              //
              //             DashBoardPriceCard(title: 'Total Sales', price: '₹40000', percent: '29 %',)
              //           ],
              //         ),
              //       ),
              //     ),
              //     SizedBox(width: 16,),
              //     if (Responsive.isDesktop(context))
              //     Expanded(
              //       child: ElevatedBgCard(
              //         radius: 16.0,
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           children: [
              //             DashBoardPriceCard(title: 'Total Purchases', price: '₹10000', percent: '29 %',)
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 10,),
              // Row(
              //   children: [
              //     Expanded(
              //       flex: 2,
              //       child: CustomDataList(
              //         listTitle: 'Recent Entries',
              //         categoryTitle1: 'Type',
              //         categoryTitle2: 'Party',
              //         categoryTitle3: 'Item',
              //         categoryTitle4: 'Date',
              //         listItemCount: saleType.length,
              //         saleType: saleType,
              //         partyName: partyName,
              //         date: date,
              //         amount: amount,
              //         categoryTitle5: 'Amount',
              //         item: [],
              //
              //       ),
              //     ),
              //     SizedBox(width: 16),
              //     Expanded(
              //       child: ElevatedBgCard(
              //           radius: 16.0,
              //           child: BarChartSample2()),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}


class BarChartSample1 extends StatefulWidget {
  BarChartSample1({super.key});

  List<Color> get availableColors => const <Color>[
    AppColors.contentColorPurple,
    AppColors.contentColorYellow,
    AppColors.contentColorBlue,
    AppColors.contentColorOrange,
    AppColors.contentColorPink,
    AppColors.contentColorRed,
  ];

  final Color barBackgroundColor =
  AppColors.contentColorWhite.darken().withOpacity(0.3);
  final Color barColor = AppColors.contentColorWhite;
  final Color touchedBarColor = AppColors.contentColorGreen;

  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio:2,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Analysis",
                  style: nameText,
                ),
                const SizedBox(
                  height: 38,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: BarChart(
                      isPlaying ? randomData() : mainBarData(),
                      swapAnimationDuration: animDuration,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color? barColor,
        double width = 150,
        double barHeight = 10,
        List<int> showTooltips = const [],
      }) {
    final alternatingColors = [
      Colors.blue, // Change this to the first color you want
      Colors.grey, // Change this to the second color you want
    ];
    final colorIndex = x % alternatingColors.length;
    final selectedColor = alternatingColors[colorIndex];
    //     List<int> showTooltips = const [],
    //   }) {
    // barColor ??= Colors.blue;
    return BarChartGroupData(

      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? widget.touchedBarColor : Colors.white,
          width: width,
          borderRadius: BorderRadius.circular(12),
          borderSide: isTouched
              ? BorderSide(color: widget.touchedBarColor.darken(80))
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 10,
            color: widget.barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(3, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, 5, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, 5, isTouched: i == touchedIndex);
      default:
        return throw Error();
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.black,
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = 'Monday';
                break;
              case 1:
                weekDay = 'Tuesday';
                break;
              case 2:
                weekDay = 'Wednesday';
                break;
              case 3:
                weekDay = 'Thursday';
                break;
              case 4:
                weekDay = 'Friday';
                break;
              case 5:
                weekDay = 'Saturday';
                break;
              case 6:
                weekDay = 'Sunday';
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: TextStyle(
                    color: widget.touchedBarColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(

        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles:  AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitles,
            reservedSize: 10,
            interval: 1,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 10) {
      text = '1lac';
    } else if (value == 19) {
      text = '10lac';
    } else {
      return Container();
    }
    return FittedBox(
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: Color(0xff7589a2),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 14,


    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('TOTAL STOCK', style:style );
        break;
      case 1:
        text = const Text('TOTAL SALE', style: style);
        break;
      default:
        text = const Text('CREDIT', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(
              0,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          case 1:
            return makeGroupData(
              1,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          case 2:
            return makeGroupData(
              2,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          case 3:
            return makeGroupData(
              3,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          case 4:
            return makeGroupData(
              4,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          case 5:
            return makeGroupData(
              5,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          case 6:
            return makeGroupData(
              6,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          default:
            return throw Error();
        }
      }),
      gridData: const FlGridData(show: false),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 50),
    );
    if (isPlaying) {
      await refreshState();
    }
  }
}

class BarChartSample2 extends StatefulWidget {
  BarChartSample2({super.key});

  List<Color> get availableColors => const <Color>[
    AppColors.contentColorPurple,
    AppColors.contentColorYellow,
    AppColors.contentColorBlue,
    AppColors.contentColorOrange,
    AppColors.contentColorPink,
    AppColors.contentColorRed,
  ];

  final Color barBackgroundColor =
  AppColors.contentColorWhite.darken().withOpacity(0.3);
  final Color barColor = AppColors.contentColorWhite;
  final Color touchedBarColor = AppColors.contentColorGreen;

  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio:1,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Payment Report",
                  style: nameText,
                ),
                const SizedBox(
                  height: 38,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: BarChart(
                      isPlaying ? randomData() : mainBarData(),
                      swapAnimationDuration: animDuration,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color? barColor,
        double width = 40,
        double barHeight = 40,
        List<int> showTooltips = const [],
      }) {
    final alternatingColors = [
      Colors.blue, // Change this to the first color you want
      Colors.grey, // Change this to the second color you want
    ];
    final colorIndex = x % alternatingColors.length;
    final selectedColor = alternatingColors[colorIndex];
    //     List<int> showTooltips = const [],
    //   }) {
    // barColor ??= Colors.blue;
    return BarChartGroupData(

      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? widget.touchedBarColor : barColor,
          width: width,
          borderRadius: BorderRadius.circular(12),
          borderSide: isTouched
              ? BorderSide(color: widget.touchedBarColor.darken(80))
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: widget.barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(3, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, 5, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, 5, isTouched: i == touchedIndex);


      default:
        return throw Error();
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.black,
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = 'Cash';
                break;
              case 1:
                weekDay = 'Bank';
                break;
              case 2:
                weekDay = 'Others';
                break;

                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: TextStyle(
                    color: widget.touchedBarColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(

        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles:  AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitles,
            reservedSize: 10,
            interval: 1,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 10) {
      text = '1lac';
    } else if (value == 19) {
      text = '10lac';
    } else {
      return Container();
    }
    return FittedBox(
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: Color(0xff7589a2),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 14,


    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('Cash', style:style );
        break;
      case 1:
        text = const Text('Bank', style: style);
        break;
      default:
        text = const Text('Other', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(
              0,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          case 1:
            return makeGroupData(
              1,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          case 2:
            return makeGroupData(
              2,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          case 3:
            return makeGroupData(
              3,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          case 4:
            return makeGroupData(
              4,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          case 5:
            return makeGroupData(
              5,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          case 6:
            return makeGroupData(
              6,
              Random().nextInt(15).toDouble() + 6,
              barColor: widget.availableColors[
              Random().nextInt(widget.availableColors.length)],
            );
          default:
            return throw Error();
        }
      }),
      gridData: const FlGridData(show: false),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
      animDuration + const Duration(milliseconds: 50),
    );
    if (isPlaying) {
      await refreshState();
    }
  }
}


extension ColorExtension on Color {
  /// Convert the color to a darken color based on the [percent]
  Color darken([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(
      alpha,
      (red * value).round(),
      (green * value).round(),
      (blue * value).round(),
    );
  }

  Color lighten([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = percent / 100;
    return Color.fromARGB(
      alpha,
      (red + ((255 - red) * value)).round(),
      (green + ((255 - green) * value)).round(),
      (blue + ((255 - blue) * value)).round(),
    );
  }

  Color avg(Color other) {
    final red = (this.red + other.red) ~/ 2;
    final green = (this.green + other.green) ~/ 2;
    final blue = (this.blue + other.blue) ~/ 2;
    final alpha = (this.alpha + other.alpha) ~/ 2;
    return Color.fromARGB(alpha, red, green, blue);
  }
}



class AppColors {
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}




class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 0.5,
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex = pieTouchResponse
                          .touchedSection!.touchedSectionIndex;
                    });
                  },
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 20,
                sections: showingSections(),
              ),
            ),
          ),
          SizedBox(width:20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Indicator(color:barColor.withOpacity(0.80) , text: "Total purchase", isSquare: false),
              Indicator(color:primaryBlueColor , text: "Total Sales", isSquare: false)
            ],
          ),

        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return [
      PieChartSectionData(
        color: barColor.withOpacity(0.80),
        value: 40,
        title: '40%',
        radius: 50.0, // Set the radius you prefer
        titleStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: AppColors.mainTextColor1,
          shadows: [Shadow(color: Colors.black, blurRadius: 2)],
        ),
      ),
      PieChartSectionData(
        color: primaryBlueColor,
        value: 30,
        title: '30%',
        radius: 60.0, // Set the radius you prefer
        titleStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: AppColors.mainTextColor1,
          shadows: [Shadow(color: Colors.black, blurRadius: 2)],
        ),
      ),
    ];
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