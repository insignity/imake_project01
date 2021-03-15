import 'package:flutter/widgets.dart';
import 'package:real/entity/service.dart';

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
  List<Service> services;
  Worker(
      {this.title,
      this.author,
      this.description,
      this.address,
      this.level,
      this.date,
      this.avatar,
      this.price,
      this.works,
      this.services});
}
