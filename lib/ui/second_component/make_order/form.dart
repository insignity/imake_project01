import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:real/data/lists/freelancers.dart';
import 'package:real/entity/service.dart';
import 'package:real/ui/second_component/make_order/choose_time.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  void initState() {
    super.initState();
    init();
  }

  int activeIndex;
  ListView listWorker;
  ScrollController scrollController;
  int countOfItemsInBasket;
  Service lastAddedService;
  List<Service> listService;
  BoxDecoration activeMaster(int index) {
    return BoxDecoration(
        border: Border.all(color: Colors.red, width: 4.0),
        image: DecorationImage(
            fit: BoxFit.fill, image: freelancers[index].avatar));
  }

  addServiceToBasket(Service service) {
    lastAddedService = service;
    listService.add(service);
  }

  changeActiveIndex(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  delete(int index) {
    listService.removeAt(index);
  }

  init() {
    activeIndex = 0;
    listService = [];
    countOfItemsInBasket = 0;
  }

  @override
  Widget build(BuildContext context) {
    var listView = (countOfItemsInBasket > 0)
        ? ListView.builder(
            itemCount: countOfItemsInBasket,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  delete(index);
                  setState(() {
                    countOfItemsInBasket--;
                  });
                },
                child: ListTile(
                  leading: Text("Мастер " + freelancers[activeIndex].author),
                  title: Text(listService[index].name),
                  trailing: Text(listService[index].price.toString()),
                ),
              );
            },
          )
        : Container();
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
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
              elevation: 2.0,
              child: InkWell(
                  onTap: () {
                    addServiceToBasket(
                        freelancers[activeIndex].services[index]);
                    setState(() {
                      countOfItemsInBasket++;
                    });
                  },
                  child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
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
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 2.0),
                                      child: Text(
                                          freelancers[activeIndex]
                                              .services[index]
                                              .name,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                  Text(
                                      freelancers[activeIndex]
                                          .services[index]
                                          .price
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
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
      body: Container(
          child: Column(children: [
        Container(
            child: Text(
          'Выберите мастера',
          style:
              TextStyle(height: 2, fontSize: 18, fontWeight: FontWeight.bold),
        )),
        Container(
          height: 150,
          child: listWorker,
        ),
        Column(children: [
          Container(
            child: Text(
              "Виды услуг",
              style: TextStyle(
                  height: 2, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ]),
        Container(height: 150, child: listServices),
        Expanded(
            child:
                Container(alignment: Alignment.bottomCenter, child: listView)),
        ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, "/signup/time");
        }, child: Text("Выбрать время"), )
      ])),
    );
  }
}
