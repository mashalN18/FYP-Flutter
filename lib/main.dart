import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_page/Splash_Screen.dart';

import 'Dashboard.dart';
import 'Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    // TODO: implement initState
    // Preferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

    );
  }
}






