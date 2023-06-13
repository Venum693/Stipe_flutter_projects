
import 'package:google_fonts/google_fonts.dart';

import '../widgets/testfield.dart';
import 'package:flutter/material.dart';

class SOSdetails extends StatelessWidget{
  TextEditingController name1= TextEditingController();
  TextEditingController mobile1= TextEditingController();
  TextEditingController name2= TextEditingController();
  TextEditingController mobile2= TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                    children: [
                      Text('* Input lines ',
                          style: TextStyle(fontSize: 9,color: Colors.yellow)),

                      SizedBox(height:10),

                      Text('Person 1',
                          style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 20,
                              color: Color(0xfff2f2f2)
                          )),
                      SizedBox(height:10),

                      TextFieldWithBorder(hintText: 'name',
                        textEditingController: name1,
                        height: 98,width: 298,
                      ),

                      SizedBox(height:10),

                      TextFieldWithBorder(hintText: 'Mobile',
                        textEditingController: mobile1,
                        height: 98,width: 298,
                      ),

                      SizedBox(height:10),

                      Text('Person 2',
                          style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.headline4,
                              fontSize: 20,
                              color: Color(0xfff2f2f2)
                          )),
                      SizedBox(height:10),

                      TextFieldWithBorder(hintText: 'name',
                        textEditingController: name2,
                        height: 98,width: 298,
                      ),

                      SizedBox(height:10),

                      TextFieldWithBorder(hintText: 'Mobile',
                        textEditingController: mobile2,
                        height: 98,width: 298,
                      ),

                    ]
                )
            )
        )
    );
  }
}