import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/constants/responsive.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';

import 'package:spyco_shop_management/controllers/MenuAppController.dart';
import 'package:spyco_shop_management/screens/dashboard/components/header.dart';

import 'package:spyco_shop_management/screens/main/components/side_menu.dart';
import 'package:spyco_shop_management/widgets/cards.dart';

import 'package:spyco_shop_management/widgets/main_button.dart';
import 'package:spyco_shop_management/widgets/main_recent_widget.dart';

class AddSupplierScreen extends StatefulWidget {
  const AddSupplierScreen({super.key});

  @override
  State<AddSupplierScreen> createState() => _AddSupplierScreenState();
}

class _AddSupplierScreenState extends State<AddSupplierScreen> {
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
                child: AddSupplier()),
          ],
        ),
      ),
    );
  }
}

class AddSupplier extends StatefulWidget {
  const AddSupplier({super.key});

  @override
  State<AddSupplier> createState() => _AddSupplierState();
}

class _AddSupplierState extends State<AddSupplier> {
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

  List demoRecentFiles = [
    MainRecentFileRequires(
      title: "XD File",
      date: "01-03-2021",
      size: "3.5mb",
      amount: "e3ew",
    ),
    MainRecentFileRequires(
      title: "Figma File",
      date: "27-02-2021",
      size: "19.0mb",
      amount: "e3ew",
    ),
    MainRecentFileRequires(
      title: "Document",
      date: "23-02-2021",
      size: "32.5mb",
      amount: "e3ew",
    ),
    MainRecentFileRequires(
      title: "Sound File",
      date: "21-02-2021",
      size: "3.5mb",
      amount: "e3ew",
    ),
    MainRecentFileRequires(
      title: "Media File",
      date: "23-02-2021",
      size: "2.5gb",
      amount: "e3ew",
    ),
    MainRecentFileRequires(
      title: "Sales PDF",
      date: "25-02-2021",
      size: "3.5mb",
      amount: "e3ew",
    ),
    MainRecentFileRequires(
      title: "Excel File",
      date: "25-02-2021",
      size: "34.5mb",
      amount: "e3ew",
    ),
  ];

  int selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header(
                title: 'Add Supplier',
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
                                      "All Suppliers",
                                      style: nameText,
                                    ),
                                    PlusButton(
                                      press: () {},
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Address",
                                            style: nameSmallText,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: MediaQuery.sizeOf(context).height,
                                  child: Column(
                                    children: [
                                      MainRecentFiles(
                                        mainTitle: 'Recent Transactions',
                                        mainRowTitle1: 'Item',
                                        mainRowTitle2: 'Quantity',
                                        mainRowTitle3: 'Date',
                                        mainRowTitle4: 'amount',
                                        rows: List.generate(
                                          demoRecentFiles.length,
                                          (index) => mainRecentFileDataRow(
                                              demoRecentFiles[index]),
                                        ),
                                      )
                                    ],
                                  ),
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
                          ],
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
