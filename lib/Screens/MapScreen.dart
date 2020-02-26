import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  @override
  MapScreenState createState() => new MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  Widget build(BuildContext context){
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