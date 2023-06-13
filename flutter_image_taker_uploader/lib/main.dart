import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//url='https://api-ecart-vendor.rotam.ai/ecart/vendor/update-profile-pic/7676767676';


void main() {
  runApp(k());
}

class k extends StatefulWidget {
  @override
  _kState createState() => _kState();
}

class _kState extends State<k> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController textController = TextEditingController();
  String displayText = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Upload"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [

              ElevatedButton.icon(label: const Text(
                "Gallery",
                style: TextStyle(
                  color: Colors.yellow,
                ),
              ),
                onPressed: () {

                },

                icon: Icon(Icons.photo),
                style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40) // Background color
                ),

              ),ElevatedButton.icon(
                label: Text(
                  "Camera",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {

                }, icon: Icon(Icons.add_a_photo_outlined),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 40)
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(28.0),
                child: TextField(

                  controller: textController,
                  maxLines: null,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      label: Text('PHONE NUMBER'),
                      hintText: 'Entere phone no.',
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              ElevatedButton(onPressed: () {
                setState(() {
                  displayText = textController.text;
                  uploadfile();
                });
                //uploadPhotos(image!.path, textController.text);
              }, child: Text("Submit")),
              Text(displayText,style: TextStyle(fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }


  Future uploadfile() async {
    var dio = Dio();

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path ?? " ");

      String filename = file.path
          .split('/')
          .last;

      String filepath = file.path;

      FormData data = FormData.fromMap({
        'key': 'eb27939496d613bec38ef11ba0737eaa',
        'image': await MultipartFile.fromFile(filepath, filename: filename),
        'name': ''
      });

      var response = await dio.post("https://api.imgbb.com/1/upload",
          data: data, onSendProgress: (int sent, int total) {
            print('This is $sent, and this is $total');
          });
    }
    else {
      print("result is null");
    }
  }
}