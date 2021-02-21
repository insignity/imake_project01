import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class CameraComponent extends StatefulWidget {
  @override
  _CameraComponentState createState() => _CameraComponentState();
}

class _CameraComponentState extends State<CameraComponent> {
  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Container(
              child: Scaffold(
                  appBar: AppBar(title: Text("Download photo")),
                  body: TabBarView(children: <Widget>[])));
        });
  }

  File imageFile;

  _openCamera(BuildContext context) async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      File cropper = await ImageCropper.cropImage(
        sourcePath: image.path,
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
  }

  _openGallery(BuildContext context) async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File cropper = await ImageCropper.cropImage(
        sourcePath: image.path,
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: 1,
          child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: FractionallySizedBox(
                        widthFactor: 1,
                        child: Container(
                            color: Colors.black12,
                            padding: EdgeInsets.only(top: 15),
                            child: Center(
                              child: Text(
                                "Загрузить фотографию",
                                style: TextStyle(fontSize: 20),
                              ),
                            )),
                      )),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 1, color: Colors.black45))),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                          child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                _openGallery(context);
                              },
                              child: Container(
                                color: Colors.black12,
                                child: Center(
                                    child: Text(
                                  "Открыть галерею",
                                )),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        width: 1, color: Colors.black45))),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                _openCamera(context);
                              },
                              child: Container(
                                color: Colors.black12,
                                child: Center(
                                    child: Text(
                                  "Сделать снимок",
                                )),
                              ),
                            ),
                          ),
                        ],
                      ))),
                ],
              )),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
      ],
    ));
  }
}
