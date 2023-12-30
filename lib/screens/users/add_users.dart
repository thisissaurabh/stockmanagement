

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
              child: AddSupplierFields(),
            ),
          ],
        ),
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
  final usernameController = TextEditingController();
  // int selectedOption = 1;
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(title: "Add User"),
          SizedBox(height: 5,),
          CustomHorizontalLine(),
          SizedBox(height: 16,),
          SizedBox(height: 20,),
          AddSupplierRow(
            title: "User Type",
            child:  Expanded(
              child: SelectUserTypeCheckBox(
                relation: '',
                onPop: (String ) {  },),
            ),
          ),
          SizedBox(height: 16,),

          AddSupplierRow(
            title: 'User Name',
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
                controller: usernameController,
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
                controller: usernameController,
                cursorColor: Colors.black,
                decoration: CustomDataField(
                  label: 'First Name',
                ).dataFieldDecoration(),
              ),
            ),
          ),
          SizedBox(height: 16,),
          AddSupplierRow(
            title: 'Company Branch Name',
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
                controller: usernameController,
                cursorColor: Colors.black,
                decoration: CustomDataField(
                  label: 'Branch Name',
                ).dataFieldDecoration(),
              ),
            ) ,
          ),
          SizedBox(height: 16,),
          AddSupplierRow(
            title: 'User Mail',
            child:SizedBox(
              width: 276,
              height: 40.0,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,

                controller: usernameController,
                cursorColor: Colors.black,
                decoration: CustomDataField(
                  label: 'Email',
                ).dataFieldDecoration(),
              ),
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
          AddSupplierRow(
            title: 'Username',
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
                controller: usernameController,
                cursorColor: Colors.black,
                decoration: CustomDataField(
                  label: 'Username',
                ).dataFieldDecoration(),
              ),
            ) ,
          ),
          SizedBox(height: 16,),
          AddSupplierRow(
            title: 'Set Password',
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
                    controller: usernameController,
                    cursorColor: Colors.black,
                    decoration: CustomDataField(
                      label: 'Password',
                    ).dataFieldDecoration(),
                  ),
                ),
                SizedBox(width: 16,),
              ],
            ) ,
          ),
          SizedBox(height: 16,),
          AddSupplierRow(
            title: 'Confirm Password',
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
                    controller: usernameController,
                    cursorColor: Colors.black,
                    decoration: CustomDataField(
                      label: 'Confirm Password',
                    ).dataFieldDecoration(),
                  ),
                ),
                SizedBox(width: 16,),
              ],
            ) ,
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              children: [
                if (Responsive.isDesktop(context))
                  MainButton(
                    title: 'Add',
                    press: () {  },
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
              widget.onPop("Pos");
            });
          },
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _gIndex = 0;
                    // Navigator.of(context).pop();
                    widget.onPop("Pos");
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
                            ? bgColor
                            : Colors.transparent,
                        shape: BoxShape.circle,

                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text('Pos', )
            ],
          ),
        ),
        SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            setState(() {
              _gIndex = 1;
              Navigator.of(context).pop();
              widget.onPop("User Access");
            });
          },
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _gIndex = 1;
                    // Navigator.of(context).pop();
                    widget.onPop("User Access");
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
                            ? bgColor
                            : Colors.transparent,
                        shape: BoxShape.circle,

                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text('User Access',)
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  void initState() {
    if (widget.relation == "Pos") {
      _gIndex = 0;
    } else if (widget.relation == "User Access") {
      _gIndex = 1;
    }
    super.initState();
  }
}
