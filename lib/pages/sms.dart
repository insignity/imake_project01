import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';

class SmsPage extends StatefulWidget {
  @override
  _SmsPageState createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {
  String _code;
  String signature = "{{ app signature }}";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(50, 65, 85, 1),
        textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          headline2: TextStyle(
              color: Colors.white70,
              fontSize: 10,
              fontWeight: FontWeight.normal),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Подтверждение номера'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //PhoneFieldHint(),
              Spacer(),
              Spacer(),
              PinFieldAutoFill(
                codeLength: 4,
                decoration: UnderlineDecoration(
                  textStyle: TextStyle(fontSize: 20, color: Colors.black),
                  colorBuilder:
                      FixedColorBuilder(Colors.black.withOpacity(0.3)),
                ),
                currentCode: _code,
                onCodeSubmitted: (code) {},
                onCodeChanged: (code) {
                  if (code.length == 4) {
                    FocusScope.of(context).requestFocus(FocusNode());
                  }
                },
              ),
              Spacer(),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/auth/sms/home");
                },
                child: Text("ОК"),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Назад"),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
