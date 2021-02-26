import 'package:flutter/material.dart';
import 'package:real/components/second_component/salons_tab.dart';
import 'second_component/freelancers_tab.dart';

class Freelancers extends StatefulWidget {
  Freelancers({Key key}) : super(key: key);

  @override
  _FreelancersState createState() => _FreelancersState();
}

class _FreelancersState extends State<Freelancers> {
  @override
  @override
  Widget build(BuildContext context) {
    var tabBar = TabBar(
      tabs: <Widget>[
        Tab(text: "Салоны"),
        Tab(text: "Исполнители"),
      ],
    );

    return DefaultTabController(
        length: tabBar.tabs.length,
        child: Scaffold(
            appBar: AppBar(automaticallyImplyLeading: false, title: tabBar),
            body: TabBarView(children: <Widget>[
              SalonsTab(),
              FreelancersTab()
            ]))); //folder second component
  }
}
