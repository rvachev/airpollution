import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Color getColorByIndex(int index) {
  if (index < 50) {
    return Colors.green;
  } else if (index < 100) {
    return Colors.yellow;
  } else if (index < 150) {
    return Colors.orange;
  } else if (index < 200) {
    return Colors.red;
  } else if (index < 300) {
    return Colors.deepPurple;
  } else {
    return Color.fromARGB(255, 126, 0, 35);
  }
}

BitmapDescriptor getIconByIndex(int index) {
  if (index < 50) {
    return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
  } else if (index < 100) {
    return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow);
  } else if (index < 150) {
    return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange);
  } else if (index < 200) {
    return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
  } else if (index < 300) {
    return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet);
  } else {
    return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose);
  }
}
