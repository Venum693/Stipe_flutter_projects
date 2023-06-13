
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_learn/Steps/personalinfo.dart';

import 'Steps/Otherinfo.dart';
import 'Steps/firstaid.dart';
import 'Steps/sosdetails.dart';


void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stepper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CheckoutPage(),
    );
  }
}
class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  int _currentStep=0;


  static  List<Step> _steps = [
    Step(
      title: Text(' '),
      content: Personalinfo(),
      //state: _currentStep >=0 ? StepState.complete : StepState.indexed,
      isActive: true,
    ),
    Step(
      title: Text(' '),
      content: Firstaid(),
    ),
    Step(
      title: Text(' '),
      content: Sosdetails(),
    ),
    Step(
      title: Text(' '),
      content: Otherinfo(),
    )
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Stepper(
        type: StepperType.horizontal,
        controlsBuilder: (BuildContext context, ControlsDetails controls) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: controls.onStepContinue,
                  style: ElevatedButton.styleFrom(primary: Colors.yellow,minimumSize: Size(300,50)),
                  child: Text('NEXT',style: GoogleFonts.poppins(fontSize: 16,color: Colors.black))

                ),
                /*if (_currentStep != 0)
                  TextButton(
                    onPressed: controls.onStepCancel,
                    child: const Text(
                      'BACK',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),*/
              ],
            ),
          );
        },

          onStepTapped: (step) => setState(() => _currentStep = step),
          onStepContinue: () {
            setState(() {
              if (_currentStep < _steps.length - 1) {
                _currentStep += 1;
              } else {
                _currentStep = 0;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (_currentStep > 0) {
                _currentStep -= 1;
              } else {
                _currentStep = 0;
              }
            });
          },
          currentStep: _currentStep,
          steps: _steps,
        ),
    );
  }
}




