import 'package:flutter/material.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';

class MapScreen extends StatefulWidget {
  @override
  MapScreenState createState() => new MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  Widget build(BuildContext context){
        return AmapView(
          mapType: MapType.Standard,
          showZoomControl: false,
          showCompass: false,
          showScaleControl: false,
          zoomGesturesEnabled: true,
          scrollGesturesEnabled: true,
          tiltGestureEnabled: false,
          zoomLevel: 10,
          centerCoordinate: LatLng(39, 116),
        );
  }
}