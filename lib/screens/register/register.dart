

import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:spyco_shop_management/api/login_register/register_apis.dart';

import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/constants/responsive_widget.dart';
import 'package:spyco_shop_management/constants/textfield_decoration.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';
import 'package:spyco_shop_management/controllers/MenuAppController.dart';
import 'package:spyco_shop_management/screens/login/login.dart';
import 'package:spyco_shop_management/screens/main/main_screen.dart';
import 'package:spyco_shop_management/screens/register/register_verify_email.dart';
import 'package:spyco_shop_management/widgets/global_widgets.dart';
import 'package:spyco_shop_management/widgets/main_button.dart';
import 'package:spyco_shop_management/widgets/snackbar.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  bool showEye = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: selectedColor,
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
                        child: Image.asset("assets/images/Logo final.jpg",
                          height: 200,
                          width: 400,
                        )
                        // child: Text(
                        //   'Our Logo',
                        //   style: ralewayStyle.copyWith(
                        //     fontSize: 48.0,
                        //     color: AppColors.whiteColor,
                        //     fontWeight: FontWeight.w800,
                        //   ),
                        // ),
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
                color: selectedColor,
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
                                text: 'Register',
                                style: ralewayStyle.copyWith(
                                  fontSize: 25.0,
                                  color: Colors.black,
                                  // color: AppColors.blueDarkColor,
                                  fontWeight: FontWeight.w600,
                                )),
                            TextSpan(
                              text: ' Now ',
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                                // color: AppColors.blueDarkColor,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        ' Enter Email to get register.',
                        style: ralewayStyle.copyWith(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                          // color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(height: height * 0.064),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Email',
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
                          // color: AppColors.whiteColor,
                          color: Colors.transparent,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (v) {
                            if (v!.isEmpty || !v.contains('@')) {
                              return 'Please enter a valid email!';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          controller: emailController,
                          cursorColor: Colors.black,
                          decoration: DecorationCustom(
                            suffixIcon: false,
                            label: 'Your Email',
                            prefixIcon: 'sms',
                          ).textFieldDecoration(),
                        ),
                      ),
                      SizedBox(height: height * 0.014),
                      SizedBox(height: height * 0.02),
                      isLoading ?
                          LoadingButton() :
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            if(emailController.text.contains("@") &&
                                emailController.text.contains("com")

                            ) {
                              setState(() {
                                isLoading = true;
                              });
                              registerApi(
                                  email: emailController.text
                              ).then((value) async {

                                if (value['status'] == 1) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  String otpMessage = 'Your OTP is ${value['otp']}';
                                  CustomSnackbar.show(context: context,
                                      label:otpMessage,
                                      color: Colors.green,
                                      iconImage: "assets/icons/tick.svg");
                                  // Fluttertoast.showToast(
                                  //   msg: 'Your OTP is ${value['otp']}',
                                  // );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterVerifyEmailScreen(
                                          email: emailController.text,)),
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
                            }
                          else {
                              CustomMsgSnackbar.show(context: context,
                                  label: 'Please Enter Valid Email',
                                  color: Colors.red,
                                  iconImage: "assets/icons/cross.svg");
                            }
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
                              'Verify Email',
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
                                  'Already have an account ?',
                                  style: ralewayStyle.copyWith(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()),
                                  );
                                },
                                child: MouseHover(
                                  child: Text(' Login',
                                    style: ralewayStyle.copyWith(
                                      fontSize: 12.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                    ),
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
  void showCustomToast(BuildContext context) {
    Fluttertoast.showToast(
      msg: 'This is a custom toast!',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP, // Set the gravity to top
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[800],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
