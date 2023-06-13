import 'package:flutter/material.dart';
import 'package:flutter_login/widgets/testfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_login/StepperForms/personalinfo.dart';

import 'StepperForms/SOSdetails.dart';
import 'StepperForms/firstaid.dart';


void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget{

  @override
  _MyAppState createState() =>_MyAppState();

}

class _MyAppState extends State<StatefulWidget> with SingleTickerProviderStateMixin{

  TextEditingController firstname= TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController nickname = TextEditingController();

  int _activeCurrentStep = 0;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();


  static List<Step> _steps= [
    Step(
          title: Text(' '),
           content: Personalinfo(),
         ),
    Step(
          title: Text(' '),
          content: FirstAid(),
       ),
   Step(
           title: Text(' '),
           content: SOSdetails(),
        )
      ];

  Widget controlsBuilder(BuildContext context,ControlsDetails controlsDetails){
    return Padding(padding: EdgeInsets.all(10),
         child: Row(children: [
           ElevatedButton(onPressed: controlsDetails.onStepContinue
           , child: Text("Next",style: GoogleFonts.poppins(
                          fontSize: 16,color: Color(0xffffdd00)),),
                )
  /*if(formkey.currentState!.validate())
    {
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Row(
              children: [Icon(Icons.thumb_up_sharp),
              SizedBox(width: 20,),
              Text('Submitted'),
  ],)),
  );
  }
  },
  child: Text("Next",style: GoogleFonts.poppins(
  fontSize: 16,
  ),),
  style: ElevatedButton.styleFrom(fixedSize: Size(326, 44),
  primary: Colors.yellow),
  )

       */
  ],
  ),
  );
}


  @override
  Widget build(BuildContext context) {
   return(MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Scaffold(
       backgroundColor: Colors.black,

           appBar: AppBar(
               title: Text("Register With Us",
                   style: GoogleFonts.poppins(
                       textStyle: Theme.of(context).textTheme.headline4,
                       fontSize: 20,
                       color: Color(0xfff2f2f2)
                   )
               ),
               centerTitle: true,
               backgroundColor: Colors.black,
           ),
       body: Theme(

         data: ThemeData(canvasColor:Color(0xff262626)),
         child: Stepper(
           type: StepperType.horizontal,
           steps: _steps,
           currentStep: _activeCurrentStep,
           onStepContinue: (){
             setState(() {
               if(_activeCurrentStep < (_steps.length-1))
               {
                 _activeCurrentStep+=1;
               }else{
                 _activeCurrentStep=0;
               }
             });
             },
               onStepCancel: () {
             setState(() {
               if (_activeCurrentStep == 0) {
                 _activeCurrentStep-=1;
               }
               else{
                 _activeCurrentStep=0;
               }
             });
               },
               onStepTapped: (int index) {
                 setState(() {
                   _activeCurrentStep = index;
                 });
               },
         )
       ),
     bottomNavigationBar: BottomNavigationBar(
       backgroundColor: Colors.black,
       selectedItemColor: Colors.black87,
       unselectedItemColor: Colors.grey.shade500,
       type: BottomNavigationBarType.fixed,
       items: [
         BottomNavigationBarItem(
             icon: Image.asset('assets/Oval.png',width: 36,height: 36),
           label: 'RR'
         ),
         BottomNavigationBarItem(
           icon: Image.asset('assets/Explore unfilled.png',width: 36,height: 36),
           label: 'Explore'
         ),
         BottomNavigationBarItem(
             icon: Image.asset('assets/Oval.png',width: 36,height: 36,),
             label: 'Nav.',
         ),
         BottomNavigationBarItem(
           icon:Image.asset('assets/Oval.png',width: 36,height: 36),
             label: 'RR'

         ),
         BottomNavigationBarItem(
             icon: Image.asset('assets/Oval.png',width: 36,height: 36,),
             label: 'Profile'
         )
       ],
     ),),
   ));

  }
}
