import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:real/entity/profile.dart';
import 'dart:async';

import 'package:real/ui/profile/charts/charts.dart';

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

  Profile currentUser = Profile.currentUser();
  File imageFile;

  Future _openGallary(BuildContext context) async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File cropper = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxWidth: 200,
        maxHeight: 200,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.orange,
            toolbarTitle: "Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white),
      );
      setState(() {
        imageFile = cropper;
      });
    }
    Navigator.of(context).pop();
  }

  Future _openCamera(BuildContext context) async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      File cropper = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxWidth: 200,
        maxHeight: 200,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.orange,
            toolbarTitle: "Cropper",
            statusBarColor: Colors.deepOrange.shade900,
            backgroundColor: Colors.white),
      );
      setState(() {
        imageFile = cropper;
        print("PRIIIIIIIIINT" + cropper.toString());
      });
    }
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Загрузить фотографию"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Галерея"),
                    onTap: () {
                      _openGallary(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  GestureDetector(
                    child: Text("Камера"),
                    onTap: () {
                      _openCamera(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
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
                padding: EdgeInsets.only(left: 10, right: 10),
                child: InkWell(
                    onTap: () => _showChoiceDialog(context),
                    child: Image.asset(currentUser.imageSource)),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Column(children: [
                  Center(
                      child: Text(
                    currentUser.name,
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
              SingleChildScrollView(child: Charts()),
            ],
          ),
        ],
      ),
    );
  }
}
