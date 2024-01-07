import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spyco_shop_management/constants/colors.dart';
import 'package:spyco_shop_management/screens/login/login.dart';
import 'package:spyco_shop_management/splash/splash.dart';
import 'package:spyco_shop_management/widgets/loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        canvasColor: secondaryColor,
      ),
      home: SplashScreen(),
      // home: Loading(),
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
