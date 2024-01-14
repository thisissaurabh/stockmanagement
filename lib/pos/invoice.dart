
import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/constants/responsive.dart';
import 'package:spyco_shop_management/constants/textfield_decoration.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';
import 'package:spyco_shop_management/controllers/MenuAppController.dart';
import 'package:spyco_shop_management/screens/dashboard/components/header.dart';
import 'package:spyco_shop_management/screens/main/components/side_menu.dart';
import 'package:spyco_shop_management/widgets/cards.dart';
import 'package:spyco_shop_management/widgets/global_widgets.dart';
import 'package:spyco_shop_management/widgets/globals.dart';


class Invoice extends StatefulWidget {


  const Invoice({super.key, });

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: context.read<MenuAppController>().scaffoldKey,
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
              child:BillingWindow()
            ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    SvgPicture.asset("assets/icons/arrow-back-basic-svgrepo-com.svg",
                      height: 32,
                      width: 32,),
                    SizedBox(width: 8,),
                    Text("Billing",
                      style: TextStyle(
                          fontSize: 32,
                        fontWeight: FontWeight.w700
                      ),)
                  ],
                ),
              ),
              SizedBox(height: 5,),
              CustomHorizontalLine(),
              SizedBox(height: 32,),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 300,
                      height: 40.0,
                      child:   DropdownButtonHideUnderline(
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
                            padding: const EdgeInsets.only(left: 14, right: 14),
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
                  SizedBox(width: 30,),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 40.0,
                      color: Colors.white,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
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
                  ),
                  SizedBox(width: 30,),
                  Expanded(
                    flex: 3,
                      child: Container(
                        // height: 23,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UnderLineTextWidget(text: 'Invoice No', data: '1',),
                            SizedBox(height: 24,),
                            UnderLineTextWidget(text: 'Invoice Date', data: '24/10/2023',),


                          ],
                        ),
                      ),
                  )
                ],
              ),
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
  const UnderLineTextWidget({super.key, required this.text, required this.data});

  @override
  State<UnderLineTextWidget> createState() => _UnderLineTextWidgetState();
}

class _UnderLineTextWidgetState extends State<UnderLineTextWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(widget.text),
          SizedBox(width: 24,),
          Container(
            width: 220,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 6),
                      hintText: widget.data, hintStyle: TextStyle(
                        color: Colors.black,fontWeight: FontWeight.w500,
                    ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black.withOpacity(0.40)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black.withOpacity(0.40)),
                      ),

                    ),
                  )
                ],
              ),

            ),
          ),
        ],
      ),
    );
  }
}
