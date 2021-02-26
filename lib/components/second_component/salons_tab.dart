import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real/lists/salons.dart';

import 'filter_second.dart';
import 'subtitle_second.dart';

class SalonsTab extends StatefulWidget {
  SalonsTab({Key key}) : super(key: key);

  @override
  _SalonsTabState createState() => _SalonsTabState();
}

class _SalonsTabState extends State<SalonsTab> {
  final String typeOfTab = 'Salon';
  Random rnd = Random();

  createSalonDialog(BuildContext context, int index) {
    return showDialog(
        context: context,
        builder: (context) {
          return Container(
            child: FractionallySizedBox(
              widthFactor: 0.8,
              heightFactor: 0.7,
              child: Container(
                  padding: EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.8)),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                  height: 100,
                                  alignment: Alignment.topLeft,
                                  //======avatar container==============
                                  padding: EdgeInsets.only(top: 2),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                          radius: 30,
                                          backgroundImage:
                                              salons[index].avatar),
                                      Text(salons[index].author,
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline1
                                                .color,
                                          )),
                                      subtitle(context, salons[index]),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              width: 1,
                                              color: Colors.white24)))),
                            ),
                            Expanded(flex: 6, child: Container())
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: Center(
                            child: Text(
                              "Страница салона",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ],
                  )),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var salonsView = Expanded(
        child: ListView.builder(
            itemCount: salons.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2.0,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: InkWell(
                  onTap: () {
                    createSalonDialog(context, index);
                  },
                  child: Container(
                      height: 100,
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.8)),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                        radius: 30,
                                        backgroundImage: salons[index].avatar),
                                    Text(salons[index].author,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              .color,
                                        )),
                                    subtitle(context, salons[index]),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1, color: Colors.white24)))),
                          ),
                          Expanded(
                              flex: 3,
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 1, left: 10, bottom: 10),
                                  child: Row(children: [
                                    Expanded(
                                      flex: 10,
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10),
                                        alignment: Alignment.topLeft,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  salons[index].title,
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .textTheme
                                                          .headline1
                                                          .color,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  "Отзывы (" +
                                                      rnd
                                                          .nextInt(500)
                                                          .toString() +
                                                      ")",
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .textTheme
                                                          .headline1
                                                          .color,
                                                      textBaseline: TextBaseline
                                                          .ideographic,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        padding: EdgeInsets.only(top: 15),
                                        alignment: Alignment.centerRight,
                                        child: Icon(
                                          Icons.keyboard_arrow_right,
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              .color,
                                        ),
                                      ),
                                    ),
                                  ]))),
                        ],
                      )),
                ),
              );
            }));
    var salonsTab = Column(
      children: <Widget>[
        FilterSecond(),
        salonsView,
      ],
    );
    return Provider<String>(create: (context) => typeOfTab, child: salonsTab);
  }
}
