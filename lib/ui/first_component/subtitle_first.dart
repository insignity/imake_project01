import 'dart:math';

import 'package:flutter/material.dart';
import 'package:real/entity/order.dart';

Widget subtitle(BuildContext context, Order order) {
  //Лайки расстояиние
  var rng = new Random();
  var rand1 = rng.nextInt(10) / 10 + 1;
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
