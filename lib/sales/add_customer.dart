

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/constants/responsive.dart';
import 'package:spyco_shop_management/constants/textfield_decoration.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';
import 'package:spyco_shop_management/controllers/MenuAppController.dart';
import 'package:spyco_shop_management/screens/dashboard/components/header.dart';
import 'package:spyco_shop_management/screens/main/components/side_menu.dart';
import 'package:spyco_shop_management/widgets/global_widgets.dart';
import 'package:spyco_shop_management/widgets/globals.dart';
import 'package:spyco_shop_management/widgets/intraction_buttons.dart';
import 'package:spyco_shop_management/widgets/main_button.dart';
import 'package:spyco_shop_management/widgets/snackbar.dart';

import '../api/login_register/add_supplier_api.dart';
import '../widgets/custom_textfield.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
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
              flex: 4,
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
  final businessType = TextEditingController();
  final firstName = TextEditingController();
  final secondName = TextEditingController();
  final companyName = TextEditingController();
  final mail = TextEditingController();
  final mobileNo = TextEditingController();
  final workNo = TextEditingController();
  final gstNO = TextEditingController();
  final address = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(title: "Add Customer"),
              SizedBox(height: 5,),
              CustomHorizontalLine(),
              SizedBox(height: 16,),
              SizedBox(height: 20,),

          Row(
            children: [
              Container(
                  color: Colors.transparent,
                  width: MediaQuery.sizeOf(context).width *0.10,
                  child: Text("Bussiness Type")),
              SizedBox(width: 16,),
              Expanded(
                child: RelationShipCheckBox(
                  relation: businessType.text,
                  onPop: (val ) {
                    setState(() {
                      businessType.text = val;
                    });
                  },
                ),
              ),
              SizedBox(width: 16,),
            ],
          ),

              SizedBox(height: 16,),
              Row(
                children: [
                  Container(
                      color: Colors.transparent,
                      width: MediaQuery.sizeOf(context).width *0.10,
                      child: Text("Customer Name")),
                  SizedBox(width: 16,),

                  Expanded(
                    child: CustomTextField(
                      controller: firstName,
                      hintText: 'First Name',
                      validation:
                          (val) {
                        if(val == null || val.isEmpty){
                          return 'Enter a Customer Name ';
                        }
                        return null;
                      },

                    ),
                  ),
                  SizedBox(width: 13,),
                  Expanded(
                    child: CustomTextField(
                      controller: secondName,
                      hintText: 'Second Name',
                      validation:
                          (val) {
                        if(val == null || val.isEmpty){
                          return 'Enter a Second Name ';
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
                      child: Text("Business Name")),
                  SizedBox(width: 16,),

                  Expanded(
                    child: CustomTextField(
                      controller: companyName,
                      hintText: 'Business Name',
                      validation:
                          (val) {
                        if(val == null || val.isEmpty){
                          return 'Enter a Customer Business Name ';
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
                      child: Text("Customer Mail")),
                  SizedBox(width: 16,),

                  Expanded(
                    child: CustomTextField(
                      controller: mail,
                      hintText: 'Customer Mail',
                      validation:
                          (val) {
                        if(val == null || val.isEmpty){
                          return 'Enter a Customer Mail ';
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
                      child: Text("Customer Phone")),
                  SizedBox(width: 16,),

                  Expanded(
                    child: CustomTextField(
                      controller: mobileNo,
                      hintText: 'Mobile',
                      validation:
                          (val) {
                        if(val == null || val.isEmpty){
                          return 'Enter a Customer Mobile No ';
                        }
                        return null;
                      },

                    ),
                  ),
                  SizedBox(width: 13,),
                  Expanded(
                    child: CustomTextField(
                      controller: workNo,
                      hintText: 'Work',
                      validation:
                          (val) {
                        if(val == null || val.isEmpty){
                          return 'Enter a Customer Work No ';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24,),
              Text(
                "Other Details",
                style: selectedBoldText,
              ),
              SizedBox(height: 7,),
              CustomHorizontalLine(),
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
                      controller: gstNO,
                      hintText: 'Gst NO',
                      validation:
                          (val) {
                        if(val == null || val.isEmpty){
                          return 'Enter a Gst No ';
                        }
                        return null;
                      },

                    ),
                  ),

                ],
              ),

              // SizedBox(
              //   width: 276,
              //   child: TextFormField(
              //     validator: (value) {
              //       if (value != null && value.trim().length < 3) {
              //         return 'This field requires a minimum of 3 characters';
              //       }
              //
              //       return null;
              //     },
              //     decoration: const InputDecoration(
              //       contentPadding: EdgeInsets.symmetric(vertical: 12),
              //         labelText: 'Enter Your Name',
              //         labelStyle: TextStyle(color: Colors.red),
              //
              //         // This is the normal border
              //         border: OutlineInputBorder(),
              //
              //         // This is the error border
              //         errorBorder: OutlineInputBorder(
              //             borderSide: BorderSide(color: Colors.red, width: 1))),
              //   ),
              // ),
              SizedBox(height: 16,),
              Row(
                children: [
                  Container(
                      color: Colors.transparent,
                      width: MediaQuery.sizeOf(context).width *0.10,
                      child: Text("Address")),
                  SizedBox(width: 16,),

                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: address,
                            hintText: 'Address',
                            validation:
                                (val) {
                              if(val == null || val.isEmpty){
                                return 'Enter a Supplier Adress ';
                              }
                              return null;
                            },

                          ),
                        ),
                        SizedBox(width: 16,),
                        Expanded(
                          child: CustomTextField(
                            controller: city,
                            hintText: 'City',
                            validation:
                                (val) {
                              if(val == null || val.isEmpty){
                                return 'Enter a Supplier City ';
                              }
                              return null;
                            },

                          ),
                        ),
                        SizedBox(width: 16,),
                        Expanded(
                          child: CustomTextField(
                            controller: state,
                            hintText: 'State',
                            validation:
                                (val) {
                              if(val == null || val.isEmpty){
                                return 'Enter a Supplier State ';
                              }
                              return null;
                            },

                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    if (Responsive.isDesktop(context))
                      isLoading ?
                          LoadingButton():
                      MainButton(
                        title: 'Add',
                          press: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              addCustomerSupplierApi(
                                  businessType: businessType.text.isEmpty ?
                                  'individual' :
                                  businessType.text,
                                  userType: 'customer',
                                  firstName: firstName.text,
                                  secondName: secondName.text.isEmpty ?
                                  'user' : secondName.text,
                                  companyName: companyName.text.isEmpty ?
                                  "Nil" : companyName.text,
                                  mail: mail.text.isEmpty ?
                                  "Nil" :
                                  mail.text,
                                  phoneNo: mobileNo.text.isEmpty ?
                                  "0000000000" : mobileNo.text,
                                  workNo: workNo.text.isEmpty ?
                                  "Nil" : workNo.text,
                                  otherDetails: 'nil',
                                  gstNo: gstNO.text.isEmpty ?
                                  "Nil" :
                                  gstNO.text,
                                  companyAddress: address.text.isEmpty ?
                                  "Nil" : address.text,
                                  city: city.text.isEmpty ?
                                  "Nil" : city.text.isEmpty ?
                                  "Nil" : city.text,
                                  state: state.text.isEmpty ?
                                      "Nil" :
                                      state.text
                                 )
                                  .then((value) async {
                                    isLoading = false;
                                if (value['status'] == 1) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  CustomSnackbar.show(
                                      context: context,
                                      label: 'Success',
                                      color: Colors.green,
                                      iconImage: "assets/icons/tick.svg");
                                } else {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  CustomSnackbar.show(
                                      context: context,
                                      label: 'Failed',
                                      color: Colors.red,
                                      iconImage: "assets/icons/cross.svg");
                                  // print("no");
                                }
                              });
                            } else {
                              CustomSnackbar.show(
                                  context: context,
                                  label: 'Failed',
                                  color: Colors.red,
                                  iconImage: "assets/icons/cross.svg");
                            }
                          },
                        sizeHorizontal: 30,
                        sizeVerticle: 16,
                        color: selectedColor,
                        titleColor: Colors.black
                      ),
                    SizedBox(width: 5,),
                    if (Responsive.isDesktop(context))
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                width: 0.5,
                                color: selectedColor
                            )
                        ),
                        child: Row(
                          children: [
                            Text("Cancel")
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




