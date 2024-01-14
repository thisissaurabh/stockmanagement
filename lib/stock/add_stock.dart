

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
import 'package:spyco_shop_management/widgets/intraction_buttons.dart';
import 'package:spyco_shop_management/widgets/main_button.dart';
import 'package:spyco_shop_management/widgets/snackbar.dart';

import '../api/login_register/add_supplier_api.dart';
import '../api/login_register/get_supplier_api.dart';
import '../api_models/supplier_model.dart';
import 'add_stock_item.dart';

class AddStock extends StatefulWidget {
  const AddStock({super.key});

  @override
  State<AddStock> createState() => _AddStockState();
}

class _AddStockState extends State<AddStock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: context.read<MenuAppController>().scaffoldKey,
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
              child: AddCustomerFields(),
            ),
          ],
        ),
      ),
    );
  }
}


class AddCustomerFields extends StatefulWidget {
  const AddCustomerFields({super.key});

  @override
  State<AddCustomerFields> createState() => _AddCustomerFieldsState();
}

class _AddCustomerFieldsState extends State<AddCustomerFields> {
  final usernameController = TextEditingController();
  // int selectedOption = 1;
  String? selectedOption;
  final GlobalKey<FormState>_formKey =  GlobalKey<FormState>();
  bool isLoading = false;
  final gender = TextEditingController();
  final dateInput = TextEditingController();
  final secondName = TextEditingController();
  final companyName = TextEditingController();
  final mail = TextEditingController();
  final mobileNo = TextEditingController();
  final workNo = TextEditingController();
  final gstNO = TextEditingController();
  final address = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();

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

  final List<String> unit = [
    'mtr',
    'pcs',
    'box',
    'metre',
  ];
  final List<String> codingType = [
    '1. Unique',
    '2. Lot',
    '3. Fixed'

  ];

  String? unitValue;
  String? codingValue;



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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

