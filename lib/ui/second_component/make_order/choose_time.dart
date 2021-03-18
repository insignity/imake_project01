import 'package:flutter/material.dart';

class ChooseTime extends StatefulWidget {
  ChooseTime({Key key}) : super(key: key);

  @override
  _ChooseTimeState createState() => _ChooseTimeState();
}

class _ChooseTimeState extends State<ChooseTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         automaticallyImplyLeading: false,
         title: Text("Время"),
       ),
       body: Container(),
    );
  }
}