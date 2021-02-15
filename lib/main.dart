import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real/pages/auth.dart';
//import 'package:real/pages/home.dart';
import 'package:flutter/cupertino.dart';

import 'models/data.dart';

void main() => runApp(RealApp());

class RealApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            child: Text(context.watch<Data>().getData),
          ),
        ),
        body: Center(
          child: Widget1(),
        ),
      ),
    );
  }
}

class Widget1 extends StatelessWidget {
  Widget1();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Text(context.watch<Data>().getData),
        ElevatedButton(onPressed: () => context.read<Data>().changeType())
      ],
    ));
  }
}

class MyTextField extends StatelessWidget {
  MyTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(onChanged: (newdata) => {});
  }
}
