import 'package:flutter/widgets.dart';

class Data with ChangeNotifier {
  bool _type = false;

  bool get isUserClient => _type;

  changeType() {
    if (_type == false) {
      _type = true;
    } else {
      _type = false;
    }
    notifyListeners();
  }
}
