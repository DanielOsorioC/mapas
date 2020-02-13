import 'package:flutter/material.dart';
import 'package:maps_app/home_page.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fluter GoogleMaps Demo",
      theme: ThemeData(
        primaryColor: Color(0xff6200ee),
      ),
      home: HomePage(),
    );
  }
}