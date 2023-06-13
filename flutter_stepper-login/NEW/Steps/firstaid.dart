import 'package:flutter/material.dart';

import '../widgets/testfield.dart';

class Firstaid extends StatelessWidget {
  //const _Firstaid({Key? key}) : super(key: key);

  TextEditingController bloodgroup= TextEditingController();
  TextEditingController allergy= TextEditingController();
  TextEditingController othermed= TextEditingController();
  TextEditingController skills= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWithBorder(hintText: 'Blood Group', textEditingController: bloodgroup,
          height: 52,width: 298,),
        TextFieldWithBorder(hintText: 'Allergies & anaphylaxis', textEditingController: allergy,
          height: 98,width: 298,),
        TextFieldWithBorder(hintText: 'other medical condition info', textEditingController: othermed,
          height: 98,width: 298,),
        TextFieldWithBorder(hintText: 'First aid Skill', textEditingController: skills,
          height: 98,width: 298,),
      ],
    );
  }

}
