

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:spyco_shop_management/api/login_register/get_supplier_details_api.dart';
import 'package:spyco_shop_management/api/login_register/get_supplier_name_api.dart';
import 'package:spyco_shop_management/api_models/supplier_details_model.dart';
import 'package:spyco_shop_management/api_models/supplier_name_model.dart';
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
import 'package:spyco_shop_management/widgets/loading.dart';
import 'package:spyco_shop_management/widgets/main_button.dart';
import 'package:spyco_shop_management/widgets/snackbar.dart';

import '../api/login_register/add_supplier_api.dart';
import '../api/login_register/get_supplier_api.dart';
import '../api_models/supplier_model.dart';
import '../widgets/custom_textfield.dart';
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
  final supplierNameController = TextEditingController();
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
  final purchaseInvoiceController = TextEditingController();
  final challanController = TextEditingController();
  final codingTypeController = TextEditingController();
  final remarksController = TextEditingController();

  // final List<String> items = [
  //   'Item1',
  //   'Item2',
  //   'Item3',
  //   'Item4',
  //   'Item5',
  //   'Item6',
  //   'Item7',
  //   'Item8',
  // ];
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



  List<SupplierNameModel> suppliersName = [];
  // List<SupplierDetailsModel> suppliersDetails = [];
  SupplierDetailsModel? suppliersDetails;

  @override
  void initState() {
    getSupplierName();
    super.initState();
  }






  getSupplierName() {
    isLoading = true;
    var resp = getSupplierNameApi();
    resp.then((value) {
      if (value['status'] == 1) {
        for(var v in value['AllsupplierData']) {
          suppliersName.add(SupplierNameModel.fromJson(v));
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
    return isLoading ?
    Loading() :
    SingleChildScrollView(
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          color: Colors.transparent,
                                          width: MediaQuery.sizeOf(context).width * 0.10,
                                          child: Text("Supplier Name"),
                                        ),
                                        SizedBox(width: 16),
                                        Expanded(
                                          child: DropdownButtonFormField<String>(
                                            value: supplierNameController.text.isNotEmpty ?
                                            supplierNameController.text :
                                            suppliersName.isNotEmpty ?
                                            suppliersName[0].firstName.toString() :
                                            null,
                                            items: suppliersName.map<DropdownMenuItem<String>>((supplier) {
                                              return DropdownMenuItem<String>(
                                                value: supplier.firstName.toString(),
                                                child: Text(supplier.firstName.toString()),
                                              );
                                            }).toList(),
                                            onChanged: (String? value) {
                                              int selectedIndex = suppliersName.indexWhere((supplier) => supplier.firstName.toString() == value);
                                              if (selectedIndex != -1) {
                                                setState(() {
                                                  supplierNameController.text = value!;

                                                  var resp = getSupplierDetailsApi(
                                                      id: suppliersName[selectedIndex].id.toString());
                                                  isLoading = true;
                                                  resp.then((value) {
                                                    if (value['status'] == 1) {
                                                      suppliersDetails = SupplierDetailsModel.fromJson(value);
                                                    }

                                                    setState(() {
                                                      isLoading = false;
                                                    });

                                                    if (value['status'] != 1) {
                                                      print("error");
                                                    }
                                                  });

                                                  // Add your logic here if needed
                                                });
                                              }
                                            },

                                            decoration: InputDecoration(
                                              hintText: supplierNameController.text.isEmpty
                                                  ? "Select Supplier"
                                                  : supplierNameController.text,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.yellow,
                                                  width: 0.5,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(6),
                                                borderSide:
                                                BorderSide(color: Colors.black.withOpacity(0.60), width: 0.5),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.red, width: 0.5),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(6),
                                                borderSide: BorderSide(color: Colors.blue, width: 0.5),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
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
                                ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.sizeOf(context).width *0.10,
                                    child: Text("Business Name")),
                                SizedBox(width: 16,),

                                Expanded(
                                  child: CustomTextField(
                                    controller: companyName,
                                    readOnly: true,
                                    hintText:
                                        suppliersDetails == null ?
                                            "Company Name":
                                    suppliersDetails!.data!.companyName.toString(),
                                    validation:
                                    (val) {},
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: 16,),
                            Row(
                              children: [
                                Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.sizeOf(context).width *0.10,
                                    child: Text("Short Name")),
                                SizedBox(width: 16,),

                                Expanded(
                                  child: CustomTextField(
                                    readOnly: true,
                                    hintText: suppliersDetails == null ?
                                    "Short Name":
                                    suppliersDetails!.data!.firstName.toString(),
                                    validation:
                                        (val) {},

                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: 16,),
                            Row(
                              children: [
                                Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.sizeOf(context).width *0.10,
                                    child: Text("Address")),
                                SizedBox(width: 16,),

                                Expanded(
                                  child: CustomTextField(
                                    verticlePadding: 10,
                                    maxLines: 4,
                                    readOnly: true,
                                    hintText: suppliersDetails == null ?
                                    "Address":
                                    suppliersDetails!.data!.companyAddress.toString(),
                                    validation:
                                        (val) {},

                                  ),
                                ),

                              ],
                            ),



                            SizedBox(height: 16,),
                            Row(
                              children: [
                                Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.sizeOf(context).width *0.10,
                                    child: Text("Pin Code")),
                                SizedBox(width: 16,),

                                Expanded(
                                  child: CustomTextField(
                                    readOnly: true,
                                    hintText: suppliersDetails == null ?
                                    "Pin Code":
                                    suppliersDetails!.data!.companyAddress.toString(),
                                    validation:
                                        (val) {},

                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: 16,),
                            Row(
                              children: [
                                Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.sizeOf(context).width *0.10,
                                    child: Text("City")),
                                SizedBox(width: 16,),

                                Expanded(
                                  child: CustomTextField(
                                    readOnly: true,
                                    hintText: suppliersDetails == null ?
                                    "City":
                                    suppliersDetails!.data!.city.toString(),
                                    validation:
                                        (val) {},

                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 16,),

                            Row(
                              children: [
                                Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.sizeOf(context).width *0.10,
                                    child: Text("State")),
                                SizedBox(width: 16,),

                                Expanded(
                                  child: CustomTextField(
                                    readOnly: true,
                                    hintText: suppliersDetails == null ?
                                    "State":
                                    suppliersDetails!.data!.state.toString(),
                                    validation:
                                        (val) {},

                                  ),
                                ),

                              ],
                            ),

                            SizedBox(height: 16,),

                            Row(
                              children: [
                                Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.sizeOf(context).width *0.10,
                                    child: Text("Gst No")),
                                SizedBox(width: 16,),

                                Expanded(
                                  child: CustomTextField(
                                    readOnly: true,
                                    hintText: suppliersDetails == null ?
                                    "Gst No":
                                    suppliersDetails!.data!.gstNo.toString(),
                                    validation:
                                        (val) {},

                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: ElevatedBgCard(
                        radius: 20,
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.sizeOf(context).width *0.10,
                                    child: Text("Invoice No")),
                                SizedBox(width: 16,),

                                Expanded(
                                  child: CustomTextField(
                                    controller: purchaseInvoiceController,
                                    hintText: 'Purchase Invoice No',
                                    validation:
                                        (val) {
                                      if(val == null || val.isEmpty){
                                        return 'Enter a Purchase Invoice No';
                                      }
                                      return null;
                                    },

                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: 16,),
                            Row(
                              children: [
                                Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.sizeOf(context).width *0.10,
                                    child: Text("Challan No")),
                                SizedBox(width: 16,),

                                Expanded(
                                  child: CustomTextField(
                                    controller: challanController,
                                    hintText: 'Challan No',
                                    validation:
                                        (val) {
                                      if(val == null || val.isEmpty){
                                        return 'Enter a Challan No';
                                      }
                                      return null;
                                    },

                                  ),
                                ),

                              ],
                            ),

                            SizedBox(height: 16,),
                            SizedBox(height: 16,),
                          ],
                        ),
                      ),
                    ),
                 ],
              ),


              GestureDetector(
                onTap: () {
                  // if(_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MultiProvider(
                          providers: [
                            ChangeNotifierProvider(
                              create: (context) => MenuAppController(),
                            ),
                          ],
                          child: AddStockItems(
                            date: dateInput.text,
                            supplierId: suppliersDetails!.data!.id.toString(),
                            purchaseInvoiceNo: purchaseInvoiceController.text,
                            challanNo: challanController.text,
                            supplierName: supplierNameController.text,
                            supplierBusinessName:suppliersDetails!.data!.companyName.toString(),
                            gstNo:suppliersDetails!.data!.gstNo.toString(),),
                        ),
                      ),
                    );
                  // }
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


