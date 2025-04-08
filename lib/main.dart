import 'package:bmi/screens/home_screen.dart';
import 'package:bmi/screens/landscape_home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: OrientationBuilder(
        builder: (context, orientation) {
          if (Orientation.landscape == orientation) {
            return LandScapeHomeScreen();
          } else if (Orientation.portrait == orientation) {
            return MyHomePage();
          }else{
            return MyHomePage();
          }
        },
      ),
    );
  }
}
