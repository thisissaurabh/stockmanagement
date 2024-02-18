import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:spyco_shop_management/api/login_register/register_apis.dart';

import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/constants/responsive_widget.dart';
import 'package:spyco_shop_management/constants/textfield_decoration.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';
import 'package:spyco_shop_management/controllers/MenuAppController.dart';
import 'package:spyco_shop_management/screens/login/login.dart';
import 'package:spyco_shop_management/screens/main/main_screen.dart';
import 'package:spyco_shop_management/screens/register/register_details.dart';
import 'package:spyco_shop_management/widgets/main_button.dart';
import 'package:spyco_shop_management/widgets/snackbar.dart';

class RegisterVerifyEmailScreen extends StatefulWidget {
  final String email;
  const RegisterVerifyEmailScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<RegisterVerifyEmailScreen> createState() =>
      _RegisterVerifyEmailScreenState();
}

class _RegisterVerifyEmailScreenState extends State<RegisterVerifyEmailScreen> {
  final otpController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: selectedGreenColor,
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
                      color: Colors.black,
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
                color: selectedGreenColor,
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
                                  color: Colors.white,
                                  // color: AppColors.blueDarkColor,
                                  fontWeight: FontWeight.normal,
                                )),
                            TextSpan(
                              text: ' Email ',
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                // color: AppColors.blueDarkColor,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        ' Enter Otp From Mail to Continue.',
                        style: ralewayStyle.copyWith(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          // color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(height: height * 0.064),
                      const SizedBox(height: 6.0),
                      PinCodeTextField(
                        // validator: (pinText) {
                        //   if (pinText == null || pinText.isEmpty) {
                        //     return "Enter pin";
                        //   }
                        //   return null;
                        // },
                        controller: otpController,
                        cursorColor: Colors.white,
                        // keyboardType: TextInputType.number,
                        appContext: context,
                        length: 4,
                        onChanged: (val) {},
                        pinTheme: PinTheme(
                          activeColor: Colors.white,
                          inactiveColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: height * 0.014),
                      SizedBox(height: height * 0.02),
                      isLoading ? LoadingButton() :
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            if (otpController.text.length == 4) {
                              setState(() {
                                isLoading = true;
                              });
                              enterOtpApi(
                                  otp: otpController.text)
                                  .then((value) async {
                                    print(otpController.text);
                                if (value['status'] == 1) {
                                  setState(() {
                                    isLoading = false;
                                  });

                                  CustomSnackbar.show(
                                      context: context,
                                      label: 'Success',
                                      color: Colors.green,
                                      iconImage: "assets/icons/tick.svg");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterDetailsScreen()),
                                  );
                                } else {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  CustomSnackbar.show(
                                      context: context,
                                      label: 'Failed!!',
                                      color: Colors.red,
                                      iconImage: "assets/icons/cross.svg");
                                  // print("no");
                                }
                              });
                            } else {
                              CustomMsgSnackbar.show(
                                  context: context,
                                  label: 'Please Enter OTP',
                                  color: Colors.red,
                                  iconImage: "assets/icons/cross.svg");

                            }

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => RegisterDetailsScreen()),
                            // );
                          },
                          borderRadius: BorderRadius.circular(16.0),
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 70.0, vertical: 18.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Colors.black,
                            ),
                            child: Text(
                              'Enter OTP ',
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
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
                                    color: Colors.white,
                                    // color: AppColors.blueDarkColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  registerApi(
                                      email: widget.email
                                  ).then((value) async {
                                    if (value['status'] == 1) {
                                      String otpMessage = 'Your OTP is ${value['otp']}';
                                      CustomSnackbar.show(context: context,
                                          label:otpMessage,
                                          color: Colors.green,
                                          iconImage: "assets/icons/tick.svg");
                                      /*CustomSnackbar.show(context: context,
                                          label: 'Success',
                                          color: Colors.green,
                                          iconImage: "assets/icons/tick.svg");*/

                                    }
                                  });
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => LoginScreen()),
                                  // );
                                },
                                child: Text(
                                  'Resend',
                                  style: ralewayStyle.copyWith(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
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
