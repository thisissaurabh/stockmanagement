import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/constants/responsive.dart';
import 'package:spyco_shop_management/constants/text_styles.dart';
import 'package:spyco_shop_management/constants/textfield_decoration.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';
import 'package:spyco_shop_management/controllers/MenuAppController.dart';
import 'package:spyco_shop_management/screens/dashboard/components/header.dart';
import 'package:spyco_shop_management/screens/main/components/side_menu.dart';
import 'package:spyco_shop_management/widgets/cards.dart';
import 'package:spyco_shop_management/widgets/global_widgets.dart';
import 'package:spyco_shop_management/widgets/globals.dart';

import '../stock/add_stock_item.dart';
import '../widgets/main_button.dart';

class Invoice extends StatefulWidget {
  const Invoice({
    super.key,
  });

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            // if (Responsive.isDesktop(context))
            //   Expanded(
            //     // default flex = 1
            //     // and it takes 1/6 part of the screen
            //     child: SideMenu(),
            //   ),
            Expanded(
                // It takes 5/6 part of the screen
                // flex: 5,
                child: BillingWindow()),
          ],
        ),
      ),
    );
  }
}

class BillingWindow extends StatefulWidget {
  const BillingWindow({super.key});

  @override
  State<BillingWindow> createState() => _BillingWindowState();
}

