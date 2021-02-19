import 'package:flutter/material.dart';

class Profile with ChangeNotifier {
  //int id;
  //String surname;
  //int phoneNumber;
  //double lat;
  //double lon;
  String name;
  bool _typeOfClient = true; //Is he currently worker or user?
  String imageSource;
  bool get isUserClient => _typeOfClient;
  changeType() {
    if (_typeOfClient == false) {
      _typeOfClient = true;
    } else {
      _typeOfClient = false;
    }
    notifyListeners();
  }

  Profile({this.name, this.imageSource});
}