                      Header(title: "Add Purchase"),
              SizedBox(height: 5,),
              CustomHorizontalLine(),
                  SizedBox(height: 16,),
                  SizedBox(height: 20,),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ElevatedBgCard(
                        radius: 20,
                        child: Column(
                          children: [
                                AddSupplierRow(
                                  title: 'Supplier Name',
                                  child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 40.0,
                                        child:   DropdownButtonHideUnderline(
                                          child: DropdownButton2<String>(
                                            isExpanded: true,
                                            hint: const Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Select Supplier',
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
                                              width: MediaQuery.sizeOf(context).width,
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
                                              width: MediaQuery.sizeOf(context).width,
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
                                      SizedBox(height: 5,),
                                      // MouseHover(
                                      //   child: Row(
                                      //     children: [
                                      //       SvgPicture.asset("assets/icons/add-svgrepo-com.svg",
                                      //         color: Colors.green,),
                                      //       Text("Add new Supplier",
                                      //         style: TextStyle(
                                      //             color: Colors.green
                                      //         ),)
                                      //     ],
                                      //   ),
                                      // ),
                                    ],
                                  ) ,
                                ),
                            SizedBox(height: 10),
                             AddSupplierRow(
                                      title: 'Business Name',
                                      child:Container(
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
                                          controller: companyName,
                                          cursorColor: Colors.black,
                                          decoration: CustomDataField(
                                            label: 'Business Name',
                                          ).dataFieldDecoration(),
                                        ),
                                      ) ,
                                    ),
                            SizedBox(height: 16,),
                            AddSupplierRow(
                              title: 'Short Name',
                              child:Container(
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
                                  controller: companyName,
                                  cursorColor: Colors.black,
                                  decoration: CustomDataField(
                                    label: 'Short Name',
                                  ).dataFieldDecoration(),
                                ),
                              ) ,
                            ),
                            SizedBox(height: 16,),

                            Row(
                              children: [
                                Container(
                                    width: MediaQuery.sizeOf(context).width *0.10,
                                    child: Text("Address")),
                                SizedBox(width: 16,),
                                Expanded(
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          width: 0.5,
                                          color: Colors.black.withOpacity(0.60)
                                      ),
                                    ),


                                  ),
                                ),
                                SizedBox(width: 16,),
                              ],
                            ),

                            SizedBox(height: 16,),
                            AddSupplierRow(
                              title: 'Pin Code',
                              child:Container(
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
                                  controller: companyName,
                                  cursorColor: Colors.black,
                                  decoration: CustomDataField(
                                    label: 'Pin Code',
                                  ).dataFieldDecoration(),
                                ),
                              ) ,
                            ),
                            SizedBox(height: 16,),
                            AddSupplierRow(
                              title: 'City',
                              child:Container(
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
                                  controller: companyName,
                                  cursorColor: Colors.black,
                                  decoration: CustomDataField(
                                    label: 'City',
                                  ).dataFieldDecoration(),
                                ),
                              ) ,
                            ),
                            SizedBox(height: 16,),
                            AddSupplierRow(
                              title: 'State',
                              child:Container(
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
                                  controller: companyName,
                                  cursorColor: Colors.black,
                                  decoration: CustomDataField(
                                    label: 'State',
                                  ).dataFieldDecoration(),
                                ),
                              ) ,
                            ),
                            SizedBox(height: 16,),
                            AddSupplierRow(
                              title: 'Gst No',
                              child:Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: 40.0,
                                color: Colors.white,
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  inputFormatters: [

                                  ],
                                  // validator: (v) {
                                  //   if (v!.isEmpty || !v.contains('@')) {
                                  //     return 'Please enter a valid email!';
                                  //   }
                                  //   return null;
                                  // },
                                  controller: companyName,
                                  cursorColor: Colors.black,
                                  decoration: CustomDataField(
                                    label: 'Gst No',
                                  ).dataFieldDecoration(),
                                ),
                              ) ,
                            ),


                          ],
                        )),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: ElevatedBgCard(
                        radius: 20,
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            AddSupplierRow(
                              title: 'Purchase Invoice No',
                              child:Container(
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
                                  controller: companyName,
                                  cursorColor: Colors.black,
                                  decoration: CustomDataField(
                                    label: 'Purchase Invoice No',
                                  ).dataFieldDecoration(),
                                ),
                              ) ,
                            ),
                            SizedBox(height: 16,),
                            AddSupplierRow(
                              title: 'Challan No',
                              child:Container(
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
                                  controller: companyName,
                                  cursorColor: Colors.black,
                                  decoration: CustomDataField(
                                    label: 'Challan No',
                                  ).dataFieldDecoration(),
                                ),
                              ) ,
                            ),
                            SizedBox(height: 16,),
                        AddSupplierRow(
                                      title: 'Invoice Date',
                                      child:SizedBox(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 40.0,
                                        child: TextFormField(
                                          readOnly: true,


                                          onTap: () async {
                                            DateTime? pickedDate = await showDatePicker(
                                                context: context, initialDate: DateTime.now(),
                                                firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                                lastDate: DateTime(2101)
                                            );

                                            if(pickedDate != null ){
                                              print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                              print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                              //you can implement different kind of Date Format here according to your requirement

                                              setState(() {
                                                dateInput.text = formattedDate; //set output date to TextField value.
                                              });
                                            }else{
                                              print("Date is not selected");
                                            }
                                          },
                                          // validator: (v) {
                                          //   if (v!.isEmpty || !v.contains('@')) {
                                          //     return 'Please enter a valid email!';
                                          //   }
                                          //   return null;
                                          // },
                                          controller: dateInput,
                                          cursorColor: Colors.black,
                                          decoration: CustomDataField(
                                            label: 'Invoice Date',
                                          ).dataFieldDecoration(),
                                        ),
                                      ) ,
                                    ),
                            SizedBox(height: 16,),
                            AddSupplierRow(
                              title: 'Coding Type',
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: 40.0,
                                    child:   DropdownButtonHideUnderline(
                                      child: DropdownButton2<String>(
                                        isExpanded: true,
                                        hint: const Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Coding Type',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        items: codingType
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
                                        value: codingValue,
                                        onChanged: (String? value) {
                                          setState(() {
                                            codingValue = value;
                                          });
                                        },
                                        buttonStyleData: ButtonStyleData(
                                          height: 50,
                                          width: 276,
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
                                  SizedBox(height: 5,),
                                ],
                              ) ,
                            ),
                            SizedBox(height: 16,),
                            Row(
                              children: [
                                Container(
                                    width: MediaQuery.sizeOf(context).width *0.10,
                                    child: Text("Address")),
                                SizedBox(width: 16,),
                                Expanded(
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          width: 0.5,
                                          color: Colors.black.withOpacity(0.60)
                                      ),
                                    ),


                                  ),
                                ),
                                SizedBox(width: 16,),
                              ],
                            ),
                          ],
                        )),
                  ),
                ],
              ),


              GestureDetector(
                onTap: () {
                  print(dateInput.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MultiProvider(
                        providers: [
                          ChangeNotifierProvider(
                            create: (context) => MenuAppController(),
                          ),
                        ],
                        child: AddStockItems(date: dateInput.text,),
                      ),
                    ),
                  );
                },
                child: MouseHover(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Material(
                          elevation: 3,
                          borderRadius: BorderRadius.circular(6),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(6),

                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/icons/right-arrow-svgrepo-com.svg",
                                    height: 24,
                                    width: 24,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 3,),
                                  Text("Add Items",style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              


            ],
          ),
        
        ),
      ),
    );
  }
}


