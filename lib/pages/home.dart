import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real/components/free-platform.dart';
import 'package:real/components/all-posts.dart';
import 'package:real/components/freelancers.dart';
import 'package:real/components/salons.dart';
import 'package:real/components/history.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var navigationBar = CurvedNavigationBar(
      items: const <Widget>[
        Icon(Icons.directions_car_sharp),
        Icon(Icons.house_outlined),
        Icon(Icons.person_search),
        Icon(Icons.auto_awesome_mosaic),
        Icon(Icons.history)
      ],
      index: 0,
      height: 50,
      color: Colors.white.withOpacity(0.5),
      buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.white.withOpacity(0.5),
      animationCurve: Curves.decelerate,
      animationDuration: Duration(milliseconds: 1),
      onTap: (int index) {
        setState(() => sectionIndex = index);
      },
    );
    checkingBottomNavigationBar() {
      switch (sectionIndex) {
        case 0:
          return FreePlatformPage();
          break;

        case 1:
          return Salons();
          break;

        case 2:
          return Freelancers();
          break;

        case 3:
          return AllPosts();
          break;

        case 4:
          return HistoryPage();
          break;
      }
    }

    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text("MasterClient"),
          leading: Icon(
            Icons.reorder,
            size: 50,
          ),
          actions: <Widget>[
            CircleAvatar(
                radius: 30,
                backgroundColor: Color.fromARGB(1, 0, 0, 0),
                backgroundImage: AssetImage(
                  'assets/images/wat.png',
                )),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: checkingBottomNavigationBar(),
        bottomNavigationBar: navigationBar,
      ),
    );
  }
}
