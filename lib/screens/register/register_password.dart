import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:spyco_shop_management/api/login_register/register_apis.dart';

import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/constants/responsive_widget.dart';
import 'package:spyco_shop_management/constants/textfield_decoration.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';
import 'package:spyco_shop_management/controllers/MenuAppController.dart';
import 'package:spyco_shop_management/screens/login/login.dart';
import 'package:spyco_shop_management/screens/main/main_screen.dart';
import 'package:spyco_shop_management/screens/register/register.dart';
import 'package:spyco_shop_management/widgets/main_button.dart';
import 'package:spyco_shop_management/widgets/snackbar.dart';

class RegisterPasswordScreen extends StatefulWidget {
  const RegisterPasswordScreen({Key? key}) : super(key: key);

  @override
  State<RegisterPasswordScreen> createState() => _RegisterPasswordScreenState();
}

class _RegisterPasswordScreenState extends State<RegisterPasswordScreen> {
  final passwordController = TextEditingController();
  final confirmPassword = TextEditingController();
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
                                text: 'Setup',
                                style: ralewayStyle.copyWith(
                                  fontSize: 32.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                )),
                            TextSpan(
                              text: ' Password',
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Hey, Setup your password to create \nyour account.',
                        style: ralewayStyle.copyWith(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: height * 0.014),
                      Padding(
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
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(8),
                          ],
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
                      SizedBox(height: height * 0.03),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          'ConfirmPassword',
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
                          controller: confirmPassword,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(8),
                          ],
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
                            label: 'Confirm Password',
                            prefixIcon: 'lock',
                          ).textFieldDecoration(),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: ralewayStyle.copyWith(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.05),
                      isLoading ?
                      LoadingButton() :
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            if (passwordController.text == confirmPassword.text) {
                              setState(() {
                                isLoading = true;
                              });
                              passwordApi(
                                  password: passwordController.text,
                                  confirmPassword: confirmPassword.text)
                                  .then((value) async {
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
                                            LoginScreen()),
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
                                  label: 'Please Check your password',
                                  color: Colors.red,
                                  iconImage: "assets/icons/cross.svg");

                            }
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
                              color: Colors.black,
                            ),
                            child: Text(
                              'Create Account',
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
