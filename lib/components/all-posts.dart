import 'package:flutter/material.dart';
import 'package:real/domain/workout.dart';

class AllPosts extends StatefulWidget {
  @override
  _AllPostsState createState() => _AllPostsState();
}

class _AllPostsState extends State<AllPosts> {
  @override
  void initState() {
    clearFilter();
    super.initState();
  }

  final workouts = <Workout>[
    Workout(
        title: 'Test1',
        author: 'max1',
        description: 'test1',
        level: 'Beginner'),
    Workout(
        title: 'Test2',
        author: 'max2',
        description: 'test2',
        level: 'Intermediate'),
    Workout(
        title: 'Test3',
        author: 'max3',
        description: 'test3',
        level: 'Beginner'),
    Workout(
        title: 'Test4',
        author: 'max4',
        description: 'test4',
        level: 'Intermediate'),
    Workout(
        title: 'Test5',
        author: 'max5',
        description: 'test5',
        level: 'Advanced'),
  ];

  var filterOnlyMyWorkouts = false;
  var filterTitle = '';
  var filterTitleController = TextEditingController();
  var filterLevel = 'Any level';

  var filterText = '';
  var filterHeight = 0.0;

  List<Workout> filter() {
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

  List<Workout> clearFilter() {
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
                decoration:
                    BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.8)),
                child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.fitness_center,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            right:
                                BorderSide(width: 1, color: Colors.white24))),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  title: Text(
                    workouts[index].title,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.headline1.color,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Theme.of(context).textTheme.headline1.color,
                  ),
                  subtitle: subtitle(context, workouts[index]),
                ),
              ),
            );
          }),
    );

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

Widget subtitle(BuildContext context, Workout workout) {
  var color = Colors.grey;
  double indicatorLevel = 0;

  switch (workout.level) {
    case 'Beginner':
      color = Colors.green;
      indicatorLevel = 0.33;
      break;
    case 'Intermediate':
      color = Colors.yellow;
      indicatorLevel = 0.66;
      break;
    case 'Advanced':
      color = Colors.red;
      indicatorLevel = 1.0;
      break;
  }

  return Row(children: <Widget>[
    Expanded(
      flex: 1,
      child: LinearProgressIndicator(
        backgroundColor: Theme.of(context).textTheme.headline1.color,
        value: indicatorLevel,
        valueColor: AlwaysStoppedAnimation(color),
      ),
    ),
    SizedBox(
      width: 10,
    ),
    Expanded(
        flex: 3,
        child: Text(workout.level,
            style: TextStyle(
              color: Theme.of(context).textTheme.headline1.color,
            )))
  ]);
}
