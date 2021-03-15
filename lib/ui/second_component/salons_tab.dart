import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real/data/lists/sales.dart';
import 'package:real/data/lists/salons.dart';
import 'package:real/ui/second_component/swiper.dart';

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
          var header = Expanded(
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
                              backgroundImage: salons[index].avatar),
                          Text(salons[index].author,
                              style: TextStyle(
                                color:
                                    Theme.of(context).textTheme.headline1.color,
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
                    flex: 6,
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      height: 180,
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              "Парикмахерская",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "Адрес: ул. Курашова д. 24",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "Статус: Есть свободные мастера",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          );
          var photos = Container(
              height: 150,
              child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 1.0,
                        child: InkWell(
                            onTap: () {},
                            child: Container(
                                height: 100,
                                width: 200,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: sales[index].image),
                                    color: Color.fromRGBO(50, 65, 85, 0.8)),
                                child: Row(children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                        padding: EdgeInsets.only(top: 70),
                                        child: Column(
                                          children: [
                                            Text("Фото",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black45,
                                                )),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                right: BorderSide(
                                                    width: 1,
                                                    color: Colors.white24)))),
                                  ),
                                ]))));
                  }));
          var listViewServices = Container(
            padding: EdgeInsets.only(top: 10),
            height: 50,
            child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(200))),
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Center(
                            child: Text(
                              "Прически " + index.toString(),
                              style: TextStyle(
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                            ),
                          )));
                }),
          );
          return Container(
            child: FractionallySizedBox(
              widthFactor: 0.9,
              heightFactor: 0.7,
              child: Container(
                  padding: EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.8)),
                  child: Column(
                    children: [
                      header,
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            photos,
                            listViewServices,
                            Container(
                                padding: EdgeInsets.all(10),
                                height: 150,
                                child: Text(
                                    "Описание: это уход за волосами путем их окрашивания, стрижки, укладки или наращивания для удовлетворения потребностей клиента и придания его внешнему виду свежести, ухоженности и красоты.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                    ))),
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/signup');
                                  },
                                  child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      child: Text("Записаться"))),
                            ),
                          ],
                        ),
                      )
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
        SwiperView(),
        salonsView,
      ],
    );
    return Provider<String>(create: (context) => typeOfTab, child: salonsTab);
  }
}
