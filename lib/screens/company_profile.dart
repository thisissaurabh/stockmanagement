

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:provider/provider.dart';
import 'package:spyco_shop_management/api/login_register/logout_api.dart';
import 'package:spyco_shop_management/api_models/login_model.dart';
import 'package:spyco_shop_management/constants/colors.dart';

import 'package:spyco_shop_management/constants/responsive.dart';
import 'package:spyco_shop_management/constants/shared_prefs.dart';
import 'package:spyco_shop_management/constants/textfield_decoration.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';

import 'package:spyco_shop_management/controllers/MenuAppController.dart';
import 'package:spyco_shop_management/screens/dashboard/components/header.dart';
import 'package:spyco_shop_management/screens/login/login.dart';

import 'package:spyco_shop_management/screens/main/components/side_menu.dart';
import 'package:spyco_shop_management/widgets/cards.dart';
import 'package:spyco_shop_management/widgets/custom_data_list.dart';
import 'package:spyco_shop_management/widgets/global_widgets.dart';
import 'package:spyco_shop_management/widgets/globals.dart';
import 'package:spyco_shop_management/widgets/main_button.dart';
import 'package:spyco_shop_management/widgets/main_recent_widget.dart';
import 'package:spyco_shop_management/widgets/snackbar.dart';

class CompanyProfile extends StatefulWidget {
  const CompanyProfile({super.key});

  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {

  bool isLoading = false;
  LoginResponse? response;
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
              child: CompanyProfileDetails(),
            ),
          ],
        ),
      ),
    );
  }
}

class CompanyProfileDetails extends StatefulWidget {
  const CompanyProfileDetails({super.key});

  @override
  State<CompanyProfileDetails> createState() => _CompanyProfileDetailsState();
}

class _CompanyProfileDetailsState extends State<CompanyProfileDetails> {

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Header(title: 'Company Details',profileCard: SizedBox(),),
          Column(
            children: [
              ElevatedBgCard(
                  radius: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0,vertical: 16),
                    child: Column(
                children: [
                    Container(
                      height:70,
                      width: 70,
                      decoration :BoxDecoration(
                        color: Colors.white,
                      shape: BoxShape.circle
                    ),
                      child: Image.asset(
                        'assets/images/profile_pic.png',
                        fit: BoxFit.cover,
                      ),
                      // backgroundImage: AssetImage('assets/images/Frame1000002321.png'),
                    ),
                    Text(
                      "Xyz Company",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text("Saurabh")



                ],
              ),
                  ),
              ),
              SizedBox(height: 16,),

              ElevatedBgCard(
                  radius: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24,),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0.0),
                            child: Text(
                              "Contact Details",
                              style: selectedBoldText,
                            ),
                          ),
                        ),
                        SizedBox(height: 7,),
                        CustomHorizontalLine(),
                        SizedBox(height: 16,),
                        AddSupplierRow(
                          title: 'Supplier Mail',
                          child:Expanded(
                            child: SizedBox(
                              // width: MediaQuery.sizeOf(context).width,
                              height: 40.0,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                // controller: usernameController,
                                cursorColor: Colors.black,
                                decoration: CustomDataField(
                                  label: 'Mail',
                                ).dataFieldDecoration(),
                              ),
                            ),
                          ) ,
                        ),
                        SizedBox(height: 16,),
                        AddSupplierRow(
                          title: 'Username',
                          child:Expanded(
                            child: SizedBox(
                              // width: MediaQuery.sizeOf(context).width,
                              height: 40.0,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                // controller: usernameController,
                                cursorColor: Colors.black,
                                decoration: CustomDataField(
                                  label: 'Username',
                                ).dataFieldDecoration(),
                              ),
                            ),
                          ) ,
                        ),
                        SizedBox(height: 16,),
                        AddSupplierRow(
                          title: 'Contact no',
                          child:Expanded(
                            child: SizedBox(
                              // width: MediaQuery.sizeOf(context).width,
                              height: 40.0,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                // controller: usernameController,
                                cursorColor: Colors.black,
                                decoration: CustomDataField(
                                  label: 'Contact no',
                                ).dataFieldDecoration(),
                              ),
                            ),
                          ) ,
                        ),
                        SizedBox(height: 16,),
                      ],
                    ),
                  )),
              SizedBox(height: 16,),
              ElevatedBgCard(
                  radius: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24,),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0.0),
                            child: Text(
                              "Other Details",
                              style: selectedBoldText,
                            ),
                          ),
                        ),
                        SizedBox(height: 7,),
                        CustomHorizontalLine(),
                        SizedBox(height: 16,),
                        AddSupplierRow(
                          title: 'Company Adress',
                          child:Row(
                            children: [
                              SizedBox(
                                width: 276,
                                height: 40.0,
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
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
                                 
                                  cursorColor: Colors.black,
                                  decoration: CustomDataField(
                                    label: 'State',
                                  ).dataFieldDecoration(),
                                ),
                              ),
                            ],
                          ) ,
                        ),
                        SizedBox(height: 16,),
                        AddSupplierRow(
                          title: 'Gst no',
                          child:Expanded(
                            child: SizedBox(
                              // width: MediaQuery.sizeOf(context).width,
                              height: 40.0,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                // controller: usernameController,
                                cursorColor: Colors.black,
                                decoration: CustomDataField(
                                  label: 'Gst No',
                                ).dataFieldDecoration(),
                              ),
                            ),
                          ) ,
                        ),
                        SizedBox(height: 16,),
                        AddSupplierRow(
                          title: 'Role',
                          child:Expanded(
                            child: SizedBox(
                              // width: MediaQuery.sizeOf(context).width,
                              height: 40.0,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                // controller: usernameController,
                                cursorColor: Colors.black,
                                decoration: CustomDataField(
                                  label: 'Admin',
                                ).dataFieldDecoration(),
                              ),
                            ),
                          ) ,
                        ),
                        SizedBox(height: 16,),

                      ],
                    ),
                  ),
              ),
              SizedBox(height: 16,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      if (Responsive.isDesktop(context))
                        MainButton(
                          title: 'Update',
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
                          color: Color(0xff824cfb).withOpacity(0.90),
                          titleColor: Colors.white,
                        ),
                      Spacer(),
                      if (Responsive.isDesktop(context))
                        isLoading ? LoadingButton(
                          color: Colors.red,
                        ) :
                      MainButton(
                        title: 'Logout',
                        press: () {
                          setState(() {
                            isLoading = true;
                          });
                          logoutApi(
                          ).then((value) async {
                            if (value['status'] == 1) {
                              setState(() {
                                isLoading = false;
                              });
                              CustomSnackbar.show(context: context,
                                  label:"Sucess",
                                  color: Colors.green,
                                  iconImage: "assets/icons/tick.svg");
                              SharedPrefs().setLoginFalse();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen(
                                     ),),
                              );
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                              CustomMsgSnackbar.show(context: context,
                                  label: value['message'],
                                  color: Colors.red,
                                  iconImage: "assets/icons/cross.svg");
                            }
                          });
                        },
                        sizeHorizontal: 30,
                        sizeVerticle: 16,
                        color: Colors.red.withOpacity(0.80),
                        titleColor: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )

        ],
      ),
    );
  }
}
