import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spyco_shop_management/api/login_register/login_api.dart';
import 'package:spyco_shop_management/api_models/login_model.dart';
import 'package:spyco_shop_management/constants/shared_prefs.dart';
import 'package:spyco_shop_management/constants/textstyle.dart';
import 'package:spyco_shop_management/controllers/MenuAppController.dart';
import 'package:spyco_shop_management/dashboard.dart';
import 'package:spyco_shop_management/screens/login/login.dart';
import 'package:spyco_shop_management/screens/main/main_screen.dart';

import '../api/login_register/customer_add_api.dart';
import '../constants/colors.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // startTime();
    setPage();
  }

  // startTime() async {
  //   var duration = Duration(seconds: 3);
  //   return Timer(duration, route);
  // }
  //
  // route() {
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => LoginScreen()));
  // }


  setPage() async {
    SharedPrefs().init();
    var prefs = await SharedPreferences.getInstance();
    bool loginDone = false;
    Future.delayed(Duration(seconds: 2), () async {
      loginDone = SharedPrefs().getLogin() ?? false;

        if (loginDone) {
          var v = prefs.getString(Keys().token);
          print('check token$v');
          LoginResponse response;
          loginApi(
                  username: '${prefs.getString(Keys().email)}',
                  password: '${prefs.getString(Keys().password)}',
          ).then((value) async {
            if (value is LoginResponse) {
              response = value;
              if (response.status == 1) {
                prefs.setString('token',
                          response!.accessToken.toString()
                      );
                Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MultiProvider(
                            providers: [
                              ChangeNotifierProvider(
                                create: (context) => MenuAppController(),
                              ),
                            ],
                            child: DashBoard(),
                          ),
                        ),
                      );
              }
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => LoginScreen(),
                ),
              );
              // Handle the case where authTokenLoginApi returns an unexpected type
            }
            // response = value;
            // if (response.status == 1) {
            //   prefs.setString('token',
            //       response!.accessToken.toString()
            //   );
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => MultiProvider(
            //         providers: [
            //           ChangeNotifierProvider(
            //             create: (context) => MenuAppController(),
            //           ),
            //         ],
            //         child: MainScreen(),
            //       ),
            //     ),
            //   );
            // }
          });
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => LoginScreen(),
            ),
          );
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            color: Colors.black,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Image.asset("assets/images/Logo final.jpg",
                height: 200,
                width: 400),
              ),
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
        ],
      ),
    );
  }
}