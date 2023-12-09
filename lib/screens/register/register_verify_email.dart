import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/constants/responsive_widget.dart';
import 'package:spyco_shop_management/constants/textfield_decoration.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';
import 'package:spyco_shop_management/controllers/MenuAppController.dart';
import 'package:spyco_shop_management/screens/login/login.dart';
import 'package:spyco_shop_management/screens/main/main_screen.dart';
import 'package:spyco_shop_management/screens/register/register_details.dart';

class RegisterVerifyEmailScreen extends StatefulWidget {
  const RegisterVerifyEmailScreen({Key? key}) : super(key: key);

  @override
  State<RegisterVerifyEmailScreen> createState() => _RegisterVerifyEmailScreenState();
}

class _RegisterVerifyEmailScreenState extends State<RegisterVerifyEmailScreen> {
  final otpController = TextEditingController();

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
                      SizedBox(height: height * 0.2),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Verify',
                                style: ralewayStyle.copyWith(
                                  fontSize: 25.0,
                                  color: AppColors.blueDarkColor,
                                  fontWeight: FontWeight.normal,
                                )),
                            TextSpan(
                              text: ' Email ',
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
                        ' Enter Otp to Continue.',
                        style: ralewayStyle.copyWith(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(height: height * 0.064),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 16.0),
                      //   child: Text(
                      //     'Email',
                      //     style: ralewayStyle.copyWith(
                      //       fontSize: 12.0,
                      //       color: AppColors.blueDarkColor,
                      //       fontWeight: FontWeight.w700,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 6.0),
                      PinCodeTextField(
                        validator: (pinText) {
                          if (pinText == null || pinText.isEmpty) {
                            return "Enter pin";
                          }
                          return null;
                        },
                        controller: otpController,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        appContext: context,
                        length: 4,
                        onChanged: (val) {},
                        pinTheme: PinTheme(
                          activeColor: Colors.black,
                          inactiveColor: Colors.black,
                        ),
                      ),
                      // Container(
                      //   height: 50.0,
                      //   width: width,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(16.0),
                      //     color: AppColors.whiteColor,
                      //   ),
                      //   child: TextFormField(
                      //     keyboardType: TextInputType.emailAddress,
                      //     validator: (v) {
                      //       if (v!.isEmpty || !v.contains('@')) {
                      //         return 'Please enter a valid email!';
                      //       }
                      //       return null;
                      //     },
                      //     controller: otpController,
                      //     cursorColor: Colors.black,
                      //     decoration: DecorationCustom(
                      //       suffixIcon: false,
                      //       label: 'Your Email',
                      //       prefixIcon: 'sms',
                      //     ).textFieldDecoration(),
                      //   ),
                      // ),
                      SizedBox(height: height * 0.014),
                      /* Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Password',
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
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Please enter a password!';
                            }
                            return null;
                          },
                          controller: passwordController,
                          cursorColor: Colors.black,
                          style: k16_400_black,
                          obscureText: !showEye,
                          obscuringCharacter: '●',
                          decoration: DecorationCustom(
                            onTap: () {
                              setState(() {
                                showEye = !showEye;
                              });
                            },
                            showEye: showEye,
                            suffixIcon: true,
                            label: 'Password',
                            prefixIcon: 'lock',
                          ).textFieldDecoration(),
                        ),
                      ),
                      SizedBox(height: height * 0.03),*/
                      SizedBox(height: height * 0.02),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterDetailsScreen()),
                            );
                          },

                          borderRadius: BorderRadius.circular(16.0),
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 70.0, vertical: 18.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: bgColor,
                            ),
                            child: Text(
                              'Enter OTP ',
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.whiteColor,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: width,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  'Did not Received Otp ?',
                                  style: ralewayStyle.copyWith(
                                    fontSize: 12.0,
                                    color: AppColors.blueDarkColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()),
                                  );
                                },
                                child: Text(
                                  'Resend',
                                  style: ralewayStyle.copyWith(
                                    fontSize: 12.0,
                                    color: bgColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ]),
                      )
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
