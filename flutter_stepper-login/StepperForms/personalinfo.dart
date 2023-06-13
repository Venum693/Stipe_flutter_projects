import 'package:google_fonts/google_fonts.dart';

import '../widgets/testfield.dart';

import 'package:flutter/material.dart';


class Personalinfo extends StatelessWidget {

  TextEditingController firstname= TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController nickname = TextEditingController();


  var isvalid= false;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.black,
        body: Container(

            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Text('* Input lines marked with yellow border are mandatory',
                      style: TextStyle(fontSize: 9,color: Colors.yellow)),
                  SizedBox(height:10),

                  Text('Personal info',
                    style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 20,
                        color: Color(0xfff2f2f2)
                    ),
                  ),
                  SizedBox(height:10),
                  TextFieldWithBorder(hintText: 'First Name',
                    textEditingController: firstname,
                    height: 86,width: 298,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  TextFieldWithBorder(hintText: 'Last Name',
                    textEditingController: lastname,
                    height: 86,width: 298,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),

                  TextFieldWithBorder(
                    hintText: 'Nick Name',
                    textEditingController: nickname,
                    height: 86,width: 298,),
                ],
              ),
            ))
    );
  }
}