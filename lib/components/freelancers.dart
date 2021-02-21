import 'package:flutter/material.dart';
import 'package:real/models/order.dart';

class Freelancers extends StatefulWidget {
  Freelancers({Key key}) : super(key: key);

  @override
  _FreelancersState createState() => _FreelancersState();
}

class _FreelancersState extends State<Freelancers> {
  @override
  void initState() {
    clearFilter();
    super.initState();
  }

  final workouts = <Order>[
    Order(
        title: 'Брови, ресницы, ногти',
        author: 'Александра',
        address: 'test1',
        level: 'Beginner',
        avatar: AssetImage('assets/images/people/1.png')),
    Order(
        title: 'Test2',
        author: 'Нина',
        address: 'test2',
        level: 'Intermediate',
        avatar: AssetImage('assets/images/people/2.png')),
    Order(
        title: 'Test3',
        author: 'Виктория',
        address: 'test3',
        level: 'Beginner',
        avatar: AssetImage('assets/images/people/3.png')),
    Order(
        title: 'Test4',
        author: 'Петр',
        address: 'test4',
        level: 'Intermediate',
        avatar: AssetImage('assets/images/people/4.png')),
    Order(
        title: 'Test5',
        author: 'Анатолий',
        address: 'test5',
        level: 'Advanced',
        avatar: AssetImage('assets/images/people/5.png')),
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
                          flex: 1,
                          child: Container(
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
                            flex: 3,
                            child: Container(
                                padding: EdgeInsets.only(
                                    top: 1, left: 18, right: 18, bottom: 20),
                                child: Column(children: [
                                  Text(
                                    workouts[index].title,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            .color,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        .color,
                                  ),
                                ]))),
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
    var tabBar = TabBar(
      tabs: <Widget>[
        Tab(text: "Freelancers"),
        Tab(text: "Salons"),
      ],
    );

    var freelancersTab = Column(
      children: <Widget>[
        filterInfo,
        filterForm,
        workoutsList,
      ],
    );
    var salonsTab = Column(
      children: <Widget>[
        workoutsList,
      ],
    );
    return DefaultTabController(
        length: tabBar.tabs.length,
        child: Scaffold(
            appBar: AppBar(title: tabBar),
            body: TabBarView(children: <Widget>[freelancersTab, salonsTab])));
  }
}

Widget subtitle(BuildContext context, Order workout) {
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
