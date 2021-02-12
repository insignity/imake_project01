import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Image.asset('assets/images/wat.png'),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Column(children: [
                  Center(
                      child: Text(
                    "Попова Евгения",
                    style: TextStyle(color: Colors.white),
                  )),
                  Center(
                      child:
                          Switch(value: false, onChanged: (bool newValue) {}))
                ]),
              ),
            )
          ]),
          Column(
            children: [
              Text(
                "История заказов",
                style: TextStyle(color: Colors.white),
              ),
              SingleChildScrollView(
                child: Container(
                  height: 500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
