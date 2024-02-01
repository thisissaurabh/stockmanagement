import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:spyco_shop_management/api/login_register/get_supplier_api.dart';
import 'package:spyco_shop_management/api_models/supplier_model.dart';
import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/constants/responsive.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';

import 'package:spyco_shop_management/controllers/MenuAppController.dart';
import 'package:spyco_shop_management/sales/customers.dart';
import 'package:spyco_shop_management/screens/dashboard/components/header.dart';

import 'package:spyco_shop_management/screens/main/components/side_menu.dart';
import 'package:spyco_shop_management/screens/supplier/add_supplier.dart';
import 'package:spyco_shop_management/widgets/cards.dart';
import 'package:spyco_shop_management/widgets/custom_data_list.dart';
import 'package:spyco_shop_management/widgets/custom_dialog.dart';

import 'package:spyco_shop_management/widgets/main_button.dart';
import 'package:spyco_shop_management/widgets/main_recent_widget.dart';
import '../../widgets/global_widgets.dart';

class SupplierScreen extends StatefulWidget {
  const SupplierScreen({super.key});

  @override
  State<SupplierScreen> createState() => _SupplierScreenState();
}

class _SupplierScreenState extends State<SupplierScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),

      // drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              // Expanded(
              //   // default flex = 1
              //   // and it takes 1/6 part of the screen
              //   child: SideMenu(),
              // ),
            Expanded(
              // It takes 5/6 part of the screen
                flex: 5,
                child: LeftSupplierPanel()),
          ],
        ),
      ),
    );
  }
}

class LeftSupplierPanel extends StatefulWidget {
  const LeftSupplierPanel({super.key});

  @override
  State<LeftSupplierPanel> createState() => _LeftSupplierPanelState();
}

class _LeftSupplierPanelState extends State<LeftSupplierPanel> {

  @override
  void initState() {
    getSupplier();
    super.initState();
  }



  bool isLoading = false;

  List<SupplierModel> suppliers = [];

  getSupplier() {
    isLoading = true;
    var resp = getSupplierApi();
    resp.then((value) {
      if (value['status'] == 1) {
        for(var v in value['supplierData']['data']) {
          suppliers.add(SupplierModel.fromJson(v));
        }
        setState(() {
          isLoading = false;
        });
      } else {
        isLoading = false;
      }
    });
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
      backgroundColor: Color(0xffeaeaea).withOpacity(0.20),
      body: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header(
                title: 'Supplier',
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                                      press: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return CustomDialog(
                                              title: 'Dialog Title',
                                              content: 'This is the content of the dialog.',
                                            );
                                          },
                                        );
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
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: suppliers.length,
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
                                                    suppliers[i].firstName.toString(),
                                                    style: nameSlimText,
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    suppliers[i].mail.toString(),
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 3,
                                                    // "\u20B9${billingPrice[i]}",
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
                  Expanded(
                    // It takes 5/6 part of the screen
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            selectedItemIndex != -1 && suppliers.isNotEmpty && selectedItemIndex < suppliers.length ?
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
                                            suppliers[selectedItemIndex].firstName.toString(),
                                            style: nameSmallText,
                                          ),
                                          Row(
                                            children: [
                                              Text("Phone: "),
                                              Text( suppliers[selectedItemIndex].phone.toString(),),
                                              Row(
                                                children: [],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Email: "),
                                              Text( suppliers[selectedItemIndex].mail.toString(),)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Gstin: "),
                                              Text( suppliers[selectedItemIndex].gstNo.toString(),)
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
                                              suppliers[selectedItemIndex].companyAddress.toString(),
                                              maxLines: 3,
                                              textAlign: TextAlign.end,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text("City: "),
                                              Text( 
                                                suppliers[selectedItemIndex].city.toString(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Row(
                                                children: [],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("State: "),
                                              Text(
                                                suppliers[selectedItemIndex].state.toString(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Row(
                                                children: [],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),


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
                            ) :SizedBox(),
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
                                      CustomListData(
                                        listTitle: "Recent Suppliers",
                                        categoryTitle1: "Customer name",
                                        categoryTitle2: "Item",
                                        categoryTitle3: "Quantity",
                                        categoryTitle4: "Date",
                                        categoryTitle5: 'Amount',
                                        listviewWidget: ListView.separated(
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
                                        ), )
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
