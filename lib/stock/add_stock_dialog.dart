import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spyco_shop_management/widgets/add_person_row_holder.dart';
import 'package:spyco_shop_management/widgets/snackbar.dart';

import '../constants/colors.dart';
import '../constants/responsive.dart';
import '../constants/text_styles.dart';
import 'package:spyco_shop_management/api/login_register/add_supplier_api.dart';

import '../widgets/custom_textfield.dart';
import '../widgets/intraction_buttons.dart';
import '../widgets/main_button.dart';

class AddStockDialog extends StatefulWidget {
  final String title;
  final String content;

  AddStockDialog({required this.title, required this.content});

  @override
  State<AddStockDialog> createState() => _AddStockDialogState();
}

class _AddStockDialogState extends State<AddStockDialog> {
  final usernameController = TextEditingController();

  // int selectedOption = 1;

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
  final pinCodeController = TextEditingController();
  final List<String> stateList = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
    'Andaman and\n Nicobar Islands',
    'Chandigarh',
    'Dadra and Nagar\n Haveli and Daman and Diu',
    'Lakshadweep',
    'Delhi',
    'Puducherry',
  ];

  String? stateValue;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: MediaQuery.sizeOf(context).width * 0.50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/762836_78 150p-01.jpg",
                    ),
                        fit: BoxFit.cover)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Add Stock",
                    style: pageTitle,),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(20),
                child:SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16,),

                        Row(
                          children: [
                            Expanded(
                              child: AddPersonRowHolder(
                                title: 'Group Name',
                                textField: CustomTextField(
                                  textInputAction: TextInputAction.next,
                                  controller: firstName,
                                  hintText: 'Group Name',

                                  validation:
                                      (val) {
                                    if(val == null || val.isEmpty){
                                      return 'Enter a Group Name ';
                                    }
                                    return null;
                                  },

                                ),),
                            ),
                            SizedBox(width: 12,),
                            Expanded(
                              child: AddPersonRowHolder(
                                title: 'Enter Brand Name',
                                textField: CustomTextField(
                                  textInputAction: TextInputAction.next,
                                  controller: firstName,
                                  hintText: 'Enter Brand Name',

                                  validation:
                                      (val) {
                                    if(val == null || val.isEmpty){
                                      return 'Enter Brand Name ';
                                    }
                                    return null;
                                  },

                                ),),
                            ),
                            SizedBox(width: 12,),
                            Expanded(
                              child: AddPersonRowHolder(
                                title: 'Item Name',
                                textField:   CustomTextField(
                                  textInputAction: TextInputAction.next,
                                  controller: mail,
                                  hintText: 'Item Name',

                                  validation:
                                      (val) {
                                    if(val == null || val.isEmpty){
                                      return 'Enter a Item Name ';
                                    }
                                    return null;
                                  },

                                ),),
                            ),
                          ],
                        ),
                        SizedBox(height: 16,),
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: AddPersonRowHolder(
                                    title: 'Color',
                                    textField: CustomTextField(
                                      textInputAction: TextInputAction.next,
                                      controller: companyName,
                                      hintText: 'Color',
                                      validation:
                                          (val) {
                                        if(val == null || val.isEmpty){
                                          return 'Enter a Color Name ';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12,),
                                Expanded(
                                  child: AddPersonRowHolder(
                                    title: 'Size',
                                    textField:    CustomTextField(
                                      textInputAction: TextInputAction.next,
                                      controller: gstNO,
                                      hintText: 'Size',
                                      validation:
                                          (val) {
                                        if(val == null || val.isEmpty){
                                          return 'Enter a Size';
                                        }
                                        return null;
                                      },

                                    ),),
                                ),
                                SizedBox(width: 12,),
                                Expanded(
                                  child:
                                  AddPersonRowHolder(
                                    title: 'Design Name',
                                    textField:    CustomTextField(
                                      textInputAction: TextInputAction.next,
                                      controller: mobileNo,
                                      hintText: 'Design Name',


                                      validation:
                                          (val) {
                                        if(val == null || val.isEmpty){
                                          return 'Enter a Design Name';
                                        }
                                        return null;
                                      },

                                    ),),
                                ),
                              ],
                            ),
                            SizedBox(height: 16,),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AddPersonRowHolder(
                                title: 'Quantity',
                                textField:    CustomTextField(
                                  textInputAction: TextInputAction.next,
                                  controller: state,
                                  hintText: 'Quantity',

                                  validation:
                                      (val) {
                                    if(val == null || val.isEmpty){
                                      return 'Enter a Quantity';
                                    }
                                    return null;
                                  },

                                ),
                              ),
                            ),
                            SizedBox(width: 12,),
                            Expanded(

                              child: AddPersonRowHolder(
                                title: 'Unit',
                                textField:     CustomTextField(
                                  textInputAction: TextInputAction.next,
                                  controller: city,
                                  hintText: 'Unit',

                                  validation:
                                      (val) {
                                    if(val == null || val.isEmpty){
                                      return 'Enter a Unit';
                                    }
                                    return null;
                                  },

                                ),),

                            ),
                            SizedBox(width: 12,),
                            Expanded(
                              child: AddPersonRowHolder(
                                title: 'Hsn Code',
                                textField:    CustomTextField(
                                  textInputAction: TextInputAction.next,
                                  controller: state,
                                  hintText: 'Hsn Code',

                                  validation:
                                      (val) {
                                    if(val == null || val.isEmpty){
                                      return 'Enter a Hsn Code';
                                    }
                                    return null;
                                  },

                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 16,),
                        Row(
                          children: [
                            Expanded(
                              child: AddPersonRowHolder(
                                title: 'Purchase Price',
                                textField:    CustomTextField(
                                  textInputAction: TextInputAction.next,
                                  controller: state,
                                  hintText: 'Purchase Price',

                                  validation:
                                      (val) {
                                    if(val == null || val.isEmpty){
                                      return 'Enter a Purchase Price';
                                    }
                                    return null;
                                  },

                                ),
                              ),
                            ),
                            SizedBox(width: 12,),
                            Expanded(

                              child: AddPersonRowHolder(
                                title: 'Discount %',
                                textField:     CustomTextField(
                                  textInputAction: TextInputAction.next,
                                  controller: city,
                                  hintText: 'Discount %',

                                  validation:
                                      (val) {
                                    if(val == null || val.isEmpty){
                                      return 'Discount %';
                                    }
                                    return null;
                                  },

                                ),),

                            ),
                            SizedBox(width: 12,),
                            Expanded(

                              child: AddPersonRowHolder(
                                title: 'Tax %',
                                textField:     CustomTextField(
                                  textInputAction: TextInputAction.next,
                                  controller: city,
                                  hintText: 'Tax %',

                                  validation:
                                      (val) {
                                    if(val == null || val.isEmpty){
                                      return 'Tax %';
                                    }
                                    return null;
                                  },

                                ),),

                            ),
                          ],
                        ),
                        SizedBox(height: 16,),
                        Row(
                          children: [
                            Expanded(
                              child: AddPersonRowHolder(
                                title: 'Set Mrp',
                                textField:    CustomTextField(
                                  textInputAction: TextInputAction.next,
                                  controller: state,
                                  hintText: 'Set Mrp',

                                  validation:
                                      (val) {
                                    if(val == null || val.isEmpty){
                                      return 'Set Mrp';
                                    }
                                    return null;
                                  },

                                ),
                              ),
                            ),
                            SizedBox(width: 12,),
                            Expanded(

                              child: AddPersonRowHolder(
                                title: 'Barcode Type',
                                textField:     CustomTextField(
                                  textInputAction: TextInputAction.next,
                                  controller: city,
                                  hintText: 'barcode Type',

                                  validation:
                                      (val) {
                                    if(val == null || val.isEmpty){
                                      return 'Barcode';
                                    }
                                    return null;
                                  },

                                ),),

                            ),
                            SizedBox(width: 12,),
                            Expanded(

                              child: AddPersonRowHolder(
                                title: 'Tax %',
                                textField:     CustomTextField(
                                  textInputAction: TextInputAction.next,
                                  controller: city,
                                  hintText: 'Tax %',

                                  validation:
                                      (val) {
                                    if(val == null || val.isEmpty){
                                      return 'Tax %';
                                    }
                                    return null;
                                  },

                                ),),

                            ),
                          ],
                        ),
                        SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (Responsive.isDesktop(context))
                              isLoading ?
                              LoadingButton():
                              MainButton(
                                radius: 4,
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
                                sizeVerticle: 8,
                                color: selectedGreenColor,
                                titleColor: Colors.white,
                              ),
                            SizedBox(width: 5,),
                            MainButton(
                              radius: 4,
                              title: 'Cancel',
                              press: () {
                                Navigator.pop(context);
                              },
                              sizeHorizontal: 18,
                              sizeVerticle: 8,
                              color: Colors.grey.withOpacity(0.10),
                              titleColor: Colors.black,
                            ),
                          ],
                        ),



                      ],
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
