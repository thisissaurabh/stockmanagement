import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:spyco_shop_management/constants/colors.dart';

import 'package:spyco_shop_management/constants/responsive.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';

import 'package:spyco_shop_management/controllers/MenuAppController.dart';
import 'package:spyco_shop_management/sales/add_customer.dart';
import 'package:spyco_shop_management/screens/dashboard/components/header.dart';

import 'package:spyco_shop_management/screens/main/components/side_menu.dart';
import 'package:spyco_shop_management/widgets/cards.dart';
import 'package:spyco_shop_management/widgets/custom_data_list.dart';
import 'package:spyco_shop_management/widgets/global_widgets.dart';
import 'package:spyco_shop_management/widgets/globals.dart';
import 'package:spyco_shop_management/widgets/main_button.dart';
import 'package:spyco_shop_management/widgets/main_recent_widget.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: LeftCustomerPanel(),
            ),
          ],
        ),
      ),
    );
  }
}

class LeftCustomerPanel extends StatefulWidget {
  const LeftCustomerPanel({super.key});

  @override
  State<LeftCustomerPanel> createState() => _LeftCustomerPanelState();
}

class _LeftCustomerPanelState extends State<LeftCustomerPanel> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int pageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
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



  List partyName = ["saurabh", "Roshan","saurabh", "Roshan","saurabh", "Roshan","saurabh", "Roshan","saurabh", "Roshan",];
  List item = ["fabric", "fabric","fabric", "fabric","fabric", "fabric","fabric", "fabric","fabric", "fabric",];
  List date = ["24-10-2023","24-10-2023","24-10-2023","24-10-2023","24-10-2023","24-10-2023","24-10-2023","24-10-2023","24-10-2023","24-10-2023",];
  List amount = ["10000","20000","60000","90000","50000","10000","10000","10000","10000","10000",];
  List quantity = ["100","200","400","600","599","440","600","500","500","400",];

  int selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              title: 'All Customers',
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // We want this side menu only for large screen
                if (Responsive.isDesktop(context))
                  Expanded(
                    child: ElevatedBgCard(
                      radius: 0,
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                                top: 16,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "All Customers",
                                    style: nameText,
                                  ),
                                  PlusButton(
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
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ListView.separated(
                                shrinkWrap: true,
                                itemCount: customerName.length,
                                itemBuilder: (_, i) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedItemIndex = i;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8, bottom: 0),
                                      child: Container(
                                        color: selectedItemIndex == i
                                            ? selectedColor.withOpacity(
                                                0.40) // Change the background color of the selected item
                                            : secondaryColor,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8,
                                              left: 16,
                                              right: 16,
                                              bottom: 8),
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  customerName[i],
                                                  style: nameSlimText,
                                                ),
                                                Spacer(),
                                                Text(
                                                  "\u20B9${billingPrice[i]}",
                                                  style: nameSlimText,
                                                ),
                                              ]),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        SizedBox(
                                          height: 0,
                                        ))
                          ],
                        ),
                      ),
                    ),
                  ),
                // SizedBox(
                //   width: 10,
                // ),
                Expanded(
                  // It takes 5/6 part of the screen
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        ElevatedBgCard(
                          radius: 16.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Saurav",
                                        style: nameSmallText,
                                      ),
                                      Row(
                                        children: [
                                          Text("Phone:"),
                                          Text("9484848484"),
                                          Row(
                                            children: [],
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Email:"),
                                          Text("spycotech@gmail.com")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Gstin:"),
                                          Text("4474875874784574")
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Address",
                                        style: nameSmallText,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.30,
                                        child: Text(
                                          "P-68 Vijay Vihar Uttam Nagar New delhi 110059",
                                          maxLines: 3,
                                          textAlign: TextAlign.end,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )

                              // Text(
                              //   "${customerName[selectedItemIndex]}",
                              //   style: titleBold,
                              // ),
                              // HorizontalLine(),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // Container(
                              //   color: Colors.yellow,
                              //   child: Center(
                              //     child: Row(
                              //       children: [
                              //         Container(),
                              //         Text(
                              //             "Content of ${customerName[selectedItemIndex]}"),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            MouseHover(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = pageIndex = 0;
                                    _pageController.jumpToPage(
                                      pageIndex,
                                    );
                                    pageIndex = 0;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      "Overview",
                                      style: pageIndex == 0
                                          ? selectedBoldText
                                          : selectedThinText,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.05,
                                      height: 2,
                                      color: pageIndex == 0
                                          ? selectedColor
                                          : Colors.transparent,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            MouseHover(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = pageIndex = 1;
                                    _pageController.jumpToPage(
                                      pageIndex,
                                    );
                                    pageIndex = 1;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      "Transactions",
                                      style: pageIndex == 1
                                          ? selectedBoldText
                                          : selectedThinText,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      width: MediaQuery.sizeOf(context).width *
                                          0.05,
                                      height: 2,
                                      color: pageIndex == 1
                                          ? selectedColor
                                          : Colors.transparent,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: PageView(
                            controller: _pageController,
                            onPageChanged: (page) {
                              setState(
                                () {
                                  pageIndex = page;
                                },
                              );
                            },
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomerDetailsCard(
                                                name: "saurabh",
                                                email: 'saurabh@gmail.com',
                                                phoneNo: '948494849',
                                              ),
                                              SizedBox(height: 10),
                                              Text("Address"),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              CustomHorizontalLine(),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "P-86 vijat vijart nffvnfv fcfcn nfvnf cnfkdcnf cnfkcfn ncfknckf cnfkcnf cmfkvfm mcfkmcfkmc mckfmcfkm nckfnkcf",
                                                style: selectedThinText16,
                                              ),
                                              SizedBox(height: 10),
                                              Text("Other Details"),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              CustomHorizontalLine(),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              RowSpaceBetweenRow(
                                                desc: "Customer type",
                                                title: 'Bussiness',
                                              ),
                                              SizedBox(height: 6),
                                              RowSpaceBetweenRow(
                                                title: 'Customer id',
                                                desc: "38383838",
                                              ),
                                              SizedBox(height: 6),
                                              RowSpaceBetweenRow(
                                                desc: "8484848488",
                                                title: 'Gst no',
                                              ),
                                              SizedBox(height: 6),
                                              RowSpaceBetweenRow(
                                                desc: "Payment type",
                                                title: 'Upi',
                                              ),
                                              SizedBox(height: 6),
                                              RowSpaceBetweenRow(
                                                desc: "20000",
                                                title: 'Total Sales',
                                              ),
                                              SizedBox(height: 6),
                                              RowSpaceBetweenRow(
                                                title: 'Created on',
                                                desc: "24-11-2023",
                                              ),

                                              // Text(
                                              //   'Adress',
                                              //   style: selectedThinText,
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 16, bottom: 16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                child: Text(
                                                  "Receivables",
                                                  style: selectedBoldText,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              CustomHorizontalLine(),
                                              Container(
                                                color: selectedColor
                                                    .withOpacity(0.40),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(children: [
                                                    Column(
                                                      children: [
                                                        Text("Total Amount",
                                                            style:
                                                                selectedThinText10),
                                                        Text(
                                                          "12000",
                                                          style:
                                                              thinblueText10w400,
                                                        ),
                                                      ],
                                                    ),
                                                    Spacer(),
                                                    Column(
                                                      children: [
                                                        Text("Received",
                                                            style:
                                                                selectedThinText10),
                                                        Text(
                                                          "10000",
                                                          style:
                                                              thinblueText10w400,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(width: 20),
                                                    Column(
                                                      children: [
                                                        Text(
                                                            "Outstanding amount",
                                                            style:
                                                                selectedThinText10),
                                                        Text(
                                                          "2000",
                                                          style:
                                                              thinblueText10w400,
                                                        ),
                                                      ],
                                                    )
                                                  ]),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomListData(
                                  listTitle: "Recent Sales",
                                  categoryTitle1: "Customer name",
                                  categoryTitle2: "Item",
                                  categoryTitle3: "Quantity",
                                  categoryTitle4: "Date",
                                categoryTitle5: 'Amount',
                                  listviewWidget: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ListView.separated(
                                        itemCount: partyName.length,
                                        shrinkWrap: true,
                                        itemBuilder: (_, i) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex:1,
                                                  child: Center(
                                                    child: Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Text(
                                                        partyName[i],
                                                        style: listName,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex:1,
                                                  child: Center(
                                                    child: Text(
                                                      item[i],
                                                      style: listName,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex:1,
                                                  child: Center(
                                                    child: Text(
                                                      quantity[i],
                                                      style: listName,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex:1,
                                                  child: Center(
                                                    child: Text(
                                                      date[i],
                                                      style: listName,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex:1,
                                                  child: Center(
                                                    child: Text(
                                                      amount[i],
                                                      style: listName,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }, separatorBuilder: (BuildContext context, int index) =>
                                          CustomHorizontalLine(),
                                      ),
                                    ],
                                  ), )
                            ],
                          ),
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
    );
  }
}
