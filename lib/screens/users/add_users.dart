import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:spyco_shop_management/api/login_register/add_user_api.dart';
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
import 'dart:io';

import '../../constants/text_styles.dart';

class AddUsers extends StatefulWidget {
  const AddUsers({super.key});

  @override
  State<AddUsers> createState() => _AddUsersState();
}

class _AddUsersState extends State<AddUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // drawer: SideMenu(),
      body: SafeArea(
        child: AddSupplierFields(),
      ),
    );
  }
}


class AddSupplierFields extends StatefulWidget {
  const AddSupplierFields({super.key});

  @override
  State<AddSupplierFields> createState() => _AddSupplierFieldsState();
}

class _AddSupplierFieldsState extends State<AddSupplierFields> {
  final name = TextEditingController();
  final role = TextEditingController();
  final mail = TextEditingController();
  final phone = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final companyLocation = TextEditingController();
  // int selectedOption = 1;
  String? selectedOption;
  bool isLoading = false;


  final GlobalKey<FormState>_formKey =  GlobalKey<FormState>();
  File pickedImage = File("");
  final ImagePicker _imgPicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);

                },
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/chevron-back-svgrepo-com.svg",
                      color: Colors.black,
                      height: 32,
                      width: 32,),
                    SizedBox(width: 8,),
                    Text("Add User",
                      style: pageTitle,)
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            height:MediaQuery.sizeOf(context).height * 0.15,
                            clipBehavior: Clip.hardEdge,
                            decoration :BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                            ),
                            child: Image.asset(
                              'assets/images/personporifle.jpg',
                              fit: BoxFit.cover,
                            ),
                            // backgroundImage: AssetImage('assets/images/Frame1000002321.png'),
                          ),
                          SizedBox(height: 8,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset("assets/icons/editimage.svg"),
                                  SizedBox(width: 4,),
                                  Text("Edit"),

                                ],
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Container(
                                    color: Colors.transparent,
                                    width: MediaQuery.sizeOf(context).width *0.10,
                                    child: Text("Bussiness Type")),
                                SizedBox(width: 40,),
                                Expanded(
                                  child:  SelectUserTypeCheckBox(
                                    relation:role.text,
                                    onPop: (val) {
                                      role.text = val;

                                    },),
                                ),
                                SizedBox(width: 16,),
                              ],
                            ),
                          ),
                          SizedBox(height: 16,),
                        ],
                      ),
                    ),
                  ),


                ],
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 5,),
                    CustomHorizontalLine(),
                    SizedBox(height: 16,),
                    // SizedBox(height: 20,),

                  /*  AddSupplierRow(
                      title: "User Type",
                      child:  Expanded(
                        child: SelectUserTypeCheckBox(
                          relation:role.text,
                          onPop: (val) {
                            role.text = val;

                          },),
                      ),
                    ),*/
                    SizedBox(height: 16,),

                    DataWithTextFieldRow(
                      name: 'Name',
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: name,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "enter user name";
                          }
                          return null;
                        },
                        // controller: usernameController,
                        cursorColor: Colors.black,
                        decoration: CustomDataField(
                          label: 'Enter User Name',
                        ).dataFieldDecoration(),
                      ),
                    ),
                    SizedBox(height: 16,),
                    DataWithTextFieldRow(
                      name: 'Company Branch Name',
                      child: TextFormField(
                        controller: companyLocation,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "enter user branch name";
                          }
                          return null;
                        },
                        cursorColor: Colors.black,
                        // controller: usernameController,
                        decoration: CustomDataField(
                          label: 'Add Branch Name',
                        ).dataFieldDecoration(),
                      ),
                    ),
                    SizedBox(height: 16,),
                    DataWithTextFieldRow(
                      name: 'User Mail',
                      child: TextFormField(
                        controller: mail,
                        validator: (v) {
                          if (v!.isEmpty || !v.contains('@')) {
                            return 'Please enter email!';
                          }
                          return null;
                        },
                        cursorColor: Colors.black,
                        decoration: CustomDataField(
                          label: 'Add User Mail',
                        ).dataFieldDecoration(),
                      ),
                    ),
                    SizedBox(height: 16,),
                    DataWithTextFieldRow(
                      name: 'User Phone',
                      child: TextFormField(
                        controller: phone,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'Please enter user phone no!';
                          }
                          return null;
                        },
                        cursorColor: Colors.black,
                        decoration: CustomDataField(
                          label: 'User Phone',
                        ).dataFieldDecoration(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16,),
              SizedBox(height: 24,),
              Text(
                "Login Details",
                style: selectedBoldText,
              ),
              SizedBox(height: 7,),
              CustomHorizontalLine(),
              SizedBox(height: 16,),
              DataWithTextFieldRow(
                name: 'Username',
                child: TextFormField(
                  controller: userName,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Please enter username!';
                    }
                    return null;
                  },
                  cursorColor: Colors.black,
                  decoration: CustomDataField(
                    label: 'Username',
                  ).dataFieldDecoration(),
                ),
              ),
              SizedBox(height: 16,),
              DataWithTextFieldRow(
                name: 'Set Password',
                child: TextFormField(
                  controller: password,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Please enter password!';
                    }
                    return null;
                  },
                  cursorColor: Colors.black,
                  decoration: CustomDataField(
                    label: 'Add Password',
                  ).dataFieldDecoration(),
                ),
              ),
              SizedBox(height: 16,),
              DataWithTextFieldRow(
                name: 'Confirm Password',
                child: TextFormField(
                  controller: confirmPassword,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Please enter confirm password!';
                    }
                    return null;
                  },
                  cursorColor: Colors.black,
                  decoration: CustomDataField(
                    label: 'Confirm Password',
                  ).dataFieldDecoration(),
                ),
              ),
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    if (Responsive.isDesktop(context))
                      isLoading ?
                          LoadingButton() :
                      MainButton(
                        title: 'Add',
                        press: () {
                          if (_formKey.currentState!.validate()) {
                            if(password.text.isNotEmpty && confirmPassword.text.isNotEmpty) {
                                setState(() {
                                  isLoading = true;
                                });
                                addUserApi(
                                  name: name.text,
                                  email: mail.text,
                                  username:userName.text,
                                  companyLocation: companyLocation.text,
                                  role: role.text.isEmpty ?
                                  "userAccess" :
                                  role.text,
                                  phNo: phone.text.isEmpty ? "0000000000" :phone.text,
                                  password: password.text,
                                  confirmPassword: confirmPassword.text,
                                ).then((value) async {
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
                              CustomMsgSnackbar.show(
                                  context: context,
                                  label: 'Please Set Password For Login',
                                  color: Colors.red,
                                  iconImage: "assets/icons/cross.svg");
                            }
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
                        titleColor: Colors.black,
                      ),
                    SizedBox(width: 5,),
                    if (Responsive.isDesktop(context))
                      MainButton(
                        title: 'Cancel',
                        press: () {
                          Navigator.pop(context);
                        },
                        sizeHorizontal: 30,
                        sizeVerticle: 16,
                        color: Colors.red,
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


class CustomAddDataRow extends StatefulWidget {
  final String name;
  final Widget child;
  const CustomAddDataRow({super.key, required this.name, required this.child});


  @override
  State<CustomAddDataRow> createState() => _CustomAddDataRowState();
}

class _CustomAddDataRowState extends State<CustomAddDataRow> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        if (Responsive.isDesktop(context))
          Expanded(
            child: Text(
              widget.name,
              style: listName,
            ),
          ),
        if (Responsive.isDesktop(context))
          Expanded(child: widget.child)

      ],
    );
  }
}





class SelectUserTypeCheckBox extends StatefulWidget {
  final String relation;
  final Function(String) onPop;
  const SelectUserTypeCheckBox(
      {Key? key, required this.relation, required this.onPop})
      : super(key: key);

  @override
  State<SelectUserTypeCheckBox> createState() => _SelectUserTypeCheckBoxState();
}

class _SelectUserTypeCheckBoxState extends State<SelectUserTypeCheckBox> {
  int _gIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _gIndex = 0;
              Navigator.of(context).pop();
              widget.onPop("pos");
            });
          },
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _gIndex = 0;
                    // Navigator.of(context).pop();
                    widget.onPop("pos");
                  });
                },
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _gIndex == 0
                            ? selectedColor
                            : Colors.transparent,
                        shape: BoxShape.circle,

                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text('pos', )
            ],
          ),
        ),
        SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            setState(() {
              _gIndex = 1;
              Navigator.of(context).pop();
              widget.onPop("userAccess");
            });
          },
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _gIndex = 1;
                    // Navigator.of(context).pop();
                    widget.onPop("userAccess");
                  });
                },
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _gIndex == 1
                            ? selectedColor
                            : Colors.transparent,
                        shape: BoxShape.circle,

                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text('userAccess',)
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  void initState() {
    if (widget.relation == "pos") {
      _gIndex = 0;
    } else if (widget.relation == "userAccess") {
      _gIndex = 1;
    }
    super.initState();
  }
}
