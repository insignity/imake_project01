import 'package:flutter/widgets.dart';

class Order {
  String title;
  String author;
  String address;
  String level;
  String date;
  AssetImage avatar;
  int price;

  Order(
      {this.title,
      this.author,
      this.address,
      this.level,
      this.date,
      this.avatar,
      this.price});
}
