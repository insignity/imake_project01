import 'dart:io';

import 'package:flutter/material.dart';
import 'package:real/models/profile.dart';

class CurrentProfile {
  String _name;
  bool _typeOfClient = true; //Is he currently worker or user?
  File _image;
  get image => _image == null ? AssetImage('assets/images/wat.png') : _image;
  set image(File imageFile) => _image = imageFile;

  get name => _name.isEmpty ? "Валентина" : _name;

  CurrentProfile();
}
