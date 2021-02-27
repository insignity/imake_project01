import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gender_selection/gender_selection.dart';
import 'package:real/pages/home.dart';

class AuthorizationPage extends StatefulWidget {
  AuthorizationPage({Key key}) : super(key: key);
  @override
  AuthorizationPageState createState() => AuthorizationPageState();
}

class AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  String _phoneNumber;
  String _password;
  bool showLogin = false;

  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Padding(
          padding: EdgeInsets.only(top: 150),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    "assets/images/comb.png",
                    color: Colors.white,
                    height: 50,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "iMake",
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ));
    }

    Future _selectDate() async {
      DateTime picked = await showDatePicker(
          context: context,
          initialDate: DateTime(1990),
          firstDate: DateTime(1930),
          lastDate: DateTime(2020));
    }

    Widget _input(Icon icon, String hint, TextEditingController controller,
        TextInputType keyboardType) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
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
          keyboardType: keyboardType,
        ),
      );
    }

    Widget _dateOfBirth(
        Icon icon, String hint, TextEditingController controller) {
      return InkWell(
        onTap: () {
          _selectDate(); // Call Function that has showDatePicker()
        },
        child: IgnorePointer(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: controller,
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
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
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
            Navigator.pushNamed(context, '/auth/sms');
          });
    }

    nothing() {}
    DateTime _dateTime = DateTime.now();
    Widget _registerForm(String label, void func()) {
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: _input(Icon(Icons.person), "Ваше имя", _nameController,
                  TextInputType.name),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Дата рождения:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white30),
                      )),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 100,
                    child: CupertinoTheme(
                      data: CupertinoThemeData(
                        textTheme: CupertinoTextThemeData(
                          dateTimePickerTextStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        maximumYear: 2021,
                        minimumYear: 1930,
                        initialDateTime: DateTime.utc(1990),
                        onDateTimeChanged: (dateTime) {
                          setState(() {
                            _dateTime = dateTime;
                          });
                        },
                      ),
                    ),
                  ),
                ]) // _dateOfBirth(Icon(Icons.calendar_today), "Дата рождения",_calendarController),
                ),
            Column(children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Ваш пол:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white30),
                  )),
              GenderSelection(
                onChanged: nothing(),
                padding: EdgeInsets.only(bottom: 1),
                selectedGenderIconColor: Colors.white,
                selectedGenderIconBackgroundColor: Colors.white,
                unSelectedGenderTextStyle:
                    TextStyle(fontSize: 18, color: Colors.white54),
                selectedGenderTextStyle:
                    TextStyle(color: Colors.white, fontSize: 18),
                femaleImage: NetworkImage(
                    "https://cdn0.iconfinder.com/data/icons/avatar-vol-2-4/512/3-512.png"),
                maleImage: NetworkImage(
                    "https://cdn0.iconfinder.com/data/icons/avatar-vol-2-4/512/5-512.png"),
                maleText: "Мужской", //default Male
                femaleText: "Женский", //default Female
                selectedGenderCheckIcon: null, // default Icons.check
                animationDuration: Duration(milliseconds: 300),
                size: 60, //default : 120
              ),
            ] //_input(Icon(Icons.code), "Пол", _genderController),
                ),
            // GENDER======================
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child: _input(Icon(Icons.dialpad_rounded), "Номер",
                  _phoneNumberController, TextInputType.phone),
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

    Widget _loginForm(String label, void func()) {
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child: _input(Icon(Icons.dialpad_rounded), "Номер",
                  _phoneNumberController, TextInputType.phone),
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
      _phoneNumber = _phoneNumberController.text;
      _password = _passwordController.text;
      if (_phoneNumber.isNotEmpty && _password.isNotEmpty) {
        return HomePage();
      } else if (_phoneNumber.isEmpty || _password.isEmpty) {
        _phoneNumberController.clear();
        _passwordController.clear();
      }
    }

    _registerButtonAction() {
      _phoneNumber = _phoneNumberController.text;
      _password = _passwordController.text;

      if (_phoneNumber.isNotEmpty && _password.isNotEmpty) {
        return HomePage();
      } else if (_phoneNumber.isEmpty || _password.isEmpty) {
        _phoneNumberController.clear();
        _passwordController.clear();
      }
    }

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _logo(),
              SizedBox(
                height: 30,
              ),
              (showLogin
                  ? Column(
                      children: <Widget>[
                        _registerForm('Зарегистрироваться', _loginButtonAction),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: GestureDetector(
                            child: Text(
                              'Уже зарегистрированы? Войдите!',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
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
                        _loginForm('Войти', () {}), //_registerButtonAction),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: GestureDetector(
                            child: Text(
                              'Ещё не зарегистрированы? Зарегистрируйтесь!',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
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
          ),
        ));
  }
}
