import 'package:flutter/material.dart';
import 'package:real/domain/order.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class AllPosts extends StatefulWidget {
  @override
  _AllPostsState createState() => _AllPostsState();
}

class _AllPostsState extends State<AllPosts> {
  List<Widget> _imageListLeft(int count) => List.generate(
        count,
        (i) => FittedBox(
          child: Container(
            padding: EdgeInsets.all(2),
            child: Image.asset(
              'assets/images/posts/left/i$i' + '_200.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
  List<Widget> _imageListRight(int count) => List.generate(
        count,
        (i) => FittedBox(
          child: Container(
            padding: EdgeInsets.all(2),
            child: Image.asset(
              'assets/images/posts/right/i$i' + '_200.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            children: _imageListLeft(8),
          ),
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: _imageListRight(7),
            )),
      ]),
    );
  }
}
