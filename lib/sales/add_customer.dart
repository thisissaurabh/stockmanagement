

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

              AddSupplierRow(
                title: "Bussiness Type",
                child:  Expanded(
                  child: RelationShipCheckBox(
                    relation: businessType.text,
                    onPop: (val ) {
                      setState(() {
                        businessType.text = val;
                      });
                    },
                  ),
                ),),
              SizedBox(height: 16,),


              AddSupplierRow(
                title: 'Customer Name',
                child2: SizedBox(
                  width: 130,
                  height: 40.0,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    // validator: (v) {
                    //   if (v!.isEmpty || !v.contains('@')) {
                    //     return 'Please enter a valid email!';
                    //   }
                    //   return null;
                    // },
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "enter customer name";
                      }
                      return null;
                    },
                    controller: secondName,
                    cursorColor: Colors.black,
                    decoration: CustomDataField(
                      label: 'Second Name',
                    ).dataFieldDecoration(),
                  ),
                ) ,
                child: SizedBox(
                  width: 130,
                  height: 40.0,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: firstName,
                    cursorColor: Colors.black,

                    validator: (v) {
                      if (v!.isEmpty) {
                        return "enter customer name";
                      }
                      return null;
                    },
                    decoration: CustomDataField(
                      label: 'First Name',
                    ).dataFieldDecoration().copyWith(
                      errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16,),
              AddSupplierRow(
                title: 'Company Name',
                child:SizedBox(
                  width: 276,
                  height: 40.0,
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
                      label: 'Company Name',
                    ).dataFieldDecoration(),
                  ),
                ) ,
              ),
              SizedBox(height: 16,),
              AddSupplierRow(
                title: 'Customer Mail',
                child:SizedBox(
                  width: 276,
                  height: 40.0,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) {
                      if (v!.isEmpty || !v.contains('@')) {
                        return 'Please enter email!';
                      }
                      return null;
                    },
                    controller:mail,
                    cursorColor: Colors.black,
                    decoration: CustomDataField(
                      label: 'Email',
                    ).dataFieldDecoration(),
                  ),
                ) ,),
              SizedBox(height: 16,),
              AddSupplierRow(
                title: 'Customer Phone',
                child2: SizedBox(
                  width: 130,
                  height: 40.0,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    // validator: (v) {
                    //   if (v!.isEmpty || !v.contains('@')) {
                    //     return 'Please enter a valid email!';
                    //   }
                    //   return null;
                    // },
                    controller: workNo,
                    cursorColor: Colors.black,
                    decoration: CustomDataField(
                      label: 'Work',
                    ).dataFieldDecoration(),
                  ),
                ) ,
                child: SizedBox(
                  width: 130,
                  height: 40.0,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: mobileNo,
                    cursorColor: Colors.black,
                    decoration: CustomDataField(
                      label: 'Mobile',
                    ).dataFieldDecoration(),
                  ),
                ),
              ),
              SizedBox(height: 24,),
              Text(
                "Other Details",
                style: selectedBoldText,
              ),
              SizedBox(height: 7,),
              CustomHorizontalLine(),
              SizedBox(height: 16,),
              AddSupplierRow(
                title: 'Gst no',
                child:SizedBox(
                  width: 276,
                  height: 40.0,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    // validator: (v) {
                    //   if (v!.isEmpty || !v.contains('@')) {
                    //     return 'Please enter a valid email!';
                    //   }
                    //   return null;
                    // },
                    controller: gstNO,
                    cursorColor: Colors.black,
                    decoration: CustomDataField(
                      label: 'Gst No',
                    ).dataFieldDecoration(),
                  ),
                ) ,
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
              AddSupplierRow(
                title: 'Adress',
                child:Row(
                  children: [
                    SizedBox(
                      width: 276,
                      height: 40.0,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        // validator: (v) {
                        //   if (v!.isEmpty || !v.contains('@')) {
                        //     return 'Please enter a valid email!';
                        //   }
                        //   return null;
                        // },
                        controller: address,
                        cursorColor: Colors.black,
                        decoration: CustomDataField(
                          label: 'Company Adress',
                        ).dataFieldDecoration(),
                      ),
                    ),
                    SizedBox(width: 16,),
                    SizedBox(
                      width: 130,
                      height: 40.0,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        // validator: (v) {
                        //   if (v!.isEmpty || !v.contains('@')) {
                        //     return 'Please enter a valid email!';
                        //   }
                        //   return null;
                        // },
                        controller: city,
                        cursorColor: Colors.black,
                        decoration: CustomDataField(
                          label: 'City',
                        ).dataFieldDecoration(),
                      ),
                    ),
                    SizedBox(width: 16,),
                    SizedBox(
                      width: 130,
                      height: 40.0,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        // validator: (v) {
                        //   if (v!.isEmpty || !v.contains('@')) {
                        //     return 'Please enter a valid email!';
                        //   }
                        //   return null;
                        // },
                        controller: state,
                        cursorColor: Colors.black,
                        decoration: CustomDataField(
                          label: 'State',
                        ).dataFieldDecoration(),
                      ),
                    ),
                  ],
                ) ,
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
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => MultiProvider(
                                  //       providers: [
                                  //         ChangeNotifierProvider(
                                  //           create: (context) => MenuAppController(),
                                  //         ),
                                  //       ],
                                  //       child: MainScreen(),
                                  //     ),
                                  //   ),
                                  // );
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
                        color: bgColor,
                        titleColor: Colors.white,
                      ),
                    SizedBox(width: 5,),
                    if (Responsive.isDesktop(context))
                      MainButton(
                        title: 'Cancel',
                        press: () {  },
                        sizeHorizontal: 30,
                        sizeVerticle: 16,
                        color: purpleColor,
                        titleColor: Colors.white,
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




