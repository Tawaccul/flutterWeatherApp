import 'package:flutter/material.dart';
import 'package:helloworld/screens/locationScreen.dart';
import 'screens/weatherForecastScreens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationScreen(),
    );
  }
}
