import 'package:flutter/widgets.dart';

class Worker {
  String title;
  String author;
  String description;
  String address;
  String level;
  String date;
  AssetImage avatar;
  int price;
  List<int> works;

  Worker(
      {this.title,
      this.author,
      this.description,
      this.address,
      this.level,
      this.date,
      this.avatar,
      this.price,
      this.works});
}
