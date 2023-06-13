
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'alertbox.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Alert Box",
      home: DialogBox(),
    );
  }
}


class DialogBox extends StatelessWidget {
  const DialogBox({super.key});


  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width/1.2;
    var screenheight = MediaQuery.of(context).size.height*0.081;

    print('Width $screenwidth and height $screenheight');

    return Scaffold(
      appBar: (AppBar
        (
        centerTitle: true,
        title: Text('Ride Info', style: GoogleFonts.poppins(
            fontSize: 20, fontWeight: FontWeight.w500)),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert_outlined,),
            onPressed: () {
              openAlertBox(context ,
                  Heading: 'Please Confirm',
                  Body_text: 'Are You Sure You Want To Delete The Ride Permanently ?');
            },)
        ],
      )),
    );
  }

}

