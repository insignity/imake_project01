import 'package:flutter/widgets.dart';

class Order {
  String title;
  String author;
  String description;
  String level;
  AssetImage avatar;
  int price;

  Order(
      {this.title,
      this.author,
      this.description,
      this.level,
      this.avatar,
      this.price});
}
