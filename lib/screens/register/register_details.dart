import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/constants/responsive_widget.dart';
import 'package:spyco_shop_management/constants/textfield_decoration.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';
import 'package:spyco_shop_management/controllers/MenuAppController.dart';
import 'package:spyco_shop_management/screens/main/main_screen.dart';
import 'package:spyco_shop_management/screens/register/register.dart';
import 'package:spyco_shop_management/screens/register/register_password.dart';

class RegisterDetailsScreen extends StatefulWidget {
  const RegisterDetailsScreen({Key? key}) : super(key: key);

  @override
  State<RegisterDetailsScreen> createState() => _RegisterDetailsScreenState();
}

class _RegisterDetailsScreenState extends State<RegisterDetailsScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool showEye = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveWidget.isSmallScreen(context)
                ? const SizedBox()
                : Expanded(
              child: Container(
                height: height,
                color: bgColor,
                child: Center(
                  child: Text(
                    'Our Logo',
                    style: ralewayStyle.copyWith(
                      fontSize: 48.0,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(
                    horizontal: ResponsiveWidget.isSmallScreen(context)
                        ? height * 0.032
                        : height * 0.12),
                color: AppColors.backColor,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.08),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Enter',
                                style: ralewayStyle.copyWith(
                                  fontSize: 25.0,
                                  color: AppColors.blueDarkColor,
                                  fontWeight: FontWeight.normal,
                                )),
                            TextSpan(
                              text: ' Details',
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w800,
                                color: AppColors.blueDarkColor,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Hey, Enter your details to create \nyour account.',
                        style: ralewayStyle.copyWith(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(height: height * 0.064),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Company Name',
                          style: ralewayStyle.copyWith(
                            fontSize: 12.0,
                            color: AppColors.blueDarkColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Container(
                        height: 50.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.whiteColor,
                        ),
                        child: TextFormField(
                          controller: usernameController,
                          cursorColor: Colors.black,
                          decoration: DecorationCustom(
                            suffixIcon: false,
                            label: 'Your Company Name',
                            prefixIcon: 'sms',
                          ).textFieldDecoration(),
                        ),
                      ),
                      SizedBox(height: height * 0.014),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'UserName',
                          style: ralewayStyle.copyWith(
                            fontSize: 12.0,
                            color: AppColors.blueDarkColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Container(
                        height: 50.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.whiteColor,
                        ),
                        child: TextFormField(
                          controller: usernameController,
                          cursorColor: Colors.black,
                          decoration: DecorationCustom(
                            suffixIcon: false,
                            label: 'Your UserName',
                            prefixIcon: 'sms',
                          ).textFieldDecoration(),
                        ),
                      ),
                      SizedBox(height: height * 0.014),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Gst No',
                          style: ralewayStyle.copyWith(
                            fontSize: 12.0,
                            color: AppColors.blueDarkColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Container(
                        height: 50.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.whiteColor,
                        ),
                        child: TextFormField(
                          controller: usernameController,
                          cursorColor: Colors.black,
                          decoration: DecorationCustom(
                            suffixIcon: false,
                            label: 'Your Gst No',
                            prefixIcon: 'sms',
                          ).textFieldDecoration(),
                        ),
                      ),
                      SizedBox(height: height * 0.014),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Address',
                          style: ralewayStyle.copyWith(
                            fontSize: 12.0,
                            color: AppColors.blueDarkColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Container(
                        height: 50.0,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: AppColors.whiteColor,
                        ),
                        child: TextFormField(
                          // keyboardType: TextInputType.emailAddress,
                          // validator: (v) {
                          //   if (v!.isEmpty || !v.contains('@')) {
                          //     return 'Please enter a valid email!';
                          //   }
                          //   return null;
                          // },
                          controller: usernameController,
                          cursorColor: Colors.black,
                          decoration: DecorationCustom(
                            suffixIcon: false,
                            label: 'Bussiness Address',
                            prefixIcon: 'sms',
                          ).textFieldDecoration(),
                        ),
                      ),
                      SizedBox(height: height * 0.014),

                      SizedBox(height: height * 0.05),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPasswordScreen()),
                            );
                          },
                          // onTap: () => Navigator.push(
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
                          // ),
                          borderRadius: BorderRadius.circular(16.0),
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 70.0, vertical: 18.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: bgColor,
                            ),
                            child: Text(
                              'Continue',
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.whiteColor,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   height: 50,
                      //   width: width,
                      //   child: Row(
                      //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.only(left: 16.0),
                      //           child: Text(
                      //             'Dont have an account ?',
                      //             style: ralewayStyle.copyWith(
                      //               fontSize: 12.0,
                      //               color: AppColors.blueDarkColor,
                      //               fontWeight: FontWeight.w700,
                      //             ),
                      //           ),
                      //         ),
                      //         TextButton(
                      //           onPressed: () {
                      //             Navigator.push(
                      //               context,
                      //               MaterialPageRoute(
                      //                   builder: (context) => RegisterScreen()),
                      //             );
                      //           },
                      //           child: Text(
                      //             'Register now',
                      //             style: ralewayStyle.copyWith(
                      //               fontSize: 12.0,
                      //               color: bgColor,
                      //               fontWeight: FontWeight.w600,
                      //             ),
                      //           ),
                      //         ),
                      //       ]),
                      // )
                    ],
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
