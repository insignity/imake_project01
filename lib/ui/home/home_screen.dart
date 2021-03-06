import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real/ui/first_component/free-platform.dart';
import 'package:real/ui/all_posts/all-posts.dart';
import 'package:real/ui/second_component/search.dart';
import 'package:real/ui/profile/profile_component.dart';
import 'package:real/ui/download/camera_component.dart';

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
        Icon(Icons.person_search),
        Icon(Icons.control_point_sharp),
        Icon(Icons.auto_awesome_mosaic),
        Icon(Icons.portrait_rounded)
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

    callBottomNavigationBarItem(int sectionIndex) {
      switch (sectionIndex) {
        case 0:
          return FreePlatformPage();
          break;
        case 1:
          return Freelancers();
          break;
        case 2:
          return CameraComponent();
          break;
        case 3:
          return AllPosts();
          break;
        case 4:
          return HistoryPage();
          break;
      }
    }

    titleBottomNavigationBar() {
      switch (sectionIndex) {
        case 0:
          return 'FreePlatformPage';
          break;
        case 1:
          return 'Representatives';
          break;
        case 2:
          return 'CameraComponent';
          break;
        case 3:
          return 'AllPosts';
          break;
        case 4:
          return 'ProfilePage';
          break;
      }
    }

    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(titleBottomNavigationBar()),
          leading: Icon(
            Icons.reorder,
            size: 50,
          ),
        ),
        body: callBottomNavigationBarItem(sectionIndex),
        bottomNavigationBar: navigationBar,
      ),
    );
  }
}
