import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spyco_shop_management/api/login_register/login_api.dart';
import 'package:spyco_shop_management/api_models/login_model.dart';

import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/constants/responsive_widget.dart';
import 'package:spyco_shop_management/constants/shared_prefs.dart';
import 'package:spyco_shop_management/constants/textfield_decoration.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';
import 'package:spyco_shop_management/controllers/MenuAppController.dart';
import 'package:spyco_shop_management/screens/main/main_screen.dart';
import 'package:spyco_shop_management/screens/register/register.dart';
import 'package:spyco_shop_management/widgets/main_button.dart';
import 'package:spyco_shop_management/widgets/snackbar.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool showEye = false;
  bool isLoading = false;

  LoginResponse? response;
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
                                text: 'Let’s',
                                style: ralewayStyle.copyWith(
                                  fontSize: 25.0,
                                  color: AppColors.blueDarkColor,
                                  fontWeight: FontWeight.normal,
                                )),
                            TextSpan(
                              text: ' Login',
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
                        'Hey, Enter your details to get sign in \nto your account.',
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
                          'Username',
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
                          keyboardType: TextInputType.emailAddress,
                          // validator: (v) {
                          //   if (v!.isEmpty || !v.contains('@')) {
                          //     return 'Please enter a valid username!';
                          //   }
                          //   return null;
                          // },
                          controller: usernameController,
                          cursorColor: Colors.black,
                          decoration: DecorationCustom(
                            suffixIcon: false,
                            label: 'Your Username',
                            prefixIcon: 'sms',
                          ).textFieldDecoration(),
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
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {

                            },
                            child: Text(
                              'User login',
                              style: ralewayStyle.copyWith(
                                fontSize: 12.0,
                                color: bgColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: ralewayStyle.copyWith(
                                fontSize: 12.0,
                                color: bgColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.05),
                      isLoading ? LoadingButton() :
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            if (usernameController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              setState(() {
                                isLoading = true;
                              });
                              loginApi(
                                  password: passwordController.text,
                                  username: usernameController.text)
                                  .then((value) async {
                                response = value;
                                if (response?.status != null &&
                                    response!.status == 1) {
                                  SharedPrefs().init();
                                  var prefs =
                                  await SharedPreferences
                                      .getInstance();
                                  prefs.setString('token',
                                      response!.accessToken.toString()
                                  );
                                  prefs.setString('email',
                                      usernameController.text
                                  );
                                  prefs.setString('password',
                                      passwordController.text
                                  );
                                  // prefs.setBool(Keys().loginDone, true);
                                  SharedPrefs().setLoginTrue();
                                  setState(() {
                                    isLoading = false;
                                  });
                                  CustomSnackbar.show(
                                      context: context,
                                      label: 'Success',
                                      color: Colors.green,
                                      iconImage: "assets/icons/tick.svg");
                                  print('check token');
                                  print(response!.accessToken.toString());
                                  print('check token');

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MultiProvider(
                                        providers: [
                                          ChangeNotifierProvider(
                                            create: (context) => MenuAppController(),
                                          ),
                                        ],
                                        child: MainScreen(),
                                      ),
                                    ),
                                  );
                                } else {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  CustomMsgSnackbar.show(
                                      context: context,
                                      label: value['message'],
                                      color: Colors.red,
                                      iconImage: "assets/icons/cross.svg");
                                  // print("no");
                                }
                              });
                            } else {
                              CustomMsgSnackbar.show(
                                  context: context,
                                  label: 'Please Enter login credentials',
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
                              color: bgColor,
                            ),
                            child: Text(
                              'Sign In',
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
                                  'Dont have an account ?',
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
                                        builder: (context) => RegisterScreen()),
                                  );
                                },
                                child: Text(
                                  'Register now',
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
