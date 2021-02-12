import 'package:flutter/material.dart';
import 'package:real/domain/order.dart';
import 'dart:math';

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

  final workouts = <Order>[
    Order(
      title: 'Брови, ресницы, ногти',
      author: 'Александра',
      description: 'На дом: ул. Ленина 98',
      level: 'Beginner',
      avatar: AssetImage('assets/images/people/1.png'),
      price: 900,
    ),
    Order(
      title: 'На вечер: Прическа, макияж, ногти',
      author: 'Нина',
      description: 'На дом: ул. Орджиникидзе 12',
      level: 'Intermediate',
      avatar: AssetImage('assets/images/people/2.png'),
      price: 1200,
    ),
    Order(
      title: 'Нужен парикмахер',
      author: 'Виктория',
      description: 'На дом: ул. Лермонтова 99/2',
      level: 'Beginner',
      avatar: AssetImage('assets/images/people/3.png'),
      price: 700,
    ),
    Order(
      title: 'Нужен парикмахер',
      author: 'Петр',
      description: 'Ваша территория, в пределах 2 км',
      level: 'Intermediate',
      avatar: AssetImage('assets/images/people/4.png'),
      price: 800,
    ),
    Order(
      title: 'Нужен парикмахер',
      author: 'Анатолий',
      description: '',
      level: 'Advanced',
      avatar: AssetImage('assets/images/people/5.png'),
      price: 500,
    ),
  ];

  var filterOnlyMyWorkouts = false;
  var filterTitle = '';
  var filterTitleController = TextEditingController();
  var filterLevel = 'Any level';

  var filterText = '';
  var filterHeight = 0.0;

  List<Order> filter() {
    setState(() {
      filterText = filterOnlyMyWorkouts ? 'My workouts' : 'All workouts';
      filterText += '/' + filterLevel;
      print(filterTitle);
      if (filterTitle.isNotEmpty) filterText += '/' + filterTitle;
      filterHeight = 0;
    });
    var list = workouts;
    return list;
  }

  List<Order> clearFilter() {
    setState(() {
      filterText = 'All workouts/Any level';
      filterOnlyMyWorkouts = false;
      filterTitle = '';
      filterLevel = 'Any level';
      filterTitleController.clear();
      filterHeight = 0;
    });
    var list = workouts;
    return list;
  }

  @override
  Widget build(BuildContext context) {
    var workoutsList = Expanded(
        child: ListView.builder(
            itemCount: workouts.length,
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
                                      backgroundImage: workouts[index].avatar),
                                  Text(workouts[index].author,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            .color,
                                      )),
                                  subtitle(context, workouts[index]),
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
                                      workouts[index].title,
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
                                      workouts[index].description,
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
                                        workouts[index].price.toString(),
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

    return Column(
      children: <Widget>[
        filterInfo,
        filterForm,
        workoutsList,
      ],
    );
  }
}

Widget subtitle(BuildContext context, Order workout) {
  var color = Colors.grey;
  double indicatorLevel = 0;
  String rating = "Рейтинг ";

  var rng = new Random();
  double rand1 = rng.nextInt(10) / 10 + 1;
  int rand2 = rng.nextInt(1000);

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
