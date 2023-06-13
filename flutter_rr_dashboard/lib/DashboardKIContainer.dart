import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardContainer extends StatelessWidget {

  final String headtitle;
  final String? titleString;
  final double? valueString;

  /* List<AlignmentGeometry> aligning=[Alignment.topRight,Alignment.topLeft,Alignment.center,
   Alignment.bottomRight,Alignment.bottomLeft];*/

   DashboardContainer({Key? key,
  required this.headtitle,
  required this.titleString,
  required this.valueString,
  //required this.aligning
   })
      : super(key: key);



  @override
  Widget build(BuildContext context) {

    var scrnwidth = MediaQuery.of(context).size.width/2.55;
    var scrnheight = MediaQuery.of(context).size.height/5.6;
    print("width $scrnwidth height $scrnheight");

    return Container(
      //padding: EdgeInsets.all(8),
      //margin: EdgeInsets.all(9),
      width: MediaQuery.of(context).size.width/2.55,
      height: MediaQuery.of(context).size.height/5.6,


      decoration: BoxDecoration(
        color: Color(0Xff262626).withOpacity(.85),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(alignment: Alignment.center,
                child: Text('$headtitle',style: GoogleFonts.poppins(color: Colors.grey,
                    fontWeight: FontWeight.w500,fontSize: 15),)
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Rides",
                      style: GoogleFonts.poppins(
                          textStyle:
                          const TextStyle(color: Color(0Xffb0b0b0), fontSize: 13,fontWeight: FontWeight.w500))),
                  Text("${valueString}",
                      //textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          textStyle:
                          const TextStyle(color: Color(0Xffb0b0b0), fontSize: 13,fontWeight: FontWeight.w500))),
                ],
              ),
            ),
          const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("${titleString}",
                      style: GoogleFonts.poppins(
                          textStyle:
                          const TextStyle(color: Color(0Xffb0b0b0), fontSize: 13,fontWeight: FontWeight.w500))),
                  Text("${valueString}",
                      //textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          textStyle:
                          const TextStyle(color: Color(0Xffb0b0b0), fontSize: 13,fontWeight: FontWeight.w500))),
                ],
              ),
            ),

          ],
        ),
      ),
    );

  }
}
/*
Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(children: [
                        SizedBox(width: 22,),
                          DashboardContainer(
                        headtitle: 'Solo Ride',
                         valueString: 20.0),
                          SizedBox(width: 34,),
                          DashboardContainer(
                            headtitle: 'Group Ride',
                            valueString: 20.0,),
                      ]),
                      SizedBox(height: 22,),
                      Row(children: [
                        SizedBox(width: 22,),
                        DashboardContainer(
                          headtitle: 'Captain Ride',
                          valueString: 20.0,),
                        SizedBox(width: 34,),
                        DashboardContainer(
                          headtitle: 'Avg Km Per Ride',
                          valueString: 20.0,)
                      ]),
                     ],
                  ),

                  GestureDetector(
                    onTap: () {
                      print("Play game");
                    },
                    child: FractionallySizedBox(
                      widthFactor: 0.4,
                      child: Container(
                        height: 42,
                        width: 42,
                        // defining one dimension works as well, as Flutter knows how to render a circle.
//        width: MediaQuery.of(context).size.width/2,

                        decoration: BoxDecoration(
                          color: Color(0xfff2f2f2),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(Icons.edit),
                        ),
                      ),
                    ),
                  ),
                ],
              )
 */
