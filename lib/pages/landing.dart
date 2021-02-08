import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth.dart';
import 'home.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final DomainUser user = Provider.of<DomainUser>(context);
    final bool isLoggedIn = false; //user != null;

    return isLoggedIn ? HomePage() : AuthorizationPage();
  }
}
