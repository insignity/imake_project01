import 'package:flutter/material.dart';
import 'package:real/pages/auth.dart';
import 'package:real/pages/home.dart';
import 'package:real/pages/landing.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(RealApp());

class RealApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Real App',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(50, 65, 85, 1),
        textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          headline2: TextStyle(
              color: Colors.white70,
              fontSize: 10,
              fontWeight: FontWeight.normal),
        ),
      ),
      home: AuthorizationPage(),
      routes: {
        '/start': (BuildContext context) => RealApp(),
        '/auth': (BuildContext context) => AuthorizationPage(),
        '/home': (BuildContext context) => HomePage(),
      },
    );
  }
}
