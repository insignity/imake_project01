import 'package:flutter/material.dart';
import 'package:real/data/lists/freelancers.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  ListView listWorker;
  ScrollController scrollController;
  int activeIndex = -1;

  BoxDecoration activeMaster(int index) {
    return BoxDecoration(
        border: Border.all(color: Colors.red, width: 4.0),
        image: DecorationImage(
            fit: BoxFit.fill, image: freelancers[index].avatar));
  }

  changeActiveIndex(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var listWorker = ListView.builder(
        controller: scrollController,
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
              elevation: 2.0,
              child: InkWell(
                  onTap: () {
                    changeActiveIndex(index);
                  },
                  child: Container(
                      height: 150,
                      width: 150,
                      decoration: index == activeIndex
                          ? activeMaster(index)
                          : BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: freelancers[index].avatar),
                              color: Color.fromRGBO(50, 65, 85, 0.8)),
                      child: Row(children: [
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.only(top: 100),
                              child: Column(
                                children: [
                                  Text(freelancers[index].author,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white70,
                                      )),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 1, color: Colors.white24)))),
                        ),
                      ]))));
        });
    var listServices = ListView.builder(
        controller: scrollController,
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
              elevation: 2.0,
              child: InkWell(
                  onTap: () {
                    //changeActiveIndex(index);
                  },
                  child: Container(
                      height: 150,
                      width: 150,
                      decoration:
                          /*index == activeIndex
                          ? activeMaster(index)
                          : */
                          BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: freelancers[activeIndex]
                                      .services[index]
                                      .image),
                              color: Color.fromRGBO(50, 65, 85, 0.8)),
                      child: Row(children: [
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.only(top: 100),
                              child: Column(
                                children: [
                                  Text(
                                      freelancers[activeIndex]
                                          .services[index]
                                          .name,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white70,
                                      )),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 1, color: Colors.white24)))),
                        ),
                      ]))));
        });
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Записаться')),
      ),
      body: Column(
        children: [
          Container(
              child: Text(
            'Выберите мастера',
            style:
                TextStyle(height: 2, fontSize: 18, fontWeight: FontWeight.bold),
          )),
          Container(height: 150, child: listWorker),
          ((activeIndex > -1) && (activeIndex < 6))
              ? Column(
                  children: [
                    Container(
                      child: Text(
                        "Ввиды услуг",
                        style: TextStyle(
                            height: 2,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(height: 150, child: listServices),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
