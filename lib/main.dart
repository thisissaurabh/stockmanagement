import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/screens/login/login.dart';
import 'package:spyco_shop_management/splash/splash.dart';
import 'package:spyco_shop_management/widgets/loading.dart';

import 'dashboard.dart';
import 'screens/register/register_details.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: RegisterDetailsScreen(),
      // theme: ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: bgColor,
      //   textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
      //       .apply(bodyColor: Colors.black),
      //   canvasColor: secondaryColor,
      // ),
      // home: RegisterDetailsScreen(),
      home: SplashScreen(),
      // home: AddSupplierScreen(),
      // home: LoginScreen(),

      // home: MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider(
      //       create: (context) => MenuAppController(),
      //     ),
      //   ],
      //   child: MainScreen(),
      // ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  final String txt = "Doe John is name My";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(txt.toString())
        ],
      )
    );
  }
}
