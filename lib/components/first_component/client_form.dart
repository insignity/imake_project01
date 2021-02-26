import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real/lists/orders.dart';
import 'package:real/models/order.dart';

class ClientForm extends StatefulWidget {
  ClientForm({Key key}) : super(key: key);

  @override
  _ClientFormState createState() => _ClientFormState();
}

class _ClientFormState extends State<ClientForm> {
  createAlertDialog(BuildContext context) {
    // Введите пожалуйста название и цену заказа
    return showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("Внимение"),
            content: Text("Введите пожалуйста название и цену заказа!"),
            actions: [
              CupertinoDialogAction(
                child: Text("Ок"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  final ordersSelectedName = TextEditingController();
  final ordersSelectedAddress = TextEditingController();
  final ordersSelectedDate = TextEditingController();
  final ordersSelectedPrice = TextEditingController();
  final ordersSelectedComment = TextEditingController();

  clearTextControllers() {
    ordersSelectedName.text = "";
    ordersSelectedAddress.text = "";
    ordersSelectedDate.text = "";
    ordersSelectedPrice.text = "";
    ordersSelectedComment.text = "";
  }

  Widget makeAnOrder() {
    String titleOfOrder = ordersSelectedName.text;
    String address = ordersSelectedAddress.text;
    String price = ordersSelectedPrice.text;
    String date = ordersSelectedDate.text;
    String comment = ordersSelectedComment.text;
    if ((titleOfOrder == "") || (price == "")) {
      return createAlertDialog(context);
    } else {
      if (address == "") address = "На вашей территории";
      if (date == "") date = "Сейчас";
      if (comment != "") date += "Комментарий " + comment;
      Order newOrder = Order(
        title: titleOfOrder,
        author: 'Евгения',
        address: address,
        date: date,
        avatar: AssetImage("assets/images/wat.png"),
        price: int.parse(price),
      );
      setState(() {
        orders.add(newOrder);
        clearTextControllers();
      });
      return CupertinoAlertDialog(
        title: Text("!"),
        actions: [CupertinoDialogAction(child: Text("Ьеп"))],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
              height: 350,
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      controller: ordersSelectedName,
                      decoration: InputDecoration(
                          hintText: "Введите название (напр.: Парикмахер)",
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
                      controller: ordersSelectedDate,
                      decoration: InputDecoration(
                          hintText: "По умолчанию: Сейчас",
                          hintStyle: TextStyle(fontSize: 13),
                          labelText: "Дата и время",
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
                          hintText: "Доп. информация (необязаельное поле)",
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
    SingleChildScrollView userWidgets = SingleChildScrollView(child: orderForm);
    return userWidgets;
  }
}