class _BillingWindowState extends State<BillingWindow> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];

  String? selectedValue;
  final cash = TextEditingController();

  final List<String> paymentMethod = [
    'Upi',
    'Bank',
  ];

  String? paymentVal;
  final paymentMode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      bottomNavigationBar: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 22),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment : CrossAxisAlignment.start,
                      children: [
                        Text("Remarks",
                          style: contentHeading,),
                        SizedBox(height: 10,),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.30,
                          color: Colors.white,
                          child: TextFormField(
                            maxLines: 2,

                            // validator: (v) {
                            //   if (v!.isEmpty || !v.contains('@')) {
                            //     return 'Please enter a valid email!';
                            //   }
                            //   return null;
                            // },

                            cursorColor: Colors.black,
                            decoration: CustomDataField(
                              label: '',
                            ).dataFieldDecoration(),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Payments",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    width: 0.2,
                                    color: Colors.black
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icon/document-add-svgrepo-com.svg",
                                      color: Colors.grey,
                                      height: 24,
                                      width: 24,),
                                    SizedBox(width: 5,),
                                    Text("Add Document"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Payments",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Payment Mode",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AddItemField(
                                          control: cash,
                                          label: 'Cash',
                                        ),
                                      ),
                                      SizedBox(width: 14,),
                                      Expanded(
                                        child:SizedBox(
                                          height: 30,
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton2<String>(
                                              isExpanded: true,
                                              hint: const Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'Select',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              items: paymentMethod
                                                  .map((String item) => DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    // fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ))
                                                  .toList(),
                                              value: paymentVal,
                                              onChanged: (String? value) {
                                                setState(() {
                                                  paymentVal = value;
                                                  paymentMode.text = value!;
                                                });
                                              },
                                              buttonStyleData: ButtonStyleData(
                                                // height: 50,
                                                width: 100,
                                                // width: 160,
                                                padding: const EdgeInsets.only(left: 14, right: 14),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.black.withOpacity(0.50),
                                                    width: 0.5,
                                                  ),
                                                  // color: Colors.white,
                                                ),
                                                elevation: 0,
                                              ),
                                              iconStyleData: const IconStyleData(
                                                icon: Icon(
                                                  Icons.arrow_forward_ios_outlined,
                                                ),
                                                iconSize: 14,
                                                iconEnabledColor: Colors.black,
                                                iconDisabledColor: Colors.black,
                                              ),
                                              dropdownStyleData: DropdownStyleData(
                                                // maxHeight: 200,
                                                width: 276,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(14),
                                                  color: Colors.white,
                                                ),
                                                offset: const Offset(0, 0),
                                                scrollbarTheme: ScrollbarThemeData(
                                                  radius: const Radius.circular(6),
                                                  thickness: MaterialStateProperty.all<double>(6),
                                                  thumbVisibility: MaterialStateProperty.all<bool>(true),
                                                ),
                                              ),
                                              menuItemStyleData: const MenuItemStyleData(
                                                height: 40,
                                                padding: EdgeInsets.only(left: 14, right: 14),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  paymentMode.text.isNotEmpty ?
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AddItemField(
                                          control: cash,
                                          label: 'Amount',
                                        ),
                                      ),
                                      SizedBox(width: 14,),
                                      Expanded(
                                        child: AddItemField(
                                          control: cash,
                                          label: 'Transaction Id',
                                        ),
                                      ),
                                    ],
                                  ) :
                                  SizedBox()
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                  color: Colors.grey.withOpacity(0.10),
                                  child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Total Amount",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      "200000",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 36,
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Spacer(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8, horizontal: 40),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  width: 0.5,
                                                  color: selectedColor)),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                "assets/icon/whatsapp-color-svgrepo-com.svg",
                                                height: 18,
                                                width: 18,
                                              ),
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Text("Share")
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        // Container(
                                        //   padding: EdgeInsets.symmetric(
                                        //     vertical: 8,
                                        //     horizontal: 50
                                        //   ),
                                        //   decoration: BoxDecoration(
                                        //     borderRadius: BorderRadius.circular(8),
                                        //     border: Border.all(
                                        //       width: 0.5,
                                        //       color: selectedColor
                                        //     )
                                        //   ),
                                        //   child: Text("Print"),
                                        // ),
                                        // SizedBox(width: 5,),
                                        MainButton(
                                          title: 'Save',
                                          press: () {},
                                          sizeHorizontal: 50,
                                          sizeVerticle: 10,
                                          radius: 8,
                                          color: selectedColor,
                                          titleColor: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ],
                              ),
                            ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          /*  child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 20
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 0.5,
                        color: selectedColor
                    )
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icon/whatsapp-color-svgrepo-com.svg",
                    height: 18,
                    width: 18,
                    ),
                    SizedBox(width: 3,),
                    Text("Share")
                  ],
                ),
              ),
              SizedBox(width: 5,),
              // Container(
              //   padding: EdgeInsets.symmetric(
              //     vertical: 8,
              //     horizontal: 50
              //   ),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(8),
              //     border: Border.all(
              //       width: 0.5,
              //       color: selectedColor
              //     )
              //   ),
              //   child: Text("Print"),
              // ),
              // SizedBox(width: 5,),
              MainButton(
                title: 'Save',
                press: () {  },
                sizeHorizontal: 50,
                sizeVerticle: 10,
                radius: 8,
                color: selectedColor,
                titleColor: Colors.black,),
            ],
          ),*/
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/chevron-back-svgrepo-com.svg",
                      color: Colors.black,
                      height: 32,
                      width: 32,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Billing",
                      style: pageTitle,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              // CustomHorizontalLine(),
              SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 300,
                          height: 40.0,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: const Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Add Customer',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: items
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 50,
                                width: 360,
                                // width: 160,
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: Colors.black26,
                                  ),
                                  color: Colors.white,
                                ),
                                elevation: 0,
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                ),
                                iconSize: 14,
                                iconEnabledColor: Colors.black,
                                iconDisabledColor: Colors.black,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                // maxHeight: 200,
                                width: 360,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.white,
                                ),
                                offset: const Offset(0, 0),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(6),
                                  thickness:
                                      MaterialStateProperty.all<double>(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 40.0,
                          color: Colors.white,
                          child: TextFormField(
                            // validator: (v) {
                            //   if (v!.isEmpty || !v.contains('@')) {
                            //     return 'Please enter a valid email!';
                            //   }
                            //   return null;
                            // },

                            cursorColor: Colors.black,
                            decoration: CustomDataField(
                              label: 'Email',
                            ).dataFieldDecoration(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 40.0,
                          color: Colors.white,
                          child: TextFormField(
                            // validator: (v) {
                            //   if (v!.isEmpty || !v.contains('@')) {
                            //     return 'Please enter a valid email!';
                            //   }
                            //   return null;
                            // },

                            cursorColor: Colors.black,
                            decoration: CustomDataField(
                              label: 'Phone No',
                            ).dataFieldDecoration(),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 40.0,
                          color: Colors.white,
                          child: TextFormField(
                            // validator: (v) {
                            //   if (v!.isEmpty || !v.contains('@')) {
                            //     return 'Please enter a valid email!';
                            //   }
                            //   return null;
                            // },

                            cursorColor: Colors.black,
                            decoration: CustomDataField(
                              label: 'Address',
                            ).dataFieldDecoration(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 300,
                          height: 40.0,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: const Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Sales Person',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: items
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 50,
                                width: 360,
                                // width: 160,
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: Colors.black26,
                                  ),
                                  color: Colors.white,
                                ),
                                elevation: 0,
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                ),
                                iconSize: 14,
                                iconEnabledColor: Colors.black,
                                iconDisabledColor: Colors.black,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                // maxHeight: 200,
                                width: 360,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.white,
                                ),
                                offset: const Offset(0, 0),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(6),
                                  thickness:
                                      MaterialStateProperty.all<double>(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: 300,
                          height: 40.0,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: const Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Sales Person 2',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: items
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                // fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedValue = value;
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 50,
                                width: 360,
                                // width: 160,
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: Colors.black26,
                                  ),
                                  color: Colors.white,
                                ),
                                elevation: 0,
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                ),
                                iconSize: 14,
                                iconEnabledColor: Colors.black,
                                iconDisabledColor: Colors.black,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                // maxHeight: 200,
                                width: 360,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.white,
                                ),
                                offset: const Offset(0, 0),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(6),
                                  thickness:
                                      MaterialStateProperty.all<double>(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      // height: 23,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UnderLineTextWidget(
                            text: 'Invoice No',
                            data: '1',
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          UnderLineDateWidget(
                            text: 'Invoice Date',
                            data: '24/10/2023',
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  children: [
                    Expanded(
                        child: InvoiceBoxField(
                      title: '#',
                    )),
                    Expanded(
                        flex: 4,
                        child: InvoiceBoxField(
                          title: 'Item',
                        )),
                    Expanded(
                        child: InvoiceBoxField(
                      title: 'Quantity',
                    )),
                    Expanded(
                        flex: 2,
                        child: InvoiceBoxField(
                          title: 'Discount',
                        )),
                    Expanded(
                        flex: 2,
                        child: InvoiceBoxField(
                          title: 'Tax',
                        )),
                    Expanded(
                        child: InvoiceBoxField(
                      title: 'Total',
                    )),
                  ],
                ),
              ),
              Container(
                color: Colors.grey.withOpacity(0.10),
                child: Row(
                  children: [
                    Expanded(
                        child: ItemRowBilling(
                      title: '',
                      color: Colors.transparent,
                    )),
                    Expanded(
                        flex: 4,
                        child: ItemRowBilling(
                            title: '', color: Colors.transparent)),
                    Expanded(
                        child: ItemRowBilling(
                            title: '', color: Colors.transparent)),
                    Expanded(
                        flex: 2,
                        child: ItemRowBilling(
                            title: '', color: Colors.transparent)),
                    Expanded(
                        flex: 2,
                        child: ItemRowBilling(
                            title: '', color: Colors.transparent)),
                    Expanded(
                        child: ItemRowBilling(
                            title: '', color: Colors.transparent)),
                  ],
                ),
              ),
              Container(
                color: Colors.grey.withOpacity(0.10),
                child: Row(
                  children: [
                    Expanded(
                        child: ItemRowBilling(
                      title: '',
                      color: Colors.transparent,
                    )),
                    Expanded(
                        flex: 4,
                        child: ItemRowBilling(
                            title: '', color: Colors.transparent)),
                    Expanded(
                        child: ItemRowBilling(
                            title: '', color: Colors.transparent)),
                    Expanded(
                        flex: 2,
                        child: ItemRowBilling(
                            title: '', color: Colors.transparent)),
                    Expanded(
                        flex: 2,
                        child: ItemRowBilling(
                            title: '', color: Colors.transparent)),
                    Expanded(
                        child: ItemRowBilling(
                            title: '', color: Colors.transparent)),
                  ],
                ),
              ),

              /* Row(
                children: [
                  Expanded(
                      child: InvoiceTotalBoxField(title: '',)
                  ),
                  Expanded(
                      flex: 4,
                      child: InvoiceTotalBoxField(title: '',)
                  ),
                  Expanded(
                      child: InvoiceTotalBoxField(title: 'Total',)
                  ),
                  Expanded(
                      flex: 2,
                      child: InvoiceTotalBoxField(title: 'Total',)
                  ),
                  Expanded(
                      flex: 2,
                      child: InvoiceTotalBoxField(title: 'Total',)
                  ),
                  Expanded(
                      child: InvoiceTotalBoxField(title: 'Total',)
                  ),
                ],
              ),*/
              SizedBox(
                height: 20,
              ),
              /*    Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Remarks",
                    style: contentHeading,),
                  SizedBox(height: 10,),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.30,
                    color: Colors.white,
                    child: TextFormField(
                      maxLines: 5,

                      // validator: (v) {
                      //   if (v!.isEmpty || !v.contains('@')) {
                      //     return 'Please enter a valid email!';
                      //   }
                      //   return null;
                      // },

                      cursorColor: Colors.black,
                      decoration: CustomDataField(
                        label: '',
                      ).dataFieldDecoration(),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Add Document",
                    style: contentHeading,),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          width: 0.2,
                          color: Colors.black
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icon/document-add-svgrepo-com.svg",
                          color: Colors.grey,
                          height: 24,
                          width: 24,),
                        SizedBox(width: 5,),
                        Text("Add Document"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ElevatedBgCard(
                  radius: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        height: 40.0,
                        color: Colors.white,
                        child: TextFormField(

                          // validator: (v) {
                          //   if (v!.isEmpty || !v.contains('@')) {
                          //     return 'Please enter a valid email!';
                          //   }
                          //   return null;
                          // },

                          cursorColor: Colors.black,
                          decoration: CustomDataField(
                            label: 'Cash',
                          ).dataFieldDecoration(),
                        ),
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Container(
                            width: 200,
                            height: 40.0,
                            color: Colors.white,
                            child: TextFormField(

                              // validator: (v) {
                              //   if (v!.isEmpty || !v.contains('@')) {
                              //     return 'Please enter a valid email!';
                              //   }
                              //   return null;
                              // },

                              cursorColor: Colors.black,
                              decoration: CustomDataField(
                                label: 'Upi',
                              ).dataFieldDecoration(),
                            ),
                          ),
                          Expanded(
                            child: SvgPicture.asset("assets/icon/Paytm-Logo.wine.svg",height: 24,
                            width: 24,),
                          ),
                          Expanded(
                            child: SvgPicture.asset("assets/icon/Google_Pay-Logo.wine.svg",height: 24,
                              width: 24,),
                          ),
                          Expanded(
                            child: SvgPicture.asset("assets/icon/PhonePe-Logo.wine.svg",height: 24,
                              width: 24,),
                          )
                        ],
                      ),
                      SizedBox(height: 16,),
                      Container(
                        width: 200,
                        height: 40.0,
                        color: Colors.white,
                        child: TextFormField(

                          // validator: (v) {
                          //   if (v!.isEmpty || !v.contains('@')) {
                          //     return 'Please enter a valid email!';
                          //   }
                          //   return null;
                          // },

                          cursorColor: Colors.black,
                          decoration: CustomDataField(
                            label: 'Bank',
                          ).dataFieldDecoration(),
                        ),
                      ),
                      SizedBox(height: 16,),
                      Container(
                        width: 200,
                        height: 40.0,
                        color: Colors.white,
                        child: TextFormField(

                          // validator: (v) {
                          //   if (v!.isEmpty || !v.contains('@')) {
                          //     return 'Please enter a valid email!';
                          //   }
                          //   return null;
                          // },

                          cursorColor: Colors.black,
                          decoration: CustomDataField(
                            label: 'Total',
                          ).dataFieldDecoration(),
                        ),
                      ),
                    ],
                  )),
            )



          ],
        ),*/
            ],
          ),
        ),
      ),
    );
  }
}

