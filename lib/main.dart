import 'package:flutter/material.dart';
import 'package:kalkulator/screen/bmi_screen.dart';
import 'package:kalkulator/screen/calculator_screen.dart';
import 'package:kalkulator/screen/profile_page.dart';
// import 'package:kalkulator/screen/kategori_screen.dart';
// import 'package:kalkulator/screen/product_screen.dart';
// import 'package:kalkulator/screen/setting_screen.dart';
import 'package:kalkulator/screen/splash_screen.dart';
import 'package:kalkulator/screen/temperature_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Caltulator',
      theme: ThemeData.dark(),
      home: SplashScreen(),
      routes: {
        '/calculator': (context) => CalculatorScreen(),
        '/bmi': (context) => BMIScreen(),
        '/thermo': (context) => TemperatureScreen(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}