import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hqgps_flutter/Constants/Constant.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    _getLoginState();
  }

  _getLoginState() async {
      SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool loggedIn = prefs.containsKey("account");
      if (!loggedIn) {
        Navigator.of(context).pushReplacementNamed(LOGIN_SCREEN);
      } else {
        Navigator.of(context).pushReplacementNamed(MAP_SCREEN);
      }
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SizedBox.expand(
        child: Container (
          color: Colors.black,
          child: Image (
            fit: BoxFit.fitHeight,
            image: AssetImage('assets/wallpaper.jpg')
          )
        )
      )
    );
  }

}