import 'package:google_fonts/google_fonts.dart';

import '../widgets/testfield.dart';
import 'package:flutter/material.dart';

class FirstAid extends StatelessWidget {

  TextEditingController bloodgroup= TextEditingController();
  TextEditingController Allergies= TextEditingController();
  TextEditingController medical= TextEditingController();
  TextEditingController firstaid= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Text('* Input lines marked with yellow border are mandatory',
                  style: TextStyle(fontSize: 9,color: Colors.yellow)),
              SizedBox(height:10),

              Text('First Aid',
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 20,
                      color: Color(0xfff2f2f2)
                  )),
              SizedBox(height:10),
              TextFieldWithBorder(hintText: 'Blood Group',
                textEditingController: bloodgroup,
                height: 86,width: 298,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(height:10),
              TextFieldWithBorder(hintText: 'Allergies & Anaphylaxis',
                textEditingController: Allergies,
                height: 98,width: 298,
              ),

              SizedBox(height:10),
              TextFieldWithBorder(hintText: 'Other Medical Condition info',
                textEditingController: medical,
                height: 98,width: 298,

              ),
              SizedBox(height:10),
              TextFieldWithBorder(hintText: 'First Aid Skills',
                textEditingController: firstaid,
                height: 98,width: 298,

              ),

            ],
          ),

        ),
      ),
    );
  }
}