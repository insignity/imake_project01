import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real/data/lists/freelancers.dart';

import 'filter_second.dart';
import 'subtitle_second.dart';

class FreelancersTab extends StatefulWidget {
  FreelancersTab({Key key}) : super(key: key);

  @override
  _FreelancersTabState createState() => _FreelancersTabState();
}

class _FreelancersTabState extends State<FreelancersTab> {
  Random rnd = Random();
  final String typeOfTab = "Freelancer";

  createFreelancerDialog(BuildContext context, int index) {
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
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Container(
                                  //======avatar container==============
                                  padding: EdgeInsets.only(top: 2),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                          radius: 30,
                                          backgroundImage:
                                              freelancers[index].avatar),
                                      Text(freelancers[index].author,
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline1
                                                .color,
                                          )),
                                      subtitle(context, freelancers[index]),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              width: 1,
                                              color: Colors.white24)))),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: Center(
                            child: Text(
                              "Страница исполнителя",
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
    var freelancersView = Expanded(
        child: ListView.builder(
            itemCount: freelancers.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2.0,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: InkWell(
                  onTap: () {
                    createFreelancerDialog(context, index);
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
                                        backgroundImage:
                                            freelancers[index].avatar),
                                    Text(freelancers[index].author,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              .color,
                                        )),
                                    subtitle(context, freelancers[index]),
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
                                                  freelancers[index].title,
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
    var freelancersTab = Column(
      children: <Widget>[
        FilterSecond(),
        freelancersView,
      ],
    );
    return Provider<String>(
        create: (context) => typeOfTab, child: freelancersTab);
  }
}
