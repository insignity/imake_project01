import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:real/pages/home.dart';
import 'package:real/services/auth.dart';

class AuthorizationPage extends StatefulWidget {
  AuthorizationPage({Key key}) : super(key: key);
  @override
  AuthorizationPageState createState() => AuthorizationPageState();
}

class AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _email;
  String _password;
  bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
          padding: EdgeInsets.only(top: 150),
          child: Align(
              alignment: Alignment.center,
              child: Text(
                "CHEK PAVUK",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )));
    }

    Widget _input(Icon icon, String hint, TextEditingController controller,
        bool obsecure) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obsecure,
          style: TextStyle(fontSize: 20, color: Colors.white),
          decoration: InputDecoration(
            hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white30),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white54, width: 1)),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: IconTheme(
                data: IconThemeData(color: Colors.white),
                child: icon,
              ),
            ),
          ),
        ),
      );
    }

    Widget _button(String text) {
      return ElevatedButton(
          child: Text(text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 20)),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          });
    }

    Widget _form(String label, void func()) {
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child:
                  _input(Icon(Icons.email), "EMAIL", _emailController, false),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child: _input(
                  Icon(Icons.lock), "PASSWORD", _passwordController, true),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: _button(label),
              ),
            )
          ],
        ),
      );
    }

    _loginButtonAction() {
      _email = _emailController.text;
      _password = _passwordController.text;
      if (_email.isNotEmpty && _password.isNotEmpty) {
        return HomePage();
      } else if (_email.isEmpty || _password.isEmpty) {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    _registerButtonAction() {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email.isNotEmpty && _password.isNotEmpty) {
        return HomePage();
      } else if (_email.isEmpty || _password.isEmpty) {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    Widget _bottomWave() {
      return Expanded(
        child: Align(
          child: ClipPath(
            child: Container(
              color: Colors.white,
              height: 300,
            ),
          ),
          alignment: Alignment.bottomCenter,
        ),
      );
    }

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: <Widget>[
            _logo(),
            SizedBox(
              height: 100,
            ),
            (showLogin
                ? Column(
                    children: <Widget>[
                      _form('Login', _loginButtonAction),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                          child: Text(
                            'No registered yet? Register!',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              showLogin = false;
                            });
                          },
                        ),
                      )
                    ],
                  )
                : Column(
                    children: <Widget>[
                      _form('REGISTER', () {}), //_registerButtonAction),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                          child: Text(
                            'Already registered? Login!',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              showLogin = true;
                            });
                          },
                        ),
                      )
                    ],
                  )),
          ],
        ));
  }
}
