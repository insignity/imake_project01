import 'package:flutter/material.dart';
import 'package:real/lists/orders.dart';

import 'filter_first.dart';
import 'subtitle_first.dart';

class FreelancerForm extends StatefulWidget {
  FreelancerForm({Key key}) : super(key: key);

  @override
  _FreelancerFormState createState() => _FreelancerFormState();
}

class _FreelancerFormState extends State<FreelancerForm> {
  createOrderDialog(BuildContext context, int index, int price) {
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
                                              orders[index].avatar),
                                      Text(orders[index].author,
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline1
                                                .color,
                                          )),
                                      subtitle(context, orders[index]),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              width: 1,
                                              color: Colors.white24)))),
                            ),
                            Expanded(
                                //=======================DESCRIPTION============================
                                flex: 11,
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.only(
                                        top: 1, left: 10, right: 10, bottom: 2),
                                    child: Column(children: [
                                      Container(
                                        //-----------------------TITLE
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          orders[index].title,
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .headline1
                                                  .color,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        //--------------------DESCRIPTION
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          orders[index].address,
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline2
                                                .color,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Container(
                                        //--------------------DATE
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          orders[index].date,
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline2
                                                .color,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Expanded(
                                        //----------PRICE
                                        flex: 1,
                                        child: Container(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            orders[index].price.toString(),
                                            style: TextStyle(
                                              color: Colors.red,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                    ]))), //================================================
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: Center(
                            child: Text(
                              "Map",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        width: 1, color: Colors.white24))),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  style: ElevatedButtonTheme.of(context).style,
                                  onPressed: () {},
                                  child: FractionallySizedBox(
                                    widthFactor: 0.8,
                                    child: Center(
                                      child: Text(
                                        "Принять за $price",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .secondaryHeaderColor,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      "Предложить за ",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                FractionallySizedBox(
                                  widthFactor: 0.8,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        //+50-------
                                        child: Container(
                                          width: 80,
                                          child: ElevatedButton(
                                            style:
                                                ElevatedButtonTheme.of(context)
                                                    .style,
                                            onPressed: () {},
                                            child: Center(
                                              child: Text(
                                                (price + 50).toString(),
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .secondaryHeaderColor,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        //+150-------
                                        child: Container(
                                          width: 80,
                                          child: ElevatedButton(
                                            style:
                                                ElevatedButtonTheme.of(context)
                                                    .style,
                                            onPressed: () {},
                                            child: Center(
                                              child: Text(
                                                (price + 150).toString(),
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .secondaryHeaderColor,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        //+250-------
                                        child: Container(
                                          width: 80,
                                          child: ElevatedButton(
                                            style:
                                                ElevatedButtonTheme.of(context)
                                                    .style,
                                            onPressed: () {},
                                            child: Center(
                                              child: Text(
                                                (price + 250).toString(),
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .secondaryHeaderColor,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  style: ElevatedButtonTheme.of(context).style,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: FractionallySizedBox(
                                    widthFactor: 0.8,
                                    child: Center(
                                      child: Text(
                                        "Назад",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .secondaryHeaderColor,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  )),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var ordersList = Expanded(
        child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2.0,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: InkWell(
                  onTap: () {
                    createOrderDialog(context, index, orders[index].price);
                  },
                  child: Container(
                      height: 100,
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.8)),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                                padding: EdgeInsets.only(top: 2),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                        radius: 30,
                                        backgroundImage: orders[index].avatar),
                                    Text(orders[index].author,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              .color,
                                        )),
                                    subtitle(context, orders[index]),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1, color: Colors.white24)))),
                          ),
                          Expanded(
                              //===========================================================
                              flex: 11,
                              child: Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.only(
                                      top: 1, left: 10, right: 10, bottom: 2),
                                  child: Column(children: [
                                    Container(
                                      //-----------------------TITLE
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        orders[index].title,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline1
                                                .color,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      //--------------------DESCRIPTION
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        orders[index].address,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline2
                                              .color,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      //--------------------DATE
                                      alignment: Alignment.topLeft,
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        orders[index].date,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline2
                                              .color,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Expanded(
                                      //----------PRICE
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          orders[index].price.toString(),
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ]))), //================================================
                          Expanded(
                            flex: 1,
                            child: Container(
                                height: 100,
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .color,
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        left: BorderSide(
                                            width: 1, color: Colors.white24)))),
                          )
                        ],
                      )),
                ),
              );
            }));

    Container freelanserWidgets =
        Container(child: Column(children: [FilterFreePlatform(), ordersList]));

    return freelanserWidgets;
  }
}
