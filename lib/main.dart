import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'landingpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatelessWidget {
  final Map<int, Color> color =
  {
    50:Color.fromRGBO(255,45,62, .1),
    100:Color.fromRGBO(255,45,62, .2),
    200:Color.fromRGBO(255,45,62, .3),
    300:Color.fromRGBO(255,45,62, .4),
    400:Color.fromRGBO(255,45,62, .5),
    500:Color.fromRGBO(255,45,62, .6),
    600:Color.fromRGBO(255,45,62, .7),
    700:Color.fromRGBO(255,45,62, .8),
    800:Color.fromRGBO(255,45,62, .9),
    900:Color.fromRGBO(255,45,62, 1),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Khyay', primarySwatch: MaterialColor(0xFFFF2D3E, color), hintColor: Colors.black26, cursorColor: Colors.black38, iconTheme: IconThemeData(color: Color(0xFFFF2D3E))),
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}

