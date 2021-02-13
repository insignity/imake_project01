import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real/pages/auth.dart';
//import 'package:real/pages/home.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(RealApp());

class RealApp extends StatelessWidget {
  TypeOfUser typeOfUser = TypeOfUser();
  final String userType = "User";

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => userType,
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
            child: Text("sasdasd"),
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
    return Container(child: Text(Provider.of<String>(context)));
  }
}

class MyTextField extends StatelessWidget {
  MyTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(onChanged: (newdata) => {});
  }
}

class TypeOfUser {
  List<String> types = ["Client", "Freelancer", "Salon"];
  String _currentTypeOfUser = "Client";

  String getTypeOfUser() {
    return _currentTypeOfUser;
  }

  changeTypeOfUserToFreelancer() {
    _currentTypeOfUser = types[1];
  }

  changeTypeOfUserToUser() {
    _currentTypeOfUser = types[0];
  }

  TypeOfUser() {
    changeTypeOfUserToUser();
  }
}
