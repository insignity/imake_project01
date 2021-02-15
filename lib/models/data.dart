import 'package:flutter/widgets.dart';

class Data with ChangeNotifier {
  String _type = "Client";
  List<String> types = ['Client', 'Freelancer'];

  String get getData => _type;

  changeType() {
    if (_type == types[0]) {
      _type = types[1];
    } else {
      _type = types[0];
    }
    notifyListeners();
  }
}
