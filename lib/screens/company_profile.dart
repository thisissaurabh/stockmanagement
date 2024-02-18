

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
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
import 'package:spyco_shop_management/widgets/loading.dart';
import 'package:spyco_shop_management/widgets/main_button.dart';
import 'package:spyco_shop_management/widgets/main_recent_widget.dart';
import 'package:spyco_shop_management/widgets/snackbar.dart';

import '../api/login_register/company_profille_api.dart';
import '../api_models/company_profile_model.dart';
import '../widgets/custom_textfield.dart';

class CompanyProfile extends StatefulWidget {
  const CompanyProfile({super.key});

  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // drawer: SideMenu(),
      body: SafeArea(
        child:
        CompanyProfileDetails(),
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
  final mail = TextEditingController();

  @override
  void initState() {
    getCpmpanyProfile();
    super.initState();
  }


  CompanyProfileModel? companyModel;

  getCpmpanyProfile() {
    isLoading = true;
    var resp = getCompanyProfileApi();
    resp.then((value) {
      if (value['status'] == 1) {
        companyModel = CompanyProfileModel.fromJson(value);
        setState(() {
          isLoading = false;
        });
      } else {
        isLoading = false;
      }
    });
  }
  // LoginResponse? response;

  @override
  Widget build(BuildContext context) {

    return isLoading ? Loading() :SingleChildScrollView(
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
                  CachedNetworkImage(
                    height: 80,
                    width: 80,
                    imageUrl: companyModel!.user!.imageUrl!.toString(),
                    fit: BoxFit.cover,
                    errorWidget: (context,
                        url, error) =>
                        Image.asset(
                            "assets/icons/userico.jpg"),
                    progressIndicatorBuilder:
                        (a, b, c) => Opacity(
                      opacity: 0.3,
                      child:
                      Shimmer.fromColors(
                        baseColor:
                        Colors.black12,
                        highlightColor:
                        Colors.white,
                        child: Container(
                          width: 70,
                          height: 70,
                          //margin: EdgeInsets.symmetric(horizontal: 24),
                          decoration:
                          BoxDecoration(
                              color: Colors
                                  .white,
                              shape: BoxShape
                                  .circle),
                        ),
                      ),
                    ),
                  ),
                    Text(
                      companyModel!.user!.companyName.toString(),
                      // "Xyz Company",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      companyModel!.user!.name.toString(),
                    )



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
                        Row(
                          children: [
                            Container(
                                color: Colors.transparent,
                                width: MediaQuery.sizeOf(context).width *0.10,
                                child: Text("Mail")),
                            SizedBox(width: 16,),

                            Expanded(
                              child: CustomTextField(
                                controller: mail,
                                hintText: companyModel!.user!.email!.toString(),
                                validation:
                                    (val) {

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
                                child: Text("Username")),
                            SizedBox(width: 16,),

                            Expanded(
                              child: CustomTextField(
                                controller: mail,
                                hintText: companyModel!.user!.userName!.toString(),
                                validation:
                                    (val) {

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
                                child: Text("Contact No")),
                            SizedBox(width: 16,),

                            Expanded(
                              child: CustomTextField(
                                controller: mail,
                                hintText: companyModel!.user!.phone.toString(),
                                validation:
                                    (val) {

                                },

                              ),
                            ),

                          ],
                        ),

                       /* SizedBox(height: 16,),
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
                        SizedBox(height: 16,),*/
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
                        Row(
                          children: [
                            Container(
                                color: Colors.transparent,
                                width: MediaQuery.sizeOf(context).width *0.10,
                                child: Text("Company Address")),
                            SizedBox(width: 16,),

                            Expanded(
                              child: CustomTextField(
                                controller: mail,
                                hintText: companyModel!.user!.address.toString(),
                                validation:
                                    (val) {

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
                                child: Text("Other")),
                            SizedBox(width: 16,),

                            Expanded(
                              child: CustomTextField(
                                controller: mail,
                                hintText: 'City',
                                validation:
                                    (val) {

                                },

                              ),
                            ),
                            SizedBox(width: 13,),
                            Expanded(
                              child: CustomTextField(
                                controller: mail,
                                hintText: 'State',
                                validation:
                                    (val) {

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
                                child: Text("Gst No")),
                            SizedBox(width: 16,),

                            Expanded(
                              child: CustomTextField(
                                controller: mail,
                                hintText: companyModel!.user!.gstNumber.toString(),
                                validation:
                                    (val) {

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
                                child: Text("Role")),
                            SizedBox(width: 16,),

                            Expanded(
                              child: CustomTextField(
                                controller: mail,
                                hintText: companyModel!.user!.role.toString(),
                                validation:
                                    (val) {

                                },

                              ),
                            ),

                          ],
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
                                    color: selectedColor,
                                    titleColor: Colors.black,
                                  ),
                                SizedBox(width: 5,),
                                if (Responsive.isDesktop(context))

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
                                    color: Colors.red,
                                    titleColor: Colors.white,
                                  ),
                              ],
                            ),
                          ],
                        ),
                            ],
                          ) ,
    ),
              ),
            ],
          ),
      ],
    ),);


  }
}
