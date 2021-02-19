import 'package:flutter/material.dart';
import 'package:real/domain/current_profile.dart';
import 'package:provider/provider.dart';
import 'package:real/models/user.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String isUserClient() {
    if (context.watch<Profile>().isUserClient)
      return "Стать исполнителем";
    else
      return "Стать клиентом";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Image.asset(currentProfile.imageSource),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Column(children: [
                  Center(
                      child: Text(
                    currentProfile.name,
                    style: TextStyle(color: Colors.white),
                  )),
                  Center(
                    child: ElevatedButton(
                        child: Text(isUserClient()),
                        onPressed: () => context.read<Profile>().changeType()),
                  )
                ]),
              ),
            )
          ]),
          Column(
            children: [
              Text(
                "История заказов",
                style: TextStyle(color: Colors.white),
              ),
              SingleChildScrollView(
                child: Container(
                  height: 500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
