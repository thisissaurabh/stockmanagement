import 'package:flutter/material.dart';
import 'package:spyco_shop_management/widgets/add_person_row_holder.dart';
import 'package:spyco_shop_management/widgets/snackbar.dart';

import '../constants/colors.dart';
import '../constants/responsive.dart';
import '../constants/text_styles.dart';
import 'custom_textfield.dart';
import 'intraction_buttons.dart';
import 'main_button.dart';
import 'package:spyco_shop_management/api/login_register/add_supplier_api.dart';

class CustomDialog extends StatefulWidget {
  final String title;
  final String content;

  CustomDialog({required this.title, required this.content});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: 600,
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
                  child: Text("Add Supplier",
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
                       Text("Business Type",
                           style: textfieldTopText),
                       SizedBox(height: 10,),
                       RelationShipCheckBox(
                         relation: businessType.text,
                         onPop: (val ) {
                           setState(() {
                             businessType.text = val;
                             print("dhdhdhdhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
                             print(businessType.text);
                           });
                         },
                       ),
                       SizedBox(height: 16,),

                       AddPersonRowHolder(
                         title: 'Supplier Name',
                         textField: CustomTextField(
                                 textInputAction: TextInputAction.next,
                                 controller: firstName,
                                 hintText: 'First Name',

                                 validation:
                                     (val) {
                                   if(val == null || val.isEmpty){
                                     return 'Enter a Supplier Name ';
                                   }
                                   return null;
                                 },

                               ),),
                       SizedBox(height: 16,),
                       Row(
                         children: [
                           Expanded(
                             child: AddPersonRowHolder(
                               title: 'Supplier mail',
                               textField:   CustomTextField(
                                     textInputAction: TextInputAction.next,
                                     controller: mail,
                                     hintText: 'Supplier Mail',

                                     validation:
                                         (val) {
                                       if(val == null || val.isEmpty){
                                         return 'Enter a Supplier Mail ';
                                       }
                                       return null;
                                     },

                                   ),),
                           ),
                           SizedBox(width: 12,),
                           Expanded(
                             child:
                             AddPersonRowHolder(
                               title: 'Contact No',
                               textField:    CustomTextField(
                                 textInputAction: TextInputAction.next,
                                 controller: mobileNo,
                                 hintText: 'Contact No',


                                 validation:
                                     (val) {
                                   if(val == null || val.isEmpty){
                                     return 'Enter a Contact NO';
                                   }
                                   return null;
                                 },

                               ),),
                           ),
                         ],
                       ),
                       SizedBox(height: 16,),
                       businessType.text.contains("individual") ?
                           SizedBox() :
                       Column(
                         children: [
                           Row(
                             children: [
                               Expanded(
                                 child: AddPersonRowHolder(
                                   title: 'Bussines Name',
                                   textField: CustomTextField(
                                     textInputAction: TextInputAction.next,
                                     controller: companyName,
                                     hintText: 'Bussiness Name',

                                     validation:
                                         (val) {
                                       if(val == null || val.isEmpty){
                                         return 'Enter a Bussiness Name ';
                                       }
                                       return null;
                                     },

                                   ),
                                 ),
                               ),
                               SizedBox(width: 12,),
                               Expanded(
                                 child: AddPersonRowHolder(
                                   title: 'Gst No',
                                   textField:  CustomTextField(
                                     textInputAction: TextInputAction.next,
                                     controller: gstNO,
                                     hintText: 'Gst No',

                                     validation:
                                         (val) {
                                       if(val == null || val.isEmpty){
                                         return 'Enter a Supplier Gst No';
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


                       AddPersonRowHolder(
                         title: 'Address',
                         textField:     CustomTextField(
                           textInputAction: TextInputAction.next,
                           controller: address,
                           hintText: 'Address',

                           validation:
                               (val) {
                             if(val == null || val.isEmpty){
                               return 'Enter a Company Address';
                             }
                             return null;
                           },

                         ),),
                       SizedBox(height: 16,),
                       Row(
                         children: [
                           Expanded(
                             child: AddPersonRowHolder(
                               title: 'State',
                               textField:    CustomTextField(
                                 tap: () {},
                                 onChanged: (val) {},
                                     textInputAction: TextInputAction.next,
                                     controller: state,
                                     hintText: 'State',

                                     validation:
                                         (val) {
                                       if(val == null || val.isEmpty){
                                         return 'Enter a State';
                                       }
                                       return null;
                                     },

                                   ),
                             ),
                           ),
                           SizedBox(width: 12,),
                           Expanded(

                             child: AddPersonRowHolder(
                               title: 'City',
                               textField:     CustomTextField(
                                 textInputAction: TextInputAction.next,
                                 controller: city,
                                 hintText: 'City',

                                 validation:
                                     (val) {
                                   if(val == null || val.isEmpty){
                                     return 'Enter a City';
                                   }
                                   return null;
                                 },

                               ),),

                           ),
                         ],
                       ),
                       SizedBox(height: 16,),
                       AddPersonRowHolder(
                         title: 'Pincode',
                         textField:    CustomTextField(
                           textInputAction: TextInputAction.next,
                           controller:pinCodeController ,
                           hintText: 'Pincode',

                           validation:
                               (val) {
                             if(val == null || val.isEmpty){
                               return 'Enter Pincode';
                             }
                             return null;
                           },
                         ),),
                       SizedBox(height: 40,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.end,
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
                                       userType: 'supplier',
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
                                       Navigator.pop(context);
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
                                       Navigator.pop(context);
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
