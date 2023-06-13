import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



  openAlertBox(BuildContext context,{
    required String Heading,
    required String Body_text
  }) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xff3C3C3C),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.only(top: 0.0),
          content: Container(
            width: MediaQuery.of(context).size.width/1.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height*0.081,
                  width: MediaQuery.of(context).size.width/1.2,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),topRight: Radius.circular(10)
                      )
                  ),
                  child: Center(
                    child: Text(
                      Heading,
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,color: Color(0xFFF2F2F2)),
                    ),
                  ),
                ),
                SizedBox(height: 12,),
                Text(
                  Body_text,
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffF2F2F2).withOpacity(0.7)),
                  textAlign: TextAlign.center,
                  textScaleFactor: 1,),
                SizedBox(height: 24,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: (){},
                          child: Text('Yes',style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,color: Color(0xffF2F2F2)),
                          )),
                      TextButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          child: Text('No',style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,color: Color(0xffF2F2F2)),
                          ))
                    ],
                  ),
                )

              ],
            ),
          ),
        );
      });

