import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
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


class AddSalesPersonDialog extends StatefulWidget {
  final String title;
  final String content;

  AddSalesPersonDialog({required this.title, required this.content});

  @override
  State<AddSalesPersonDialog> createState() => _AddSalesPersonDialogState();
}

class _AddSalesPersonDialogState extends State<AddSalesPersonDialog> {
  final usernameController = TextEditingController();

  // int selectedOption = 1;

  // int selectedOption = 1;
  String? selectedOption;
  final GlobalKey<FormState>_formKey =  GlobalKey<FormState>();
  bool isLoading = false;
  final nameController = TextEditingController();
  final phoneNoController = TextEditingController();
  final emailController = TextEditingController();
  final imageController = TextEditingController();

  String? stateValue;
  File pickedImage = File("");
  final ImagePicker _imgPicker = ImagePicker();

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
                        child: Text("Add",
                          style: pageTitle.copyWith(color: Colors.white),),
                      ),
                      Spacer(),
                      Expanded(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                XFile? v = await _imgPicker.pickImage(
                                    maxWidth: 90,
                                    maxHeight: 90,
                                    source: ImageSource.gallery);
                                if (v != null) {
                                  setState(
                                        () {
                                      pickedImage = File(v.path);
                                      imageController.text = pickedImage.toString();

                                    },
                                  );
                                }

                              },
                              child: MouseHover(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(16)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Ionicons.push_outline,
                                      size: 24,
                                      color: Colors.white,),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              height:MediaQuery.sizeOf(context).height * 0.15,
                              width: MediaQuery.sizeOf(context).width * 0.08,
                              clipBehavior: Clip.hardEdge,
                              decoration :BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle
                              ),
                              child:
                              pickedImage.path.isEmpty
                                  ? SvgPicture.asset("assets/icons/placeholderperson.svg",
                                height:MediaQuery.sizeOf(context).height * 0.15,
                              )
                                  :
                              Image.file(
                                height:MediaQuery.sizeOf(context).height * 0.15,
                                pickedImage,
                                fit: BoxFit.cover,
                              ), // backgroundImage: AssetImage('assets/images/Frame1000002321.png'),
                            ),
                          ],
                        ),
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
                                title: 'Name',
                                textField: CustomTextField(
                                  textInputAction: TextInputAction.next,
                                  controller: nameController,
                                  hintText: 'Name',

                                  validation:
                                      (val) {
                                    if(val == null || val.isEmpty){
                                      return 'Enter a Name ';
                                    }
                                    return null;
                                  },

                                ),),
                            ),
                            SizedBox(width: 12,),
                            Expanded(
                              child: AddPersonRowHolder(
                                title: 'Contact No',
                                textField: CustomTextField(
                                  textInputAction: TextInputAction.next,
                                  controller: phoneNoController,
                                  hintText: 'Contact No',
                                  validation:
                                      (val) {
                                    if(val == null || val.isEmpty){
                                      return 'Enter a Contact No ';
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
                                title: 'Email',
                                textField:   CustomTextField(
                                  textInputAction: TextInputAction.next,
                                  controller: emailController,
                                  hintText: 'Email',

                                  validation:
                                      (val) {
                                    if(val == null || val.isEmpty){
                                      return 'Email' ;
                                    }
                                    return null;
                                  },

                                ),),
                            ),
                            SizedBox(width: 12,),
                            // Expanded(
                            //   child:
                            //   AddPersonRowHolder(
                            //     title: 'Sales Person Mail',
                            //     textField:    CustomTextField(
                            //       textInputAction: TextInputAction.next,
                            //       controller: mailController,
                            //       hintText: 'Contact No',
                            //
                            //
                            //       validation:
                            //           (val) {
                            //         if(val == null || val.isEmpty){
                            //           return 'Enter a valid Mail';
                            //         }
                            //         return null;
                            //       },
                            //
                            //     ),),
                            // ),
                          ],
                        ),
                        SizedBox(height: 16,),
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
                                      addSalesPersonApi(
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
