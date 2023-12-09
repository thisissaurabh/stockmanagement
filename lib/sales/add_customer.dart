

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
                  relation: '',
                  onPop: (String ) {  },),
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
                  controller: usernameController,
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

                  controller: usernameController,
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
                  controller: usernameController,
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
                  controller: usernameController,
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
                  controller: usernameController,
                  cursorColor: Colors.black,
                  decoration: CustomDataField(
                    label: 'Gst No',
                  ).dataFieldDecoration(),
                ),
              ) ,
            ),
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
                      controller: usernameController,
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
                      controller: usernameController,
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
                      controller: usernameController,
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
      ),
    );
  }
}




