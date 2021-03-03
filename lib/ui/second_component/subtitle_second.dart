import 'package:flutter/material.dart';
import 'package:real/entity/worker.dart';

Widget subtitle(BuildContext context, Worker workout) {
  var color = Colors.grey;
  double indicatorLevel = 0;
  String rating = "Рейтинг ";

  switch (workout.level) {
    case 'Beginner':
      color = Colors.amber;
      indicatorLevel = 0.7;
      rating += "7/10";
      break;
    case 'Intermediate':
      color = Colors.lightGreen;
      indicatorLevel = 0.85;
      rating += "8.5/10";
      break;
    case 'Advanced':
      color = Colors.green;
      indicatorLevel = 1.0;
      rating += "10/10";
      break;
  }

  return Column(children: [
    Row(children: <Widget>[
      SizedBox(
        width: 10,
      ),
      Expanded(
        flex: 3,
        child: LinearProgressIndicator(
          backgroundColor: Theme.of(context).textTheme.headline1.color,
          value: indicatorLevel,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      SizedBox(
        width: 10,
      ),
    ]),
    Row(
      children: [
        Expanded(
            child: Text(
          "$rating",
          style: TextStyle(color: Colors.amber, fontSize: 12),
          textAlign: TextAlign.center,
        ))
      ],
    )
  ]);
}
