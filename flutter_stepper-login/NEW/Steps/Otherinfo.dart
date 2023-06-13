import 'package:flutter/material.dart';

import '../widgets/testfield.dart';

class Otherinfo extends StatelessWidget {
  TextEditingController dlno= TextEditingController();
  TextEditingController validtill= TextEditingController();
  TextEditingController Premanentaddress= TextEditingController();
  TextEditingController campingskill= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWithBorder(hintText: 'Driving Licence No', textEditingController: dlno,
          height: 50,width: 333,),
        TextFieldWithBorder(hintText: 'Valid Till', textEditingController: validtill,
          height: 50,width: 334,),
        TextFieldWithBorder(hintText: 'Premanent Address', textEditingController: Premanentaddress,
          height: 50,width: 333,),
        TextFieldWithBorder(hintText: '', textEditingController: campingskill,
          height: 100,width: 332,),
        TextFieldWithBorder(hintText: '', textEditingController: campingskill,
          height: 100,width: 332,),
      ],
    );
  }
}