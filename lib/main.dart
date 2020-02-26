import 'package:flutter/material.dart';
import 'package:hqgps_flutter/Screens/LoginScreen.dart';
import 'package:hqgps_flutter/Screens/SplashScreen.dart';
import 'package:hqgps_flutter/Constants/Constant.dart';
import 'package:hqgps_flutter/Screens/MapScreen.dart';

Future main() async {
  runApp(new MaterialApp(
    title: 'HQGPS',
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      primarySwatch: Colors.red,
    ),
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      SPLASH_SCREEN: (BuildContext context) => new SplashScreen(),
      LOGIN_SCREEN: (BuildContext context) => new LoginScreen(),
      MAP_SCREEN: (BuildContext context) => new MapScreen(),
    },
  ));
}