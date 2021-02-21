import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real/pages/auth.dart';
import 'package:real/pages/home.dart';
import 'package:flutter/cupertino.dart';

import 'models/data.dart';
import 'models/profile.dart';

void main() => runApp(RealApp());

class RealApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Profile>(
      create: (context) => Profile(),
      child: MaterialApp(
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
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(132, 141, 153, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
          ),
        ),
        home: HomePage(),
        routes: {
          '/start': (BuildContext context) => RealApp(),
          '/auth': (BuildContext context) => AuthorizationPage(),
          '/home': (BuildContext context) => HomePage(),
        },
      ),
    );
  }
}
