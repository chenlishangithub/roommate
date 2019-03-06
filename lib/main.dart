import 'package:flutter/material.dart';
import 'package:roommate_app/router.dart';
import 'package:roommate_app/page/Home.dart';
import 'package:flutter/rendering.dart';
void main() {
  //debugPaintSizeEnabled = true;
  runApp(new RoommateApp());
}

class RoommateApp extends StatelessWidget {
  RoommateApp({Key key}): super(key:key);

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title:"roommate",
      theme:new ThemeData(
        primaryColor: Color(0xFF53BAB0),
        brightness: Brightness.light,
      ),
      routes: router,
      home: new HomePage(),
    );
  }
}