import 'package:flutter/material.dart';
import 'package:real/lists/sales.dart';

class SwiperView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 4),
        height: 120,
        child: Expanded(
            child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 2.0,
                      child: InkWell(
                          onTap: () {},
                          child: Container(
                              height: 100,
                              width: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: sales[index].image),
                                  color: Color.fromRGBO(50, 65, 85, 0.8)),
                              child: Row(children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                      padding: EdgeInsets.only(top: 70),
                                      child: Column(
                                        children: [
                                          Text(sales[index].title,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                              )),
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              right: BorderSide(
                                                  width: 1,
                                                  color: Colors.white24)))),
                                ),
                              ]))));
                })));
  }
}
