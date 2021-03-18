import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real/entity/profile.dart';
import 'package:real/ui/first_component/client_form.dart';
import 'package:real/ui/first_component/freelancer_form.dart';

class FreePlatformPage extends StatefulWidget {
  FreePlatformPage({Key key}) : super(key: key);

  @override
  _FreePlatformPageState createState() => _FreePlatformPageState();
}

class _FreePlatformPageState extends State<FreePlatformPage> {
  @override
  Widget build(BuildContext context) {
    return context.watch<Profile>().isUserClient
        ? ClientForm()
        : FreelancerForm();
  }
}