class UnderLineTextWidget extends StatefulWidget {
  final String text;
  final String data;

  const UnderLineTextWidget(
      {super.key, required this.text, required this.data});

  @override
  State<UnderLineTextWidget> createState() => _UnderLineTextWidgetState();
}

class _UnderLineTextWidgetState extends State<UnderLineTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(widget.text),
        SizedBox(
          width: 24,
        ),
        Container(
          height: 20,
          width: 220,
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 16),
              hintText: widget.data,
              hintStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black.withOpacity(0.40)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black.withOpacity(0.40)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class InvoiceBoxField extends StatelessWidget {
  final String title;

  const InvoiceBoxField({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: selectedColor,
          border:
              Border.all(width: 0.2, color: Colors.black.withOpacity(0.50))),
      child: Center(
          child: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontSize: 13, fontWeight: FontWeight.w900),
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        maxLines: 2,
      )),
    );
  }
}

class ItemRowBilling extends StatelessWidget {
  final String title;
  final Color color;

  const ItemRowBilling({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: color,
          border:
              Border.all(width: 0.2, color: Colors.black.withOpacity(0.50))),
      child: Center(
          child: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontSize: 13, fontWeight: FontWeight.w700),
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        maxLines: 2,
      )),
    );
  }
}

class InvoiceTotalBoxField extends StatelessWidget {
  final String title;

  const InvoiceTotalBoxField({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.80),
          border:
              Border.all(width: 0.2, color: Colors.black.withOpacity(0.50))),
      child: Center(
          child: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontSize: 13, fontWeight: FontWeight.w700),
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        maxLines: 2,
      )),
    );
  }
}

class UnderLineDateWidget extends StatefulWidget {
  final String text;
  final String data;

  const UnderLineDateWidget(
      {super.key, required this.text, required this.data});

  @override
  State<UnderLineDateWidget> createState() => _UnderLineDateWidgetState();
}

class _UnderLineDateWidgetState extends State<UnderLineDateWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(widget.text),
        SizedBox(width: 24),
        Container(
          height: 20,
          width: 220,
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 16),
              hintText: '23/12/2023',
              hintStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              // suffixIcon: Container(
              //   height:60,
              //   width: 40,
              //   child: Icon(Icons.search,
              //   color: Colors.red,),
              // ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black.withOpacity(0.40)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black.withOpacity(0.40)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
