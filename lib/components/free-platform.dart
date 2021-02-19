import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:real/domain/list_of_orders.dart';
import 'package:real/models/order.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:real/models/data.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:real/models/user.dart';

class FreePlatformPage extends StatefulWidget {
  FreePlatformPage({Key key}) : super(key: key);

  @override
  _FreePlatformPageState createState() => _FreePlatformPageState();
}

class _FreePlatformPageState extends State<FreePlatformPage> {
  @override
  void initState() {
    clearFilter();
    super.initState();
  }

  var filterOnlyMyWorkouts = false;
  var filterTitle = '';
  var filterTitleController = TextEditingController();
  var filterLevel = 'Any level';

  var filterText = '';
  var filterHeight = 0.0;

  List<Order> filter() {
    setState(() {
      filterText = filterOnlyMyWorkouts ? 'My orders' : 'All orders';
      filterText += '/' + filterLevel;
      print(filterTitle);
      if (filterTitle.isNotEmpty) filterText += '/' + filterTitle;
      filterHeight = 0;
    });
    var list = orders;
    return list;
  }

  List<Order> clearFilter() {
    setState(() {
      filterText = 'All orders/Any level';
      filterOnlyMyWorkouts = false;
      filterTitle = '';
      filterLevel = 'Any level';
      filterTitleController.clear();
      filterHeight = 0;
    });
    var list = orders;
    return list;
  }

  final ordersSelectedName = TextEditingController();
  final ordersSelectedAddress = TextEditingController();
  final ordersSelectedPrice = TextEditingController();
  final ordersSelectedComment = TextEditingController();
  clearTextControllers() {
    ordersSelectedAddress.text = "";
    ordersSelectedComment.text = "";
    ordersSelectedName.text = "";
    ordersSelectedPrice.text = "";
  }

  makeAnOrder() {
    String titleOfOrder = ordersSelectedName.text;
    String address = ordersSelectedAddress.text;
    int price = int.parse(ordersSelectedPrice.text);
    String description = ordersSelectedComment.text;
    Order newOrder = Order(
      title: titleOfOrder,
      author: 'Евгения',
      description: address,
      avatar: AssetImage("assets/images/wat.png"),
      price: price,
    );
    setState(() {
      orders.add(newOrder);
      clearTextControllers();
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
                                      orders[index].description,
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
                                color:
                                    Theme.of(context).textTheme.headline1.color,
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                      left: BorderSide(
                                          width: 1, color: Colors.white24)))),
                        )
                      ],
                    )),
              );
            }));
    var filterInfo = Container(
        margin: EdgeInsets.only(top: 3, left: 7, right: 7, bottom: 5),
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
        height: 40,
        child: RaisedButton(
          child: Row(children: <Widget>[
            Icon(Icons.filter_list),
            Text(
              filterText,
              style: TextStyle(),
              overflow: TextOverflow.ellipsis,
            )
          ]),
          onPressed: () {
            setState(() {
              filterHeight = (filterHeight == 0.0 ? 280.0 : 0.0);
            });
          },
        ));

    var levelMenuItems = <String>[
      'Any level',
      'Beginner',
      'Intermediate',
      'Advanced'
    ].map((String value) {
      return new DropdownMenuItem<String>(
        value: value,
        child: new Text(value),
      );
    }).toList();

    var filterForm = AnimatedContainer(
      height: filterHeight,
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 7),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SwitchListTile(
                  title: const Text('Only My Workouts'),
                  value: filterOnlyMyWorkouts,
                  onChanged: (bool val) =>
                      setState(() => filterOnlyMyWorkouts = val)),
              DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Any level'),
                  items: levelMenuItems,
                  value: filterLevel,
                  onChanged: (String val) => setState(() => filterLevel = val)),
              TextFormField(
                controller: filterTitleController,
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (String val) => setState(() => filterTitle = val),
              ),
              Row(children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      filter();
                    },
                    child: Text("Apply", style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      clearFilter();
                    },
                    child: Text("Clear", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );

    List<String> ordersVariant = ["Прическа", "Брови", "Ресницы", "Ногти"];

    var orderForm = Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      margin: EdgeInsets.only(top: 100),
      color: Colors.white,
      height: 450,
      child: Column(
        children: [
          Container(
            height: 70,
            child: Center(
              child: Text(
                "Заказать услугу",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Container(
              height: 280,
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      controller: ordersSelectedName,
                      decoration: InputDecoration(
                          hintText:
                              "Введите название (Например: Пострич волосы)",
                          hintStyle: TextStyle(fontSize: 13),
                          labelText: "Название",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0)))),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      controller: ordersSelectedAddress,
                      decoration: InputDecoration(
                          hintText: "По умолчанию: Территория исполнителя",
                          hintStyle: TextStyle(fontSize: 13),
                          labelText: "Адрес",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0)))),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      controller: ordersSelectedPrice,
                      decoration: InputDecoration(
                          hintText: "Укажите предлагаемую цену в рублях",
                          hintStyle: TextStyle(fontSize: 13),
                          labelText: "Цена",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0)))),
                      keyboardType: TextInputType.number,
                    ),
                  )),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      controller: ordersSelectedComment,
                      decoration: InputDecoration(
                          hintText: "Дополнительное инфо (Необязаельное поле)",
                          hintStyle: TextStyle(fontSize: 13),
                          labelText: "Комментарий",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0)))),
                    ),
                  )),
                  ElevatedButton(
                    onPressed: makeAnOrder,
                    child: Container(
                        width: 200,
                        height: 50,
                        child: Center(
                            child: Text(
                          "Отправить",
                          style: TextStyle(fontSize: 18),
                        ))),
                  )
                ],
              )),
        ],
      ),
    );

    Container freelanserWidgets = Container(
        child: Column(children: [filterInfo, filterForm, ordersList]));
    SingleChildScrollView userWidgets = SingleChildScrollView(child: orderForm);
    //||||||||||||||||||||||||MAIN||||||||||||||||||
    return context.watch<Profile>().isUserClient
        ? userWidgets
        : freelanserWidgets;
  }
}

Widget subtitle(BuildContext context, Order order) {
  //Лайки расстояиние
  var color = Colors.grey;
  double indicatorLevel = 0;
  String rating = "Рейтинг ";

  var rng = new Random();
  double rand1 = rng.nextInt(10) / 10 + 1;
  int rand2 = rng.nextInt(1000);

  return Column(children: [
    Row(children: <Widget>[
      Expanded(
        child: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite_border,
                color: Colors.red,
                size: 20,
              ),
              Text("(" + rand2.toString() + ") " + rand1.toString() + "км",
                  style: TextStyle(color: Colors.white, fontSize: 10))
            ],
          ),
        ),
      )
    ]),
  ]);
}
