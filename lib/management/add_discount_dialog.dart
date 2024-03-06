import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:spyco_shop_management/widgets/add_person_row_holder.dart';
import 'package:spyco_shop_management/widgets/snackbar.dart';
import '../../api/login_register/add_user_api.dart';
import '../../constants/colors.dart';
import '../../constants/responsive.dart';
import '../../constants/text_styles.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/global_widgets.dart';

import '../../widgets/main_button.dart';
import '../api/salesperson_api.dart';
import '../screens/users/add_users.dart';
import '../widgets/loading.dart';


class AddDiscountDialog extends StatefulWidget {
  final String title;
  final String content;

  AddDiscountDialog({required this.title, required this.content});

  @override
  State<AddDiscountDialog> createState() => _AddDiscountDialogState();
}

class _AddDiscountDialogState extends State<AddDiscountDialog> {
  final usernameController = TextEditingController();

  // int selectedOption = 1;

  // int selectedOption = 1;
  String? selectedOption;
  final GlobalKey<FormState>_formKey =  GlobalKey<FormState>();
  bool isLoading = false;
  final titleController = TextEditingController();
  final typeNoController = TextEditingController();
  final amountController = TextEditingController();
  final appliesController = TextEditingController();
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();



  DateTime selectedDate = DateTime.now();

  String dateFormat = '';
  @override
  void initState() {
    // TODO: implement initState

    // getBrand();
    super.initState();
    selectedDate = DateTime.now();

    dateFormat = DateFormat(
        'dd-MM-yyyy'
    )
        .format(
        selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: 600,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: selectedGreenColor
                  // image: DecorationImage(image: AssetImage("assets/images/762836_78 150p-01.jpg",
                  // ),
                  //     fit: BoxFit.cover)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("Add Discount",
                          style: pageTitle.copyWith(color: Colors.white),),
                      ),
                    ],
                  ),
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
                                title: 'Title',
                                textField: CustomTextField(
                                  textInputAction: TextInputAction.next,
                                  controller: titleController,
                                  hintText: 'Title',

                                  validation:
                                      (val) {
                                    if(val == null || val.isEmpty){
                                      return 'Enter a Title ';
                                    }
                                    return null;
                                  },

                                ),),
                            ),
                            SizedBox(width: 12,),
                            Expanded(
                              child: AddPersonRowHolder(
                                title: 'Type',
                                textField: CustomTextField(
                                  textInputAction: TextInputAction.next,
                                  controller: typeNoController,
                                  hintText: 'Type',
                                  validation:
                                      (val) {
                                    if(val == null || val.isEmpty){
                                      return 'Type ';
                                    }
                                    return null;
                                  },
                                ),
                              ),)
                          ],
                        ),
                        SizedBox(height: 16,),
                        Row(
                          children: [
                            Expanded(
                              child: AddPersonRowHolder(
                                title: 'Amount',
                                textField:   CustomTextField(
                                  textInputAction: TextInputAction.next,
                                  controller: amountController,
                                  hintText: 'Amount',

                                  validation:
                                      (val) {
                                    if(val == null || val.isEmpty){
                                      return 'Amount' ;
                                    }
                                    return null;
                                  },

                                ),),
                            ),
                            SizedBox(width: 12,),
                            Expanded(
                              child:
                              AddPersonRowHolder(
                                title: 'Applies To',
                                textField:    CustomTextField(
                                  textInputAction: TextInputAction.next,
                                  controller: appliesController,
                                  hintText: 'Applies To',


                                  validation:
                                      (val) {
                                    if(val == null || val.isEmpty){
                                      return 'Enter Applies To';
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
                                title: 'Start Date',
                                textField:   CustomTextField(
                                  tap: () async {
                                    final DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate,
                                      firstDate: DateTime(2000), // Set your desired starting date
                                      lastDate: DateTime(2101),  // Set your desired ending date
                                    );
                                    if (picked != null && picked != selectedDate) {
                                      setState(() {
                                        selectedDate = picked;

                                        dateFormat = DateFormat(
                                            'dd-MM-yyyy'
                                        )
                                            .format(
                                            selectedDate);
                                      });
                                    }
                                    String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate!);
                                  },
                                  readOnly: true,
                                  onChanged: (val) {
                                    setState(() {
                                      startDateController.text = dateFormat;
                                    });
                                  },
                                  textInputAction: TextInputAction.next,
                                  controller: startDateController,
                                  hintText:' formattedDate.toString()',
                                  validation:
                                      (val) {
                                    if(val == null || val.isEmpty){
                                      return 'Enter Start Date' ;
                                    }
                                    return null;
                                  },

                                ),),
                            ),
                            SizedBox(width: 12,),
                            Expanded(
                              child:
                              AddPersonRowHolder(
                                title: 'End Date',
                                textField:    CustomTextField(
                                  textInputAction: TextInputAction.next,
                                  controller: endDateController,
                                  hintText: 'End Date',


                                  validation:
                                      (val) {
                                    if(val == null || val.isEmpty){
                                      return 'End Date';
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
                                 /*   addSalesPersonApi(
                                      name: nameController.text,
                                      email: emailController.text,
                                      phone: phoneNoController.text,
                                      photo: pickedImage.path,
                                    ).then((value) async {
                                      isLoading = false;
                                      if (value['status'] == 1) {
                                        setState(() {
                                          isLoading = false;
                                          isLoading ? Loading() : getSalesPersonApi();
                                        });

                                        CustomSnackbar.show(
                                            context: context,
                                            label: 'Success',
                                            color: Colors.green,
                                            iconImage: "assets/icons/tick.svg");
                                        Navigator.pop(context);
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
                                    });*/


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
